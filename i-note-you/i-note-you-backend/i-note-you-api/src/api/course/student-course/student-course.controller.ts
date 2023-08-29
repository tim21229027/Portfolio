import { Body, Controller, Get, Param, Post, Query } from '@nestjs/common';

import { StudentCourseService } from './student-course.service';

@Controller()
export class StudentCourseController {
  constructor(private readonly studentCourseService: StudentCourseService) {}

  @Get('course/list')
  getCourseList(@Body('userId') userId: string) {
    return this.studentCourseService.getStudentCourseList(userId);
  }

  @Post('course/join')
  joinCourse(@Body() ctx: { userId: string; inviteCode: string }) {
    return this.studentCourseService.joinCourse(ctx.userId, ctx.inviteCode);
  }

  //notify
  @Get('course/notifies/:userId')
  getNotifyList(
    @Param('userId') userId: string,
    @Query('courseId') courseId: string,
    @Query('readStatus') readStatus: boolean,
  ) {
    return this.studentCourseService.getNotifyList({
      userId,
      courseId,
      readStatus,
    });
  }

  @Get('course/notify/:notifyId')
  getNotifyById(
    @Param('notifyId') notifyId: string,
    @Query('userId') userId: string,
  ) {
    return this.studentCourseService.getNotifyById(notifyId, userId);
  }
}
