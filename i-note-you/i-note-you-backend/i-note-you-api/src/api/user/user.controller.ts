import { Controller, Get, Param } from '@nestjs/common';
import { setTimeout } from 'timers';
import { UserService } from './user.service';

@Controller('user')
export class UserController {
  constructor(private readonly userService: UserService) {}

  @Get('/:userId')
  getUserByUserId(@Param('userId') userId: string) {
    return new Promise((resolve) => {
      setTimeout(() => {
        resolve(this.userService.getUserByUserId(userId));
      }, 3000);
    });
  }
}
