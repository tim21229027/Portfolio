import { IsArray, IsString } from 'class-validator';

export class CreateMaterialDto {
  @IsString()
  unitId: string;

  @IsString()
  name: string;

  @IsArray()
  content: string[];
}
