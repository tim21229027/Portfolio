import { Test, TestingModule } from '@nestjs/testing';
import { TeacherCourseService } from './teacher-course.service';

describe('TeacherCourseService', () => {
  let service: TeacherCourseService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [TeacherCourseService],
    }).compile();

    service = module.get<TeacherCourseService>(TeacherCourseService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
