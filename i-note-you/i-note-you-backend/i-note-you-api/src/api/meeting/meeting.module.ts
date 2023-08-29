import { Module } from '@nestjs/common';
import { MeetingService } from './meeting.service';
import { MeetingController } from './meeting.controller';
import { UserModule } from '../user/user.module';
import { CourseModule } from '../course/course.module';

@Module({
  controllers: [MeetingController],
  providers: [MeetingService],
  imports: [UserModule, CourseModule],
})
export class MeetingModule {}
