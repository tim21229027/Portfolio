import { Injectable, Logger, NotFoundException } from '@nestjs/common';
import { InjectDataSource } from '@nestjs/typeorm';
import { customAlphabet } from 'nanoid';
import { UserService } from 'src/api/user/user.service';
import { CourseMemberIdentity } from 'src/common/enum/course-member-identity';
import { VideoAnalyzeStatus } from 'src/common/enum/video-analyze-status';
import { CourseRepository } from 'src/entities/course';
import { CourseMemberRepository } from 'src/entities/course-member';
import { CourseNotifyRepository } from 'src/entities/course-notify';
import { CourseUnitRepository } from 'src/entities/course-unit';
import { UnitMaterialRepository } from 'src/entities/course-unit-material';
import { UnitVideoRepository } from 'src/entities/course-unit-video';
import { NotifyReadRepository } from 'src/entities/notify-read';
import { User } from 'src/entities/user';
import { UploadFileService } from 'src/util/upload-file';
import { VideoService } from 'src/util/video-service';
import { DataSource } from 'typeorm';
import { CreateOutlineDto } from './dto/create-outline.dto';
import { CreateTeacherCourseDto } from './dto/create-teacher-course.dto';

@Injectable()
export class TeacherCourseService {
  private logger = new Logger('TeacherCourseService');
  private courseRepository: CourseRepository;
  private courseMemberRepository: CourseMemberRepository;
  private courseUnitRepository: CourseUnitRepository;
  private unitMaterialRepository: UnitMaterialRepository;
  private unitVideoRepository: UnitVideoRepository;
  private courseNotifyRepository: CourseNotifyRepository;
  private notifyReadRepository: NotifyReadRepository;
  private videoService: VideoService;
  private uploadFileService: UploadFileService;

  constructor(
    @InjectDataSource() private dataSource: DataSource,
    private userService: UserService,
  ) {
    this.courseRepository = new CourseRepository(this.dataSource.manager);
    this.courseUnitRepository = new CourseUnitRepository(
      this.dataSource.manager,
    );
    this.courseMemberRepository = new CourseMemberRepository(
      this.dataSource.manager,
    );
    this.unitMaterialRepository = new UnitMaterialRepository(
      this.dataSource.manager,
    );
    this.unitVideoRepository = new UnitVideoRepository(this.dataSource.manager);
    this.courseNotifyRepository = new CourseNotifyRepository(
      this.dataSource.manager,
    );
    this.notifyReadRepository = new NotifyReadRepository(
      this.dataSource.manager,
    );
    this.videoService = new VideoService();
    this.uploadFileService = new UploadFileService(this.dataSource);
  }

  async getTeacherByCourseId(courseId: string) {
    const teacher = await this.courseMemberRepository.findOneBy({
      courseId,
      identity: CourseMemberIdentity.Teacher,
    });
    if (!teacher) {
      throw new NotFoundException({ message: 'not found teacher' });
    }
    const teacherProfile = await this.userService.getUserByUserId(
      teacher.userId,
    );
    const newTeacher: User & { courseMemberId: string } = Object.assign(
      teacherProfile,
      { courseMemberId: teacher.id },
    );
    return newTeacher;
  }

  async createCourse(ctx: CreateTeacherCourseDto) {
    const nanoid = customAlphabet('1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ', 8);
    const course = await this.courseRepository.save({
      ...ctx,
      inviteCode: nanoid(),
    });
    const teacher = await this.courseMemberRepository.save(
      this.courseMemberRepository.create({
        userId: ctx.userId,
        courseId: course.id,
        identity: CourseMemberIdentity.Teacher,
      }),
    );
    console.log(79, teacher);
    return course;
  }

  async getTeacherCourseList(userId: string) {
    const courseList = await this.courseRepository.find({
      where: {
        courseMembers: {
          userId: userId,
          identity: CourseMemberIdentity.Teacher,
        },
      },
    });
    return courseList;
  }

