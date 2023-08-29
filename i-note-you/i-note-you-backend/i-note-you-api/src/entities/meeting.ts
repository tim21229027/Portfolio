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
import { Course } from './course';
import { MeetingMember } from './meeting-member';
@Entity()
export class Meeting extends BaseEntity {
  @Column('uuid', { name: 'course_id' })
  courseId: string;

  @ManyToOne(() => Course, (course) => course.meetings)
  @JoinColumn({ name: 'course_id' })
  course: Course;

  @OneToMany(() => MeetingMember, (meetingMembers) => meetingMembers.meeting)
  meetingMembers: MeetingMember[];
}
export class MeetingRepository extends Repository<Meeting> {
  constructor(manager: EntityManager) {
    super(Meeting, manager);
  }
}
