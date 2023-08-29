import {
  Column,
  Entity,
  EntityManager,
  JoinColumn,
  ManyToOne,
  OneToMany,
  Repository,
} from 'typeorm';
import { CourseUnit } from './course-unit';
import { BaseEntity } from '../common/class/base-entity';
import { VideoAnalyzeStatus } from 'src/common/enum/video-analyze-status';
import { VideoKeyword } from './video-keyword';

@Entity()
export class UnitVideo extends BaseEntity {
  @Column('varchar', { name: 'title' })
  title: string;

  @Column('varchar', { name: 'url' })
  url: string;

  @Column('enum', {
    enum: VideoAnalyzeStatus,
    name: 'analyze_status',
    default: VideoAnalyzeStatus.Analyzing,
  })
  analyzeStatus: VideoAnalyzeStatus;

  @Column('uuid', { name: 'unit_id' })
  unitId: string;

  @ManyToOne(() => CourseUnit, (unit: CourseUnit) => unit.unitVideos)
  @JoinColumn({ name: 'unit_id' })
  unit: CourseUnit;

  @OneToMany(() => VideoKeyword, (videoKeywords) => videoKeywords.unitVideo)
  videoKeywords: VideoKeyword[];
}
export class UnitVideoRepository extends Repository<UnitVideo> {
  constructor(manager: EntityManager) {
    super(UnitVideo, manager);
  }
}
