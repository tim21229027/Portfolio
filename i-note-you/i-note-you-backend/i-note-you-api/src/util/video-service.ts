import * as ffmpegPath from '@ffmpeg-installer/ffmpeg';
import * as ffmpeg from 'fluent-ffmpeg';
import { Readable } from 'stream';

export class VideoService {
  constructor() {
    ffmpeg.setFfmpegPath(ffmpegPath.path);
  }
  async videoToAudio(file) {
    console.log('start change');
    ffmpeg()
      .input(Readable.from(file.buffer))
      .inputFormat('mp4')
      .output('out.wav')
      .on('end', function () {
        console.log('conversion ended');
      })
      .on('error', function (err) {
        console.log('error: ', err);
      })
      .run();

    return;
  }
}
