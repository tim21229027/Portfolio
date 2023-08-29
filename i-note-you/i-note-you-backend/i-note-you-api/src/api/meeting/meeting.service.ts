import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { InjectDataSource } from '@nestjs/typeorm';
import { CourseMemberIdentity } from 'src/common/enum/course-member-identity';

import { MeetingRepository } from 'src/entities/meeting';
import { MeetingMemberRepository } from 'src/entities/meeting-member';
import { MeetingMessageRepository } from 'src/entities/meeting-message';
import { RTCService } from 'src/util/rtc';
import { DataSource, In } from 'typeorm';
import { StudentCourseService } from '../course/student-course/student-course.service';
import { UserService } from '../user/user.service';

@Injectable()
export class MeetingService {
  private meetingRepository: MeetingRepository;
  private meetingMemberRepository: MeetingMemberRepository;
  private meetingMessageRepository: MeetingMessageRepository;
  private rtcService: RTCService;

  constructor(
    @InjectDataSource() private dataSource: DataSource,
    private userService: UserService,
    private studentCourseService: StudentCourseService,
  ) {
    this.meetingRepository = new MeetingRepository(this.dataSource.manager);
    this.meetingMemberRepository = new MeetingMemberRepository(
      this.dataSource.manager,
    );
    this.meetingMessageRepository = new MeetingMessageRepository(
      this.dataSource.manager,
    );
    this.rtcService = new RTCService();
  }
  //meeting
  async getMeetingById(meetingId: string) {
    const meeting = await this.meetingRepository.findOneBy({ id: meetingId });
    if (!meeting) {
      throw new NotFoundException({ message: 'meeting not found' });
    }
    return meeting;
  }

  async getMeetingByCourseId(courseId: string) {
    const meeting = await this.meetingRepository.findOneBy({ courseId });
    if (!meeting) {
      throw new NotFoundException({ message: 'meeting not found' });
    }
    return meeting;
  }

  async getCourseMemberIdentityToJoinMeeting(
    courseId: string,
    courseMemberId: string,
  ) {
    const member = await this.studentCourseService.getCourseMemberById(
      courseMemberId,
    );
    if (member.identity === CourseMemberIdentity.Teacher) {
      return await this.createMeeting(courseId, courseMemberId);
    } else {
      return await this.joinMeeting(courseId, courseMemberId);
    }
  }

  async createMeeting(courseId: string, courseMemberId: string) {
    const meeting = await this.meetingRepository.findOneBy({ courseId });
    if (meeting) {
      throw new BadRequestException({
        message: '請先關閉其他單元的會議',
      });
    }
    const createMeeting = await this.meetingRepository.save(
      this.meetingRepository.create({
        courseId: courseId,
      }),
    );
    const meetingHost = await this.meetingMemberRepository.save(
      this.meetingMemberRepository.create({
        meetingId: createMeeting.id,
        courseMemberId,
        host: true,
        uid: Math.floor(Math.random() * 10000),
      }),
    );
    meetingHost['RtcAppId'] = process.env.RTC_APP_ID;
    meetingHost['RtcToken'] = await this.rtcService.generateToken(
      createMeeting.id,
      'PUBLISHER',
      meetingHost.uid,
    );
    return meetingHost;
  }

  async joinMeeting(courseId: string, courseMemberId: string) {
    const meeting = await this.meetingRepository.findOneBy({ courseId });
    if (!meeting) {
      throw new NotFoundException({ message: 'not find this meeting' });
    }
    const checkMember = await this.getMeetingMember(meeting.id, courseMemberId);
    if (checkMember) {
      checkMember['RtcAppId'] = process.env.RTC_APP_ID;
      checkMember['RtcToken'] = await this.rtcService.generateToken(
        meeting.id,
        'SUBSCRIBER',
        checkMember.uid,
      );
      return checkMember;
    }
    const meetingMember = await this.meetingMemberRepository.save(
      this.meetingMemberRepository.create({
        meetingId: meeting.id,
        courseMemberId,
        host: false,
        uid: Math.floor(Math.random() * 10000),
      }),
    );
    meetingMember['RtcAppId'] = process.env.RTC_APP_ID;
    meetingMember['RtcToken'] = await this.rtcService.generateToken(
      meeting.id,
      'SUBSCRIBER',
      meetingMember.uid,
    );
    return meetingMember;
  }

  async leaveMeeting(meetingId: string, meetingMemberId: string) {
    const meetingMember = await this.meetingMemberRepository.findOneBy({
      id: meetingMemberId,
    });
    if (meetingMember.host === true) {
      await this.deleteMeeting(meetingId);
      return true;
    }
    this.meetingMemberRepository.softRemove(meetingMember);
    return true;
  }

  async deleteMeeting(meetingId: string) {
    const meeting = await this.getMeetingById(meetingId);
    const meetingMembers = await this.meetingMemberRepository.findBy({
      meetingId,
    });
    this.meetingMemberRepository.softRemove(meetingMembers);
    this.meetingRepository.softRemove(meeting);

    return true;
  }

  //meeting member

  async getMeetingMembers(meetingId: string) {
    const members = await this.meetingMemberRepository.find({
      where: { meetingId },
      relations: { courseMember: true },
      select: {
        id: true,
        uid: true,
        host: true,
        courseMemberId: true,
        courseMember: { userId: true },
      },
    });
    const userIds = members.map((member) => {
      return member.courseMember.userId;
    });
    const users = await this.userService.getUserByUserIds(userIds);
    const returnMembers = members.map((member) => {
      const { courseMember, ...otherData } = member;
      const user = users.filter((user) => user.id === courseMember.userId)[0];
      return {
        ...otherData,
        image: user.image,
        name: user.name,
      };
    });
    return returnMembers;
  }

  async getMeetingMember(meetingId: string, courseMemberId: string) {
    const member = await this.meetingMemberRepository.findOneBy({
      meetingId,
      courseMemberId,
    });
    // if (!member) {
    //   return {};
    // }
    return member;
  }

  //meeting message

  async createMeetingMessage(meetingMemberId: string, message: string) {
    const newMessage = await this.meetingMessageRepository.save(
      this.meetingMessageRepository.create({
        meetingMemberId,
        message,
      }),
    );
    return newMessage;
  }

  async getMeetingMessage(meetingId: string) {
    const allMembers = await this.getMeetingMembers(meetingId);
    const allMemberIds = allMembers.map((member) => {
      return member.id;
    });
    const messages = await this.meetingMessageRepository.find({
      where: { meetingMemberId: In(allMemberIds) },
      order: { createAt: 'ASC' },
    });
    return messages.map((message) => {
      const user = allMembers.filter(
        (member) => member.id === message.meetingMemberId,
      )[0];
      return {
        ...message,
        image: user.image,
        name: user.name,
      };
    });
  }
}
