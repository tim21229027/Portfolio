import { Module } from '@nestjs/common';
import { UnitService } from './unit.service';
import { UnitController } from './unit.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { UnitNote } from 'src/entities/course-unit-note';
import { CourseModule } from '../course/course.module';
import { UserModule } from '../user/user.module';

@Module({
  imports: [TypeOrmModule.forFeature([UnitNote]), CourseModule, UserModule],
  controllers: [UnitController],
  providers: [UnitService],
})
export class UnitModule {}
