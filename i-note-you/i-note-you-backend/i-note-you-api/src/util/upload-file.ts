// Helper function that creates an Amazon S3 service client module.
import * as sharp from 'sharp';
import * as AWS from 'aws-sdk';
import * as readline from 'readline';
import * as CloudmersiveConvertApiClient from 'cloudmersive-convert-api-client';
import {
  TranscribeClient,
  StartTranscriptionJobCommand,
  GetTranscriptionJobCommand,
} from '@aws-sdk/client-transcribe';
import { clearInterval, setInterval } from 'timers';
import { JiebaService } from './jieba';
import { UnitVideoRepository } from 'src/entities/course-unit-video';
import { InjectDataSource } from '@nestjs/typeorm';
import { DataSource } from 'typeorm';
import { VideoKeywordRepository } from 'src/entities/video-keyword';
import { VideoAnalyzeStatus } from 'src/common/enum/video-analyze-status';
import { Logger } from '@nestjs/common';

export class UploadFileService {
  private logger = new Logger('uploadFile');
  private s3: AWS.S3 = new AWS.S3();
  private jiebaService: JiebaService;
  private unitVideoRepository: UnitVideoRepository;
  private videoKeywordRepository: VideoKeywordRepository;
  constructor(@InjectDataSource() private dataSource: DataSource) {
    this.jiebaService = new JiebaService();
    this.unitVideoRepository = new UnitVideoRepository(this.dataSource.manager);
    this.videoKeywordRepository = new VideoKeywordRepository(
      this.dataSource.manager,
    );
  }
  async compressionFile(file: Express.Multer.File) {
    if (file.mimetype.includes('jpg') || file.mimetype.includes('jpeg')) {
      file.buffer = await sharp(file.buffer).jpeg({ quality: 80 }).toBuffer();
    } else if (file.mimetype.includes('png')) {
      file.buffer = await sharp(file.buffer).png({ quality: 80 }).toBuffer();
    }
    return file;
  }

  async uploadPptx(file: Express.Multer.File, bucketName: string) {
    const defaultClient = CloudmersiveConvertApiClient.ApiClient.instance;
    // Configure API key authorization: Apikey
    const Apikey = defaultClient.authentications['Apikey'];
    Apikey.apiKey = process.env.CLOUDMERSIVE_API_KEY;

    const apiInstance = new CloudmersiveConvertApiClient.ConvertDocumentApi();
    file.originalname = file.originalname.replace('pptx', 'pdf');
    file.mimetype = 'application/pdf';
    const callback = async (error, data, response) => {
      if (error) {
        console.error(error);
      } else {
        file.buffer = data;
        file.originalname = file.originalname.replace('pptx', 'pdf');
        file.mimetype = 'application/pdf';
        await this.uploadFile(file, bucketName);
        return `https://i-note-you-s3.s3.ap-northeast-1.amazonaws.com/office/${file.originalname}`;
      }
    };
    apiInstance.convertDocumentPptxToPdf(file.buffer, callback);

    return `https://i-note-you-s3.s3.ap-northeast-1.amazonaws.com/office/${file.originalname}`;
  }

  async uploadFile(file: Express.Multer.File, bucketName: string) {
    const param: AWS.S3.Types.PutObjectRequest = {
      Bucket: bucketName,
      Key: file.originalname,
      Body: file.buffer,
      //   ACL: 'public-read',
      ContentType: file.mimetype,
      ContentDisposition: 'inline',
    };
    try {
      const s3Response = await this.s3.upload(param).promise();
      console.log(s3Response.Key);
      return s3Response.Location;
    } catch (e) {
      console.log(e);
      return e;
    }
  }

