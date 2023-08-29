import {
  Controller,
  Post,
  Body,
  Get,
  Param,
  UploadedFile,
  UseInterceptors,
  // UploadedFiles,
} from '@nestjs/common';
import { TeacherCourseService } from './teacher-course.service';
import { CreateTeacherCourseDto } from './dto/create-teacher-course.dto';
import { CreateOutlineDto } from './dto/create-outline.dto';
import { FileInterceptor } from '@nestjs/platform-express';

@Controller()
export class TeacherCourseController {
  constructor(private readonly teacherCourseService: TeacherCourseService) {}

  @Post('teacher/course')
  createCourse(@Body() ctx: CreateTeacherCourseDto) {
    return this.teacherCourseService.createCourse(ctx);
  }

  @Get('teacher/course/list')
  getTeacherCourseList(@Body('userId') userId: string) {
    return this.teacherCourseService.getTeacherCourseList(userId);
  }

  @Get('course/:courseId/user/:userId')
  getCourse(
    @Param('courseId') courseId: string,
    @Param('userId') userId: string,
  ) {
    return this.teacherCourseService.getCourseByCourseId(courseId, userId);
  }

  @Get('course/:courseId/users')
  getCourseUsers(@Param('courseId') courseId: string) {
    return this.teacherCourseService.getCourseMembersByCourseId(courseId);
  }

  @Get('course/:courseId/outline/list')
  getCourseOutlineList(@Param('courseId') courseId: string) {
    return this.teacherCourseService.getCourseOutlineList(courseId);
  }

  @Post('teacher/course/:courseId/outline')
  createCourseOutline(
    @Param('courseId') courseId: string,
    @Body() ctx: CreateOutlineDto,
  ) {
    return this.teacherCourseService.createCourseOutline(courseId, ctx);
  }

  @Get()
  findAllCourse() {
    return this.teacherCourseService.findAllCourse();
  }

  //upload
  @Post('teacher/course/unit/:unitId/file/upload')
  @UseInterceptors(FileInterceptor('file'))
  uploadFile(
    @UploadedFile() file: Express.Multer.File,
    @Param('unitId') unitId: string,
  ) {
    console.log(file);
    const materialName = file.originalname;
    return this.teacherCourseService.uploadFile(unitId, materialName, file);
  }

  //notify
  @Post('teacher/course/:courseId/notify')
  createNotify(
    @Param('courseId') courseId: string,
    @Body() ctx: { title: string; content: string; image: string },
  ) {
    return this.teacherCourseService.createNotify(courseId, ctx);
  }
}
