import { CourseMemberIdentity } from 'src/common/enum/course-member-identity';
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
import { UnitNote } from './course-unit-note';
import { MeetingMember } from './meeting-member';
import { NotifyRead } from './notify-read';
import { User } from './user';

@Entity()
export class CourseMember extends BaseEntity {
  @Column('uuid', { name: 'user_id' })
  userId: string;

  @Column('uuid', { name: 'course_id' })
  courseId: string;

  @Column('smallint', { name: 'note_similarity', nullable: true })
  noteSimilarity: number;

  @Column('smallint', { name: 'attendance_rate', nullable: true })
  attendanceRate: number;

  @Column('enum', { name: 'identity', enum: CourseMemberIdentity, default: 0 })
  identity: CourseMemberIdentity;

  @ManyToOne(() => User, (user: User) => user.courseMembers)
  @JoinColumn({ name: 'user_id' })
  user: User;

  @ManyToOne(() => Course, (course: Course) => course.courseMembers)
  @JoinColumn({ name: 'course_id' })
  course: Course;

  @OneToMany(() => UnitNote, (unitNote) => unitNote.courseMember)
  unitNote: UnitNote[];

  @OneToMany(
    () => MeetingMember,
    (meetingMembers) => meetingMembers.courseMember,
  )
  meetingMembers: MeetingMember[];

  @OneToMany(() => NotifyRead, (notifyReads) => notifyReads.courseMember)
  notifyReads: NotifyRead[];
}
export class CourseMemberRepository extends Repository<CourseMember> {
  constructor(manager: EntityManager) {
    super(CourseMember, manager);
  }
}
