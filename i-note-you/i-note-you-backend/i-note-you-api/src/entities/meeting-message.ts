import {
  Column,
  Entity,
  EntityManager,
  JoinColumn,
  ManyToOne,
  Repository,
} from 'typeorm';
import { BaseEntity } from '../common/class/base-entity';
import { MeetingMember } from './meeting-member';

@Entity()
export class MeetingMessage extends BaseEntity {
  @Column('varchar', { name: 'message' })
  message: string;

  @Column('varchar', { name: 'meeting_member_id' })
  meetingMemberId: string;

  @ManyToOne(
    () => MeetingMember,
    (meetingMember) => meetingMember.meetingMessages,
  )
  @JoinColumn({ name: 'meeting_member_id' })
  meetingMember: MeetingMember;
}
export class MeetingMessageRepository extends Repository<MeetingMessage> {
  constructor(manager: EntityManager) {
    super(MeetingMessage, manager);
  }
}
