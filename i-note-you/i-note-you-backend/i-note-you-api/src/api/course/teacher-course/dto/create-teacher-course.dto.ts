import { IsString, IsNumber } from 'class-validator';
export class CreateTeacherCourseDto {
  @IsString()
  userId: string;

  @IsString()
  image: string;

  @IsString()
  name: string;

  @IsString()
  session: string;

  @IsNumber()
  peopleCount: number;

  @IsString()
  courseTime: string;

  @IsString()
  description?: string;
}
