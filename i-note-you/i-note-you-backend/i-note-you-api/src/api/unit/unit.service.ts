import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectDataSource } from '@nestjs/typeorm';
import { CourseUnitRepository } from 'src/entities/course-unit';
import { UnitMaterialRepository } from 'src/entities/course-unit-material';
import { UnitNoteRepository } from 'src/entities/course-unit-note';
import { UnitVideoRepository } from 'src/entities/course-unit-video';
import { JiebaService } from 'src/util/jieba';
import { DataSource, In } from 'typeorm';
import { CreateMaterialDto } from './dto/create-material.dto';
import { S3Client, GetObjectCommand } from '@aws-sdk/client-s3';
import * as PDF from 'pdf-parse';
import { TeacherCourseService } from '../course/teacher-course/teacher-course.service';
import { CourseMemberRepository } from 'src/entities/course-member';
import { CourseMemberIdentity } from 'src/common/enum/course-member-identity';
import { UnitAllNoteRepository } from 'src/entities/course-unit-all-note';
import { UserService } from '../user/user.service';
@Injectable()
export class UnitService {
  private unitNoteRepository: UnitNoteRepository;
  private unitAllNoteRepository: UnitAllNoteRepository;
  private courseUnitRepository: CourseUnitRepository;
  private unitMaterialRepository: UnitMaterialRepository;
  private unitVideoRepository: UnitVideoRepository;
  private courseMemberRepository: CourseMemberRepository;
  private jiebaService: JiebaService;
  private s3Client: S3Client;
  constructor(
    @InjectDataSource() private dataSourse: DataSource,
    private teacherCourseService: TeacherCourseService,
    private userService: UserService,
  ) {
    this.unitNoteRepository = new UnitNoteRepository(this.dataSourse.manager);
    this.unitMaterialRepository = new UnitMaterialRepository(
      this.dataSourse.manager,
    );
    this.courseUnitRepository = new CourseUnitRepository(
      this.dataSourse.manager,
    );
    this.unitVideoRepository = new UnitVideoRepository(this.dataSourse.manager);
    this.courseMemberRepository = new CourseMemberRepository(
      this.dataSourse.manager,
    );
    this.unitAllNoteRepository = new UnitAllNoteRepository(
      this.dataSourse.manager,
    );
    this.jiebaService = new JiebaService();
    this.s3Client = new S3Client({ region: process.env.AWS_REGION });
  }

  async createMaterial(ctx: CreateMaterialDto) {
    const material = await this.unitMaterialRepository.save(ctx);
    return material;
  }

  //unit

  async getUnitsByCourseId(courseId: string) {
    const units = await this.courseUnitRepository.findBy({ courseId });
    return units;
  }

  async getMaterialsByUnitId(unitId: string) {
    const materials = await this.unitMaterialRepository.findBy({ unitId });
    return materials;
  }

  async getVideosByUnitId(unitId: string) {
    const videos = await this.unitVideoRepository.findBy({ unitId });
    return videos;
  }

  async getCourseMemberByUnitId(
    unitId: string,
    identity: 'all' | 'student' | 'teacher' = 'all',
  ) {
    const unit = await this.courseUnitRepository.findOneBy({ id: unitId });

    switch (identity) {
      case 'all':
        return await this.courseMemberRepository.findBy({
          courseId: unit.courseId,
        });
      case 'student':
        return await this.courseMemberRepository.findBy({
          courseId: unit.courseId,
          identity: CourseMemberIdentity.Student,
        });
      case 'teacher':
        return await this.courseMemberRepository.findBy({
          courseId: unit.courseId,
          identity: CourseMemberIdentity.Teacher,
        });
    }
  }

  //note

  async getNote(unitId: string, courseMemberId: string) {
    const note = await this.unitNoteRepository.findOneBy({
      unitId,
      courseMemberId,
    });
    if (!note) {
      return await this.createNote(unitId, courseMemberId);
    }
    // const videoKeywords = await this.getVideoKeyword(unitId);
    // videoKeywords.forEach((videoKeyword) => {
    //   note.content = note.content.replace(
    //     new RegExp(videoKeyword, 'g'),
    //     `<br>${videoKeyword}<br>`,
    //   );
    // });
    return note;
  }

