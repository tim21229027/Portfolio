import {
  Column,
  Entity,
  EntityManager,
  JoinColumn,
  ManyToOne,
  Repository,
} from 'typeorm';
import { BaseEntity } from '../common/class/base-entity';
import { CourseNotify } from './course-notify';
import { CourseMember } from './course-member';
@Entity()
export class NotifyRead extends BaseEntity {
  @Column('boolean', { name: 'read_status' })
  readStatus: boolean;

  @Column('uuid', { name: 'course_notify_id' })
  courseNotifyId: string;

  @Column('uuid', { name: 'course_member_id' })
  courseMemberId: string;

  @ManyToOne(() => CourseNotify, (courseNotify) => courseNotify.notifyReads)
  @JoinColumn({ name: 'course_notify_id' })
  courseNotify: CourseNotify;

  @ManyToOne(() => CourseMember, (courseMember) => courseMember.notifyReads)
  @JoinColumn({ name: 'course_member_id' })
  courseMember: CourseMember;
}
export class NotifyReadRepository extends Repository<NotifyRead> {
  constructor(manager: EntityManager) {
    super(NotifyRead, manager);
  }
}
