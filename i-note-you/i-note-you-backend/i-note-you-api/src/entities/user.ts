import { Column, Entity, EntityManager, OneToMany, Repository } from 'typeorm';
import { CourseMember } from './course-member';
import { BaseEntity } from '../common/class/base-entity';
@Entity()
export class User extends BaseEntity {
  @Column('varchar', { name: 'name' })
  name: string;

  @Column('varchar', { name: 'email' })
  email: string;

  @Column('varchar', { name: 'password' })
  password: string;

  @Column('varchar', { name: 'phone' })
  phone: string;

  @Column('varchar', { name: 'image' })
  image: string;

  @Column('varchar', { name: 'background_image', nullable: true })
  backgroundImage: string;

  @OneToMany(
    () => CourseMember,
    (courseMembers: CourseMember) => courseMembers.user,
  )
  courseMembers: CourseMember[];
}

export class UserRepository extends Repository<User> {
  constructor(manager: EntityManager) {
    super(User, manager);
  }
}