  async getTeacherNoteByUnitId(unitId: string) {
    const teacherCourseMember = (
      await this.getCourseMemberByUnitId(unitId, 'teacher')
    )[0];
    const teacherNote = (
      await this.unitNoteRepository.findOneBy({
        unitId,
        courseMemberId: teacherCourseMember.id,
      })
    ).content;
    if (!teacherNote) {
      return '';
    }
    return teacherNote;
  }

  async createNote(unitId: string, courseMemberId: string, content = '') {
    const note = this.unitNoteRepository.create({
      unitId,
      courseMemberId,
      content,
      similarity: 0,
    });
    return await this.unitNoteRepository.save(note);
  }

  async updateNote(ctx: {
    unitId: string;
    courseMemberId: string;
    content: string;
  }) {
    const { unitId, courseMemberId, content } = ctx;
    const note = await this.getNote(unitId, courseMemberId);
    if (!note) {
      return await this.createNote(unitId, courseMemberId, content);
    }

    const teacherNote = await this.getTeacherNoteByUnitId(unitId);

    const similarity = await this.getSimilarity(content, teacherNote);

    return await this.unitNoteRepository.save({
      id: note.id,
      ...ctx,
      similarity,
    });
  }

  async getSimilarity(beCompareNote1: string, mainNote2: string) {
    const keyword1 = await this.jiebaService.cutWord(beCompareNote1);
    const keyword2 = await this.jiebaService.cutWord(mainNote2);
    let appearCount = 0;
    const keyword1Arr = keyword1.map((cutKeyword) => {
      return cutKeyword.keyword;
    });
    const keyword2Arr = keyword2.map((cutKeyword) => {
      return cutKeyword.keyword;
    });

    keyword2Arr.forEach((value) => {
      if (keyword1Arr.indexOf(value) != -1) {
        appearCount++;
      }
    });
    return (appearCount / keyword2Arr.length) * 100;
  }

  async getUnitKeyword(unitId: string, courseMemberId?: string) {
    const students = await this.getCourseMemberByUnitId(unitId, 'student');
    const studentIds = students.map((student) => student.id);
    const studentNotes = await this.unitNoteRepository.findBy({
      unitId,
      courseMemberId: In(studentIds),
    });
    let allNote = '';
    studentNotes.forEach((studentNote) => {
      allNote += `${studentNote.content} \n`;
    });
    console.log(192, studentNotes);
    const keywordArray = await this.jiebaService.cutWord(allNote);
    //全班總關鍵字總次數
    let allCount = 0;
    keywordArray.forEach((textValue) => {
      allCount += textValue.count;
    });
    const newArray: { keyword: string; allRate: number; ownRate?: number }[] =
      [];

    let cutCourseMemberNote;
    let courseMemberCount = 0;
    if (courseMemberId) {
      const courseMemberNote = studentNotes.filter((studentNote) => {
        return studentNote.courseMemberId === courseMemberId;
      });
      if (courseMemberNote.length === 0) {
        throw new NotFoundException({
          message: 'not find this member in this unit',
        });
      }
      cutCourseMemberNote = await this.jiebaService.cutWord(
        courseMemberNote[0].content,
      );
      cutCourseMemberNote.forEach((textValue) => {
        courseMemberCount += textValue.count;
      });
    }

    for (const keyword of keywordArray) {
      const param = {
        keyword: keyword.keyword,
        allRate: (keyword.count / allCount) * 100,
        ownRate: 0,
      };
      if (cutCourseMemberNote != undefined) {
        const courseMemberKeyword = cutCourseMemberNote.filter(
          (cutNote) => cutNote.keyword === keyword.keyword,
        )[0];
        if (courseMemberKeyword) {
          param.ownRate = (courseMemberKeyword.count / courseMemberCount) * 100;
        }
      }

      newArray.push(param);
    }
    return newArray;
  }

