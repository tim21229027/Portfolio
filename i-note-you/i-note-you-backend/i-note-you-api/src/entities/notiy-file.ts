import {
  Column,
  Entity,
  EntityManager,
  JoinColumn,
  ManyToOne,
  Repository,
} from 'typeorm';
import { CourseNotify } from './course-notify';
import { BaseEntity } from '../common/class/base-entity';

@Entity()
export class NotifyFile extends BaseEntity {
  @Column('varchar', { name: 'file' })
  file: string;

  @ManyToOne(
    () => CourseNotify,
    (courseNotify: CourseNotify) => courseNotify.notifyFiles,
  )
  @JoinColumn({ name: 'notify_id' })
  courseNotify: CourseNotify;
}
export class NotifyFileRepository extends Repository<NotifyFile> {
  constructor(manager: EntityManager) {
    super(NotifyFile, manager);
  }
}
