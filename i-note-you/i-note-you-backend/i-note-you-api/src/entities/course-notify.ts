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
import { NotifyRead } from './notify-read';
import { NotifyFile } from './notiy-file';

@Entity()
export class CourseNotify extends BaseEntity {
  @Column('varchar', { name: 'title' })
  title: string;

  @Column('varchar', { name: 'image', nullable: true })
  image: string;

  @Column('varchar', { name: 'content' })
  content: string;

  @Column('uuid', { name: 'course_id' })
  courseId: string;

  @ManyToOne(() => Course, (course: Course) => course.courseNotifys)
  @JoinColumn({ name: 'course_id' })
  course: Course;

  @OneToMany(() => NotifyFile, (notifyFiles) => notifyFiles.courseNotify)
  notifyFiles: NotifyFile[];

  @OneToMany(() => NotifyRead, (notifyReads) => notifyReads.courseNotify)
  notifyReads: NotifyRead[];
}
export class CourseNotifyRepository extends Repository<CourseNotify> {
  constructor(manager: EntityManager) {
    super(CourseNotify, manager);
  }
}
