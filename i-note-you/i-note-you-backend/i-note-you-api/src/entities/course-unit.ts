import {
  Column,
  Entity,
  EntityManager,
  JoinColumn,
  ManyToOne,
  OneToMany,
  OneToOne,
  Repository,
} from 'typeorm';
import { Course } from './course';
import { UnitMaterial } from './course-unit-material';
import { UnitNote } from './course-unit-note';
import { UnitVideo } from './course-unit-video';
import { BaseEntity } from '../common/class/base-entity';
import { UnitAllNote } from './course-unit-all-note';
@Entity()
export class CourseUnit extends BaseEntity {
  @Column('uuid', { name: 'course_id' })
  courseId: string;

  @Column('varchar', { name: 'week' })
  week: string;

  @Column('varchar', { name: 'name' })
  name: string;

  @Column('date', { name: 'teach_date' })
  teachDate: Date;

  @Column('varchar', { name: 'teach_content' })
  teachContent: string;

  @ManyToOne(() => Course, (course) => course.courseUnits)
  @JoinColumn({ name: 'course_id' })
  course: Course;

  @OneToMany(() => UnitVideo, (unitVideos: UnitVideo) => unitVideos.unit)
  unitVideos: UnitVideo[];

  @OneToMany(
    () => UnitMaterial,
    (unitMaterials: UnitMaterial) => unitMaterials.unit,
  )
  unitMaterials: UnitMaterial[];

  @OneToMany(() => UnitNote, (unitNotes: UnitNote) => unitNotes.unit)
  unitNotes: UnitNote[];

  @OneToOne(() => UnitAllNote, (unitAllNote: UnitAllNote) => unitAllNote.unit)
  unitAllNote: UnitAllNote;
}
export class CourseUnitRepository extends Repository<CourseUnit> {
  constructor(manager: EntityManager) {
    super(CourseUnit, manager);
  }
}
