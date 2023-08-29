import { Body, Controller, Delete, Get, Param, Post } from '@nestjs/common';
import { MeetingService } from './meeting.service';

@Controller()
export class MeetingController {
  constructor(private readonly meetingService: MeetingService) {}
  //meeting

  @Post('course/meeting/message/:meetingMemberId')
  createMeetingMessage(
    @Param('meetingMemberId') meetingMemberId: string,
    @Body('message') message: string,
  ) {
    return this.meetingService.createMeetingMessage(meetingMemberId, message);
  }

  @Get('course/meeting/:meetingId')
  getMeeting(@Param('meetingId') meetingId: string) {
    return this.meetingService.getMeetingById(meetingId);
  }

  @Post('course/:courseId/meeting/:courseMemberId')
  createMeeting(
    @Param('courseId') courseId: string,
    @Param('courseMemberId') courseMemberId: string,
  ) {
    return this.meetingService.getCourseMemberIdentityToJoinMeeting(
      courseId,
      courseMemberId,
    );
  }

  @Delete('course/meeting/:meetingId')
  endMeeting(@Param('meetingId') meetingId: string) {
    return this.meetingService.deleteMeeting(meetingId);
  }

  @Delete('course/meeting/:meetingId/meetingMember/:meetingMemberId')
  leaveMeeting(
    @Param('meetingId') meetingId: string,
    @Param('meetingMemberId') meetingMemberId: string,
  ) {
    return this.meetingService.leaveMeeting(meetingId, meetingMemberId);
  }

  @Get('course/meeting/:meetingId/members')
  getMeetingMembers(@Param('meetingId') meetingId: string) {
    return this.meetingService.getMeetingMembers(meetingId);
  }

  @Get('course/meeting/:meetingId/message')
  getMeetingMessage(@Param('meetingId') meetingId: string) {
    return this.meetingService.getMeetingMessage(meetingId);
  }
}
