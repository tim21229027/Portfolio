import { Body, Controller, Get, Param, Post, Query } from '@nestjs/common';
import { UnitService } from './unit.service';
import { CreateMaterialDto } from './dto/create-material.dto';

@Controller('')
export class UnitController {
  constructor(private readonly unitService: UnitService) {}

  @Post('teacher/unit/material')
  createMaterial(@Body() ctx: CreateMaterialDto) {
    return this.unitService.createMaterial(ctx);
  }

  @Get('course/:courseId/units')
  getUnitsByCourseId(@Param('courseId') courseId: string) {
    return this.unitService.getUnitsByCourseId(courseId);
  }

  @Get('course/unit/:unitId/materials')
  getMaterialsByUnitId(@Param('unitId') unitId: string) {
    return this.unitService.getMaterialsByUnitId(unitId);
  }

  @Get('course/unit/:unitId/videos')
  getVideosByUnitId(@Param('unitId') unitId: string) {
    return this.unitService.getVideosByUnitId(unitId);
  }

  //unit note
  @Get('course/unit/:unitId/note/:courseMemberId')
  getNote(
    @Param('unitId') unitId: string,
    @Param('courseMemberId') courseMemberId: string,
  ) {
    return this.unitService.getNote(unitId, courseMemberId);
  }

  @Post('course/unit/:unitId/note/:courseMemberId')
  updateNote(
    @Param('unitId') unitId: string,
    @Param('courseMemberId') courseMemberId: string,
    @Body('content') content: string,
  ) {
    return this.unitService.updateNote({ unitId, courseMemberId, content });
  }

  @Post('course/unit/:unitId/teacherNote')
  createTeacherNote(@Param('unitId') unitId: string) {
    return this.unitService.createTeacherNote(unitId);
  }

  @Get('course/unit/:unitId/classNote')
  createClassNote(@Param('unitId') unitId: string) {
    return this.unitService.createClassNote(unitId);
  }

  @Get('course/unit/:unitId/notes')
  getAllNotesByUnitId(@Param('unitId') unitId: string) {
    return this.unitService.getAllNotesByUnitId(unitId);
  }

  //keyword
  @Get('course/unit/:unitId/keyword')
  getUnitKeyword(
    @Param('unitId') unitId: string,
    @Query('courseMemberId') courseMemberId: string,
  ) {
    return this.unitService.getUnitKeyword(unitId, courseMemberId);
  }

  @Get('course/unit/:unitId/video/keyword')
  getVideoKeyword(@Param('unitId') unitId: string) {
    return this.unitService.getVideoKeyword(unitId);
  }

  @Get('course/unit/:unitId/video/keyword/:keyword')
  getSpecialVideoKeyword(
    @Param('unitId') unitId: string,
    @Param('keyword') keyword: string,
  ) {
    return this.unitService.getSpecialVideoKeyword(unitId, keyword);
  }
}
