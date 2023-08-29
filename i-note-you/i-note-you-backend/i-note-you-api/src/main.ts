import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import setS3Config from './util/aws';

async function bootstrap() {
  setS3Config();
  const app = await NestFactory.create(AppModule);
  app.enableCors();
  await app.listen(3000);
}
bootstrap();