  async createTeacherNote(unitId: string) {
    const materials = (await this.getMaterialsByUnitId(unitId)).filter(
      (material) => material.url.substring(material.url.length - 3) === 'pdf',
    );
    let allNote = '';
    let allChunks: Buffer[] = [];
    for await (const material of materials) {
      const pdfData = (
        await this.s3Client.send(
          new GetObjectCommand({
            Bucket: 'i-note-you-s3',
            Key: `office/${material.url.substring(61)}`,
          }),
        )
      ).Body;
      const streamToBuffer = (stream): Promise<Buffer[]> =>
        new Promise((resolve, reject) => {
          const chunks: Buffer[] = [];
          stream.on('data', (chunk) => chunks.push(chunk));
          stream.on('error', reject);
          stream.on('end', () => resolve(chunks));
        });
      const newChunk = await streamToBuffer(pdfData);
      allNote += (await PDF(Buffer.concat(newChunk))).text;
      allChunks = allChunks.concat(newChunk);
    }

    const unit = await this.courseUnitRepository.findOneBy({ id: unitId });
    const teacher = await this.teacherCourseService.getTeacherByCourseId(
      unit.courseId,
    );
    const param = {
      unitId,
      courseMemberId: teacher.courseMemberId,
      content: allNote,
    };

    const teacherNote = await this.updateNote(param);
    return teacherNote;
  }

  async getAllNotesByUnitId(unitId: string) {
    const members = await this.getCourseMemberByUnitId(unitId, 'student');
    const memberIds = [];
    const memberUserIds = [];
    members.forEach((member) => {
      memberIds.push(member.id);
      memberUserIds.push(member.userId);
    });
    const allNotes = await this.unitNoteRepository.findBy({
      unitId,
      courseMemberId: In(memberIds),
    });
    const users = await this.userService.getUserByUserIds(memberUserIds);
    const membersAndUser = members.map((member) => {
      const userData = users.filter((user) => user.id === member.userId)[0];
      member.user = userData;
      return member;
    });

    return allNotes.map((note) => {
      const userData = membersAndUser.filter(
        (member) => member.id === note.courseMemberId,
      )[0];
      note['image'] = userData.user.image;
      note['name'] = userData.user.name;
      return note;
    });
  }

  //全班和歷屆共同筆記
  async createClassNote(unitId: string) {
    const courseMembers = await this.getCourseMemberByUnitId(unitId, 'student');
    const courseMemberIds = courseMembers.map(
      (courseMember) => courseMember.id,
    );
    const unitNotes = (
      await this.unitNoteRepository.findBy({
        unitId,
        courseMemberId: In(courseMemberIds),
      })
    ).sort((a, b) => b.content.length - a.content.length);
    let mainNote: string = unitNotes.shift().content;
    const mainNoteKeyword = (await this.jiebaService.cutWord(mainNote)).map(
      (value) => value.keyword,
    );

    for (const unitNote of unitNotes) {
      const classSentences = unitNote.content
        .replace(/。/g, '\\n')
        .split('\\n');
      for (const classSentence of classSentences) {
        const keyword = (await this.jiebaService.cutWord(classSentence)).map(
          (value) => {
            return value.keyword;
          },
        );
        if (!classSentence) {
          continue;
        }
        if (!keyword.every((value) => mainNoteKeyword.includes(value))) {
          mainNote += classSentence;
          console.log(310, `加入句子：  ${classSentence}`);
        }
      }
    }
    console.log(278, mainNote);
    return mainNote;
  }

  //video
  //獲取unit所有影片的keyword
  async getVideoKeyword(unitId: string) {
    const videos: { videoId: string; keywords: string[] }[] =
      await this.unitVideoRepository
        .createQueryBuilder('video')
        .select(['video.id as id', 'videoKeywords.keywords as keywords'])
        .innerJoin('video.videoKeywords', 'videoKeywords')
        .where('video.unitId = :unitId', { unitId })
        .getRawMany();
    let keywords: string[] = [];
    videos.forEach((video) => {
      keywords = keywords.concat(video.keywords);
    });

    const noRepeatKeywords: string[] = [];
    keywords.forEach((keyword) => {
      if (!noRepeatKeywords.includes(keyword)) {
        noRepeatKeywords.push(keyword);
      }
    });
    return noRepeatKeywords.sort((a, b) => b.length - a.length);
  }

  async getSpecialVideoKeyword(unitId: string, keyword: string) {
    const videos = await this.unitVideoRepository
      .createQueryBuilder('video')
      .innerJoinAndSelect('video.videoKeywords', 'videoKeywords')
      .where('video.unitId = :unitId', { unitId })
      .getMany();
    videos.forEach((video) => {
      video.videoKeywords = video.videoKeywords
        .filter((value) => {
          return value.keywords.includes(keyword);
        })
        .map((videoKeyword) => {
          videoKeyword['title'] = video.title;
          return videoKeyword;
        });
    });
    return videos;
  }
}
