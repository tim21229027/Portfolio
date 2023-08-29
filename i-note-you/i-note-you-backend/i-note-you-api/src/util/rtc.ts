import { RtcRole, RtcTokenBuilder } from 'agora-access-token';
// import * as AgoraRTC from 'agora-rtc-sdk';

export class RTCService {
  private APP_ID = process.env.RTC_APP_ID;
  private APP_CERTIFICATE = process.env.RTC_APP_CERTIFICATE;

  async generateToken(
    channelName: string,
    role: 'PUBLISHER' | 'SUBSCRIBER',
    uid: number,
  ) {
    const currentTime = Math.floor(Date.now() / 1000);
    let tokenRole: number;
    role === 'PUBLISHER'
      ? (tokenRole = RtcRole.PUBLISHER)
      : (tokenRole = RtcRole.SUBSCRIBER);
    const token = RtcTokenBuilder.buildTokenWithUid(
      this.APP_ID,
      this.APP_CERTIFICATE,
      channelName,
      uid,
      tokenRole,
      currentTime + 3600,
    );
    return token;
  }

  // async creatClient() {
  //   const client = AgoraRTC.createClient({
  //     mode: 'rtc',
  //     codec: 'vp8',
  //   });
  //   client.init(
  //     this.APP_ID,
  //     () => {
  //       console.log('client initialized');
  //     },
  //     (err) => {
  //       console.log('client init failed ', err);
  //     },
  //   );
  //   return client;
  // }

  //   async joinChannel(channelName: string, client: Client) {
  //     const token = await this.generateToken('PUBLISHER');
  //     client.join(token, 'test', 0);
  //     return;
  //   }

  //   async createStream(client: Client) {
  //     const localStream = AgoraRTC.createStream({
  //       audio: true,
  //       video: true,
  //     });
  //     localStream.init(() => {
  //       // 播放本地流
  //       localStream.play('me');
  //       // 发布本地流
  //       client.publish(localStream);
  //     });
  //   }
}