  async videoSpeechToText(
    fileOriginName: string,
    bucketName: string,
    videoUUID: string,
  ) {
    console.log(66, '建立分析影片工作');
    const region = process.env.AWS_REGION;
    const credentials = {
      accessKeyId: process.env.AWS_ACCESS_KEY_ID,
      secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY,
    };
    const input = {
      TranscriptionJobName: `${videoUUID}-transcription-job`,
      // LanguageCode: 'zh-TW',
      IdentifyMultipleLanguages: true,
      LanguageOptions: ['zh-TW', 'en-US'],
      Media: {
        MediaFileUri: `s3://${bucketName}/${fileOriginName}`,
      },
      OutputBucketName: 'i-note-you-s3',
      OutputKey: 'video-text/',
      Subtitles: {
        Formats: ['srt'],
        OutputStartIndex: 0,
      },
    };

    const transcribeConfig = {
      region,
      credentials,
    };
    const transcribeClient = new TranscribeClient(transcribeConfig);
    const transcribeCommand = new StartTranscriptionJobCommand(input);
    const getTranscribeCommand = new GetTranscriptionJobCommand({
      TranscriptionJobName: input.TranscriptionJobName,
    });
    try {
      const transcribeResponse = await transcribeClient.send(transcribeCommand);
      console.log('Transcription job created, the details:');
      console.log(transcribeResponse.TranscriptionJob);

      let jobResponse;
      const interval = setInterval(async () => {
        jobResponse = await transcribeClient.send(getTranscribeCommand);
        console.log(104, jobResponse);
        if (
          jobResponse.TranscriptionJob.TranscriptionJobStatus === 'COMPLETED'
        ) {
          clearInterval(interval);
          await this.readS3File(input.TranscriptionJobName, videoUUID);
        }
      }, 10000);

      return true;
    } catch (err) {
      console.log(err);
    }
  }
  //字幕時間轉成number
  videoTimeToNumber(time: string) {
    const cutTime = time.substring(0, 8).split(':');
    let second = 0;
    second += Number(cutTime[0]) * 60 * 60;
    second += Number(cutTime[1]) * 60;
    second += Number(cutTime[2]);
    return second;
  }
  //讀取S3檔案
  async readS3File(s3VideoFile: string, videoUUID: string) {
    const rl = readline.createInterface({
      input: this.s3
        .getObject({
          Bucket: 'i-note-you-s3/video-text',
          Key: `${s3VideoFile}.srt`,
        })
        .createReadStream(),
    });
    let row = 1;
    const videoTextTime: { startTime: number; endTime: number }[] = [];
    const videoKeyword: { keyWord: string[] }[] = [];
    for await (const line of rl) {
      if (row % 4 === 2) {
        videoTextTime.push({
          startTime: this.videoTimeToNumber(line.substring(0, 12)),
          endTime: this.videoTimeToNumber(line.substring(17, 29)),
        });
      } else if (row % 4 === 3) {
        const cutKeywords = await this.jiebaService.cutWord(line);
        videoKeyword.push({
          keyWord: cutKeywords.map((cutKeyword) => {
            return cutKeyword.keyword;
          }),
        });
      }
      row += 1;
    }
    console.log(videoTextTime);
    console.log(videoKeyword);
    const saveKeywordList: {
      startTime: number;
      endTime: number;
      keywords: string[];
    }[] = [];
    for (let i = 0; i < videoTextTime.length; i++) {
      saveKeywordList.push(
        this.videoKeywordRepository.create({
          videoId: videoUUID,
          startTime: videoTextTime[i].startTime,
          endTime: videoTextTime[i].endTime,
          keywords: videoKeyword[i].keyWord,
        }),
      );
    }
    await this.videoKeywordRepository.save(saveKeywordList);
    const video = await this.unitVideoRepository.save({
      id: videoUUID,
      analyzeStatus: VideoAnalyzeStatus.Analyzed,
    });
    this.logger.log(`${videoUUID} video analyze complete`);
    return video;
  }

  async deleteFile(fileName: string, bucketName: string) {
    const param: AWS.S3.Types.DeleteObjectRequest = {
      Bucket: bucketName,
      Key: fileName,
    };
    try {
      return await this.s3.deleteObject(param).promise();
    } catch (e) {
      console.log(e);
      return e;
    }
  }
}
