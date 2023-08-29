import {
  Column,
  Entity,
  EntityManager,
  JoinColumn,
  ManyToOne,
  Repository,
} from 'typeorm';
import { BaseEntity } from '../common/class/base-entity';
import { UnitVideo } from './course-unit-video';

@Entity()
export class VideoKeyword extends BaseEntity {
  @Column('decimal', { name: 'start_time', precision: 10, scale: 0 })
  startTime: number;

  @Column('decimal', { name: 'end_time', precision: 10, scale: 0 })
  endTime: number;

  @Column('varchar', { name: 'keywords', array: true, default: [] })
  keywords: string[];

  @Column('uuid', { name: 'video_id' })
  videoId: string;

  @ManyToOne(() => UnitVideo, (unitVideo: UnitVideo) => unitVideo.videoKeywords)
  @JoinColumn({ name: 'video_id' })
  unitVideo: UnitVideo;
}
export class VideoKeywordRepository extends Repository<VideoKeyword> {
  constructor(manager: EntityManager) {
    super(VideoKeyword, manager);
  }
}
