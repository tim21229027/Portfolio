import { Test, TestingModule } from '@nestjs/testing';
import { StudentCourseController } from './student-course.controller';
import { StudentCourseService } from './student-course.service';

describe('StudentCourseController', () => {
  let controller: StudentCourseController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [StudentCourseController],
      providers: [StudentCourseService],
    }).compile();

    controller = module.get<StudentCourseController>(StudentCourseController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
