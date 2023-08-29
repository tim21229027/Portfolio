import { Test, TestingModule } from '@nestjs/testing';
import { TeacherCourseController } from './teacher-course.controller';
import { TeacherCourseService } from './teacher-course.service';

describe('TeacherCourseController', () => {
  let controller: TeacherCourseController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [TeacherCourseController],
      providers: [TeacherCourseService],
    }).compile();

    controller = module.get<TeacherCourseController>(TeacherCourseController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
