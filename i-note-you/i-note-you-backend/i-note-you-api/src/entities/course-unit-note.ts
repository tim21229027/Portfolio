import {
  Column,
  Entity,
  EntityManager,
  JoinColumn,
  ManyToOne,
  Repository,
} from 'typeorm';
import { CourseMember } from './course-member';
import { CourseUnit } from './course-unit';
import { BaseEntity } from '../common/class/base-entity';

@Entity()
export class UnitNote extends BaseEntity {
  @Column('uuid', { name: 'unit_id' })
  unitId: string;

  @Column('uuid', { name: 'course_member_id' })
  courseMemberId: string;

  @Column('text', { name: 'content', default: '' })
  content: string;

  @Column('decimal', { name: 'similarity', default: 0, precision: 5, scale: 2 })
  similarity: number;

  @ManyToOne(() => CourseMember, (courseMember) => courseMember.unitNote)
  @JoinColumn({ name: 'course_member_id' })
  courseMember: CourseMember;

  @ManyToOne(() => CourseUnit, (unit: CourseUnit) => unit.unitNotes)
  @JoinColumn({ name: 'unit_id' })
  unit: CourseUnit;
}
export class UnitNoteRepository extends Repository<UnitNote> {
  constructor(manager: EntityManager) {
    super(UnitNote, manager);
  }
}
