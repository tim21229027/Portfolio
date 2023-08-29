import { Injectable, Logger, NotFoundException } from '@nestjs/common';
import { InjectDataSource } from '@nestjs/typeorm';
import { UserRepository } from 'src/entities/user';
import { DataSource, In } from 'typeorm';

@Injectable()
export class UserService {
  private userRepository: UserRepository;
  private logger = new Logger('UserService');
  constructor(@InjectDataSource() private dataSource: DataSource) {
    this.userRepository = new UserRepository(this.dataSource.manager);
  }

  async getUserByUserId(userId: string) {
    const user = await this.userRepository.findOne({ where: { id: userId } });
    if (!user) {
      throw new NotFoundException({ message: 'not find user' });
    }
    return user;
  }

  async getUserByUserIds(userIds: string[]) {
    const users = await this.userRepository.find({
      where: { id: In(userIds) },
    });
    if (userIds.length != users.length) {
      throw new NotFoundException({ message: 'some user not found' });
    }
    return users;
  }
}
