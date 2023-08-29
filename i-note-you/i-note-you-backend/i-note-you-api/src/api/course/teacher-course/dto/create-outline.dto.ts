import { IsString, IsNumber, IsOptional } from 'class-validator';
export class CreateOutlineDto {
  @IsString()
  week: string;

  @IsNumber()
  teachDate: string;

  @IsString()
  name: string;

  @IsString()
  teachContent: string;

  @IsString()
  @IsOptional()
  evaluate: string;
}
