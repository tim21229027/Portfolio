import {
  Column,
  Entity,
  EntityManager,
  JoinColumn,
  ManyToOne,
  Repository,
} from 'typeorm';
import { CourseUnit } from './course-unit';
import { BaseEntity } from '../common/class/base-entity';

@Entity()
export class UnitMaterial extends BaseEntity {
  @Column('uuid', { name: 'unit_id' })
  unitId: string;

  @Column('varchar', { name: 'name' })
  name: string;

  @Column('varchar', { name: 'url', nullable: true })
  url: string;

  @ManyToOne(() => CourseUnit, (unit: CourseUnit) => unit.unitMaterials)
  @JoinColumn({ name: 'unit_id' })
  unit: CourseUnit;
}
export class UnitMaterialRepository extends Repository<UnitMaterial> {
  constructor(manager: EntityManager) {
    super(UnitMaterial, manager);
  }
}
