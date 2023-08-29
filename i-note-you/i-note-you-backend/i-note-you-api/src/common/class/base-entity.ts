import {
  CreateDateColumn,
  DeleteDateColumn,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { ColumnUtcTransformer } from './utcdate-transformer';

export class BaseEntity {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @CreateDateColumn({
    name: 'create_at',
    type: 'timestamp with time zone',
    transformer: new ColumnUtcTransformer(),
  })
  createAt: Date;

  @DeleteDateColumn({
    name: 'deleted_at',
    type: 'timestamp with time zone',
    transformer: new ColumnUtcTransformer(),
  })
  deletedAt?: Date;
}