  async getCourseByCourseId(courseId: string, userId?: string) {
    const course = await this.courseRepository.findOne({
      where: { id: courseId },
      relations: { courseMembers: true },
    });
    const courseMembers = course.courseMembers;
    let teacher;
    let attendRateTotal = 0;
    let successRateTotal = 0; //筆記相似度全部加起來
    const studentList = [];
    courseMembers.forEach((courseMember) => {
      if (courseMember.identity === CourseMemberIdentity.Teacher) {
        teacher = courseMember;
      } else {
        studentList.push(courseMember);
        attendRateTotal += courseMember.attendanceRate;
        successRateTotal += courseMember.noteSimilarity;
      }
    });
    const teacherData = await this.userService.getUserByUserId(teacher.userId);

    const data = {
      id: course.id,
      teacherName: teacherData.name,
      teacherImg: teacherData.image,
      teacherPhone: teacherData.phone,
      teacherEmail: teacherData.email,
      attendRate: attendRateTotal / studentList.length,
      successRate: successRateTotal / studentList.length,
      courseCode: course.inviteCode,
      courseTime: course.session,
      courseName: course.name,
      coursePeopleCounts: course.peopleCount,
    };
    if (userId) {
      const requestUser = studentList.filter((student) => {
        return student.userId === userId;
      })[0];
      if (!requestUser) {
        data['courseMemberId'] = teacher.id;
      } else {
        data['courseMemberId'] = requestUser.id;
      }
    }

    return data;
  }

  async getCourseOutlineList(courseId: string) {
    const outlineList = await this.courseUnitRepository.find({
      where: { courseId },
    });
    if (outlineList.length === 0) {
      return 'not find outline';
    }
    return outlineList;
  }

  async createCourseOutline(courseId: string, ctx: CreateOutlineDto) {
    const unit = await this.courseUnitRepository.save({
      courseId,
      ...ctx,
    });
    return unit;
  }

  async findAllCourse() {
    const courses = await this.courseRepository.find();
    return courses;
  }

  async getCourseMembersByCourseId(courseId: string) {
    const courseMembers = await this.courseMemberRepository.findBy({
      courseId,
    });
    const courseMemberUserIds = courseMembers.map(
      (courseMember) => courseMember.userId,
    );
    const users = await this.userService.getUserByUserIds(courseMemberUserIds);
    return courseMembers.map((courseMember) => {
      courseMember.user = users.filter(
        (user) => user.id === courseMember.userId,
      )[0];
      return courseMember;
    });
  }

  //upload
  async uploadFile(
    unitId: string,
    materialName: string,
    file: Express.Multer.File,
  ) {
    let materialUrl: string;
    switch (file.mimetype) {
      case 'image/jpg':
      case 'image/jpeg':
      case 'image/png':
        file = await this.uploadFileService.compressionFile(file);
        materialUrl = await this.uploadFileService.uploadFile(
          file,
          'i-note-you-s3/images',
        );
        return materialUrl;
      case 'video/mp4':
        materialUrl = await this.uploadFileService.uploadFile(
          file,
          'i-note-you-s3/videos',
        );
        const video = await this.unitVideoRepository.save(
          this.unitVideoRepository.create({
            unitId,
            title: materialName,
            url: materialUrl,
            analyzeStatus: VideoAnalyzeStatus.Analyzing,
          }),
        );
        await this.uploadFileService.videoSpeechToText(
          file.originalname,
          'i-note-you-s3/videos',
          video.id,
        );
        return video;
      case 'application/vnd.openxmlformats-officedocument.presentationml.presentation':
        materialUrl = await this.uploadFileService.uploadPptx(
          file,
          'i-note-you-s3/office',
        );
        return await this.unitMaterialRepository.save(
          this.unitMaterialRepository.create({
            unitId,
            name: materialName,
            url: materialUrl,
          }),
        );
      default:
        materialUrl = await this.uploadFileService.uploadFile(
          file,
          'i-note-you-s3/office',
        );
        return await this.unitMaterialRepository.save(
          this.unitMaterialRepository.create({
            unitId,
            name: materialName,
            url: materialUrl,
          }),
        );
    }
  }

  //notify
  async createNotify(
    courseId: string,
    ctx: { title: string; content: string; image: string },
  ) {
    const notify = await this.courseNotifyRepository.save(
      this.courseNotifyRepository.create({
        courseId,
        ...ctx,
      }),
    );
    const notifyReads = [];
    (
      await this.courseMemberRepository.findBy({
        courseId,
      })
    ).map((member) => {
      notifyReads.push(
        this.notifyReadRepository.create({
          courseMemberId: member.id,
          courseNotifyId: notify.id,
          readStatus: false,
        }),
      );
    });
    this.notifyReadRepository.save(notifyReads);
    return notify;
  }
}
