import {
  Column,
  Entity,
  EntityManager,
  JoinColumn,
  OneToOne,
  Repository,
} from 'typeorm';
import { CourseUnit } from './course-unit';
import { BaseEntity } from '../common/class/base-entity';

@Entity()
export class UnitAllNote extends BaseEntity {
  @Column('uuid', { name: 'unit_id' })
  unitId: string;

  @Column('text', { name: 'content', default: '' })
  content: string;

  @OneToOne(() => CourseUnit, (unit: CourseUnit) => unit.unitNotes)
  @JoinColumn({ name: 'unit_id' })
  unit: CourseUnit;
}
export class UnitAllNoteRepository extends Repository<UnitAllNote> {
  constructor(manager: EntityManager) {
    super(UnitAllNote, manager);
  }
}
