import {
  Column,
  Entity,
  EntityManager,
  JoinColumn,
  ManyToOne,
  OneToMany,
  Repository,
} from 'typeorm';
import { BaseEntity } from '../common/class/base-entity';
import { CourseMember } from './course-member';
import { Meeting } from './meeting';
import { MeetingMessage } from './meeting-message';
@Entity()
export class MeetingMember extends BaseEntity {
  @Column('smallint', { name: 'uid' })
  uid: number;

  @Column('boolean', { name: 'host' })
  host: boolean;

  @Column('uuid', { name: 'meeting_id' })
  meetingId: string;

  @Column('uuid', { name: 'course_member_id' })
  courseMemberId: string;

  @ManyToOne(() => Meeting, (meeting) => meeting.meetingMembers)
  @JoinColumn({ name: 'meeting_id' })
  meeting: Meeting;

  @ManyToOne(() => CourseMember, (courseMember) => courseMember.meetingMembers)
  @JoinColumn({ name: 'course_member_id' })
  courseMember: CourseMember;

  @OneToMany(
    () => MeetingMessage,
    (meetingMessages) => meetingMessages.meetingMember,
  )
  meetingMessages: MeetingMessage[];
}
export class MeetingMemberRepository extends Repository<MeetingMember> {
  constructor(manager: EntityManager) {
    super(MeetingMember, manager);
  }
}
