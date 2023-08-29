import { Module } from '@nestjs/common';
import { UserModule } from '../user/user.module';
import { StudentCourseController } from './student-course/student-course.controller';
import { StudentCourseService } from './student-course/student-course.service';
import { TeacherCourseController } from './teacher-course/teacher-course.controller';
import { TeacherCourseService } from './teacher-course/teacher-course.service';

@Module({
  controllers: [StudentCourseController, TeacherCourseController],
  providers: [StudentCourseService, TeacherCourseService],
  imports: [UserModule],
  exports: [TeacherCourseService, StudentCourseService],
})
export class CourseModule {}
