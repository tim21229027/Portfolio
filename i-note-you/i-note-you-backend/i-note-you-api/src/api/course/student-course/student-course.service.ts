import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectDataSource } from '@nestjs/typeorm';
import { UserService } from 'src/api/user/user.service';
import { CourseMemberIdentity } from 'src/common/enum/course-member-identity';
import { CourseRepository } from 'src/entities/course';
import { CourseMemberRepository } from 'src/entities/course-member';
import { CourseNotifyRepository } from 'src/entities/course-notify';
import { NotifyReadRepository } from 'src/entities/notify-read';
import { DataSource } from 'typeorm';
import { TeacherCourseService } from '../teacher-course/teacher-course.service';

@Injectable()
export class StudentCourseService {
  private courseRepository: CourseRepository;
  private courseMemberRepository: CourseMemberRepository;
  private courseNotifyRepository: CourseNotifyRepository;
  private notifyReadRepository: NotifyReadRepository;
  constructor(
    @InjectDataSource() private dataSource: DataSource,
    private userService: UserService,
    private teacherCourseService: TeacherCourseService,
  ) {
    this.courseRepository = new CourseRepository(this.dataSource.manager);
    this.courseMemberRepository = new CourseMemberRepository(
      this.dataSource.manager,
    );
    this.courseNotifyRepository = new CourseNotifyRepository(
      this.dataSource.manager,
    );
    this.notifyReadRepository = new NotifyReadRepository(
      this.dataSource.manager,
    );
  }

  async getCourseMemberById(courseMemberId: string) {
    const member = await this.courseMemberRepository.findOneBy({
      id: courseMemberId,
    });
    if (!member) {
      throw new NotFoundException({ message: 'not find course member' });
    }
    return member;
  }

  async getMemberByUserId(courseId: string, userId: string) {
    const member = await this.courseMemberRepository.findOneBy({
      courseId,
      userId,
    });
    if (!member) {
      throw new NotFoundException({ message: 'not found member' });
    }
    return member;
  }

  async getStudentCourseList(userId: string) {
    const courseList = await this.courseRepository.find({
      where: {
        courseMembers: {
          userId,
          identity: CourseMemberIdentity.Student,
        },
      },
    });

    return courseList;
  }

  async joinCourse(userId: string, inviteCode: string) {
    const course = await this.courseRepository.findOneBy({ inviteCode });
    if (!course) {
      return false;
    }
    await this.courseMemberRepository.save(
      this.courseMemberRepository.create({
        userId,
        courseId: course.id,
        identity: CourseMemberIdentity.Student,
      }),
    );
    course.peopleCount += 1;
    this.courseRepository.save(course);
    return true;
  }

  //notify

  async getNotifyList(ctx: {
    userId: string;
    courseId?: string;
    readStatus?: boolean;
  }) {
    const courseMembers = await this.courseMemberRepository.find({
      where: { userId: ctx.userId },
    });
    const courseMemberIds = courseMembers.map((member) => member.id);
    const notify = this.courseNotifyRepository
      .createQueryBuilder('courseNotify')
      .leftJoinAndSelect('courseNotify.notifyReads', 'notifyReads')
      .where('notifyReads.courseMember IN (:...courseMemberIds)', {
        courseMemberIds,
      });
    if (ctx.courseId) {
      notify.andWhere('courseNotify.courseId = :courseId', {
        courseId: ctx.courseId,
      });
    }
    if (ctx.readStatus != undefined) {
      notify.andWhere('notifyReads.readStatus = :readStatus', {
        readStatus: ctx.readStatus,
      });
    }
    return (await notify.getMany()).map((notify) => {
      notify['notifyRead'] = notify.notifyReads[0].readStatus;
      return notify;
    });
  }

  async getNotifyById(notifyId: string, userId?: string) {
    const notify = await this.courseNotifyRepository.findOne({
      where: {
        id: notifyId,
      },
      relations: {
        notifyFiles: true,
      },
    });
    if (userId) {
      const member = await this.getMemberByUserId(notify.courseId, userId);
      const notifyRead = await this.notifyReadRepository.findOneBy({
        courseMemberId: member.id,
        courseNotifyId: notify.id,
      });
      notifyRead.readStatus = true;
      this.notifyReadRepository.save(notifyRead);
    }
    const course = await this.teacherCourseService.getCourseByCourseId(
      notify.courseId,
    );
    Object.assign(notify, course);

    return notify;
  }
}
