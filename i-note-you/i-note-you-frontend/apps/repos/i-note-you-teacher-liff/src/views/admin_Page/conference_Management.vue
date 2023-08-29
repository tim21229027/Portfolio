<script setup lang="ts">
import { useMessage, useDialog, useThemeVars } from "naive-ui";
import user_img from "@/assets/img/conference/peopleCount.png";
import { defineComponent, onMounted, ref, watch, reactive } from "vue";
import * as echarts from "echarts";
import "echarts-wordcloud/dist/echarts-wordcloud";
import "echarts-wordcloud/dist/echarts-wordcloud.min";
import axios from "axios";
const baseUrl = ref("https://www.noteyou.ga/");
const courseMemberId = ref(localStorage.getItem("courseMemberId"));
const courseId = ref(localStorage.getItem("SelectCourse"));
const UnitUrl = baseUrl.value + "course/" + courseId.value + "/units";

const UnitList = ref([]);
const selectUnit = ref("");
const options = ref([]);

onMounted(() => {});
// echart节点
const charts = ref<HTMLElement | null>(null);

const sites: any = reactive([
  { name: "資訊安全", value: Math.round(Math.random() * 99) + 1 },
  {
    name: "資訊安全鐵三角",
    value: Math.round(Math.random() * 99) + 1,
  },
  { name: "機密性", value: Math.round(Math.random() * 99) + 1 },
  { name: "檔案加密", value: Math.round(Math.random() * 99) + 1 },
  { name: "可用性", value: Math.round(Math.random() * 99) + 1 },
  { name: "想哭病毒", value: Math.round(Math.random() * 99) + 1 },
  { name: "惡意廣告", value: Math.round(Math.random() * 99) + 1 },
  { name: "SSL憑證", value: Math.round(Math.random() * 99) + 1 },
  { name: "釣魚郵件", value: Math.round(Math.random() * 99) + 1 },
  { name: "完整性", value: Math.round(Math.random() * 99) + 1 },
]);
sites.sort(function (a: any, b: any) {
  return b.value - a.value;
});

const people: any = [
  { text: "王至明", index: 57, att: 15 },
  { text: "陳文華", index: 66, att: 100 },
  { text: "王博鈞", index: 83, att: 95 },
  { text: "林皓翔", index: 43, att: 77 },
  { text: "李麗寶", index: 22, att: 25 },
  { text: "鄭宇欣", index: 15, att: 10 },
  { text: "呂凱文", index: 89, att: 50 },
  { text: "邱柏翔", index: 98, att: 37 },
  { text: "楊嘉怡", index: 32, att: 76 },
  { text: "黃與柔", index: 31, att: 12 },
];
const peopleValue = ref(people.length);

const people_name = "劉士豪";
const people_img = user_img;
const select_people = ref(0);
const people_message = "HaHaHa";
const messageTime = "20:00";

const themeVars = useThemeVars();
const progress = 90;
axios.get(UnitUrl).then((res) => {
  var listA = [];
  for (let i = 0; i < res.data.length; i++) {
    UnitList.value = [
      {
        label: res.data[i].teachContent,
        value: res.data[i].id,
      },
    ];

    for (let j = 0; j < UnitList.value.length; j++) {
      console.log(UnitList.value[j]);
      options.value.push(UnitList.value[j]);
    }
  }
  // localStorage.setItem("MettingUnitID", res.data.meetingId);
});

watch(
  sites,
  (newValue, oldValue) => {},

  {
    immediate: false, //默认为false,是否在页面加载后先触发一次回调
    deep: true, //默认为false,是否开启深度监视
  }
);

watch(selectUnit, (newValue, oldValue) => {
  localStorage.setItem("MettingUnit", selectUnit.value);
});
const randomValue = () => {
  for (let i = 0; i < sites.length; i++) {
    sites[i].value = Math.round(Math.random() * 99) + 1;
  }
  sites.sort(function (a: any, b: any) {
    return b.value - a.value;
  });
};

const select_call = () => {
  if (select_people.value == 0) {
    select_people.value = 1;
  } else {
    select_people.value = 0;
  }
};
</script>
<script lang="ts">
import RTCClient from "./agora-rtc-client";
import StreamPlayer from "./stream-player.vue";
import { log } from "../../utils/utils";

export default {
  components: {
    StreamPlayer,
  },
  data() {
    return {
      baseUrl: "https://www.noteyou.ga/",
      testData: [
        { name: "資訊安全", value: Math.round(Math.random() * 99) + 1 },
        {
          name: "資訊安全鐵三角",
          value: Math.round(Math.random() * 99) + 1,
        },
        { name: "機密性", value: Math.round(Math.random() * 99) + 1 },
        { name: "檔案加密", value: Math.round(Math.random() * 99) + 1 },
        { name: "可用性", value: Math.round(Math.random() * 99) + 1 },
        { name: "想哭病毒", value: Math.round(Math.random() * 99) + 1 },
        { name: "惡意廣告", value: Math.round(Math.random() * 99) + 1 },
        { name: "SSL憑證", value: Math.round(Math.random() * 99) + 1 },
        { name: "釣魚郵件", value: Math.round(Math.random() * 99) + 1 },
        { name: "完整性", value: Math.round(Math.random() * 99) + 1 },
      ],
      meetingDelId: "adca30c8-9f77-484e-bef9-4244940f3795",
      courseMemberId: localStorage.getItem("courseMemberId"),
      courseId: localStorage.getItem("SelectCourse"),
      KeyWordUrl:
        this.baseUrl +
        "course/unit/" +
        localStorage.getItem("MettingUnit") +
        "/keyword",
      MemberUrl:
        this.baseUrl +
        "course/unit/" +
        localStorage.getItem("MettingUnit") +
        "/notes",

      memberList: [],
      keyWordList: [],
      NoteMemberList: [],
      MessageList: [],
      meeting_count: 0,
      allSimilarity: 0,

      option: {
        appid: "416dd14141354b38b7954203f20175df",
        token:
          "007eJxTYKj5yd30i3Xmk72GzyvYkm/qFQeo+8+88O2wluYu+5Mec6UVGEwMzVJSDE2A0NjUJMnYIsnc0tTEyMA4zcjA0Nw0JW2KYFBKQyAjQ0TEfUZGBggE8VkZSlKLSwwZGAA3LB47",
        uid: 123,
        channel: "test1",
      },
      disableJoin: false,
      localStream: null,
      screenStream: null,
      remoteStreams: [],
      timer: 100,
      messageInput: "",
    };
  },
  props: {
    msg: String,
  },
  watch: {
    keyWordList() {
      const myChart = echarts.init(
        document.getElementById("wordCloud") as HTMLElement
      );
      myChart.setOption({
        series: [
          {
            type: "wordCloud",
            // 用来调整词之间的距离
            gridSize: 28,
            // 用来调整字的大小范围
            sizeRange: [20, 45],
            rotationRange: [0, 0],
            // 随机生成字体颜色
            textStyle: {
              color: function () {
                return (
                  "rgb(" +
                  Math.round(Math.random() * 220) +
                  ", " +
                  Math.round(Math.random() * 220) +
                  ", " +
                  Math.round(Math.random() * 220) +
                  ")"
                );
              },
            },
            left: "center",
            top: "center",
            right: null,
            bottom: null,
            // 画布宽
            width: "95%",
            // 画布高
            height: "90%",
            // 是否渲染超出画布的文
            drawOutOfBound: true,
            // 数据
            data: this.keyWordList,
          },
        ],
      });
    },
  },

  methods: {
    share_screen() {
      this.screenStream = null;
      this.rtc
        .publishScreen()
        .then((stream: any) => {
          console.log("Publish Success");
          this.localStream = null;
          this.screenStream = stream;
        })
        .catch((err: any) => {
          console.log("Publish Failure");

          log("publish local error", err);
        });
    },
    close_screen() {
      this.localStream = null;
      this.rtc
        .publishStream()
        .then((stream: any) => {
          console.log("Publish Success");
          this.localStream = stream;
          this.screenStream = null;
        })
        .catch((err: any) => {
          console.log("Publish Failure");

          log("publish local error", err);
        });
    },
    PostMessage() {
      const self = this;
      const PostMessageUrl =
        self.baseUrl +
        "course/meeting/message/" +
        localStorage.getItem("MettingMemberID");
      axios.post(PostMessageUrl, { message: self.messageInput }).then((res) => {
        self.messageInput = "";
      });
      var MessageUrl =
        self.baseUrl +
        "course/meeting/" +
        localStorage.getItem("MettingID") +
        "/message";

      axios.get(MessageUrl).then((res) => {
        self.MessageList = res.data;
      });
    },
    keyWordUpdate() {
      const self = this;
      var KeyWordUrl =
        self.baseUrl +
        "course/unit/" +
        localStorage.getItem("MettingUnit") +
        "/keyword";
      var listA = [];
      var listB = [];
      var interval = setInterval(function () {
        self.keyWordList = [];
        //每5秒刷新一次图表
        //需要执行的代码写在这里
        axios.get(KeyWordUrl).then((res) => {
          listA = res.data.slice(0, 20);
          console.log(listA, "listA");
          for (let i in listA) {
            listB = [
              {
                name: listA[i].keyword,
                value: Math.ceil(listA[i].allRate),
              },
            ];
            for (let j = 0; j < listB.length; j++) {
              self.keyWordList.push(listB[j]);
            }
          }
          console.log(listB, "listB");
          console.log(self.keyWordList, "前");
          self.keyWordList = Array.from(self.keyWordList);
          console.log(self.keyWordList, "後");

          var SimilarityList = 0;
          for (let i = 0; i < self.NoteMemberList.length; i++) {
            SimilarityList += parseInt(self.NoteMemberList[i].similarity);
          }
          self.allSimilarity = SimilarityList / self.NoteMemberList.length;
        });

        if (self.meeting_count == 0) {
          clearInterval(interval);
        }
      }, 8000);
    },
    timerForcus() {
      var self = this;
      var MemberUrl =
        self.baseUrl +
        "course/unit/" +
        localStorage.getItem("MettingUnit") +
        "/notes";
      var interval = setInterval(function () {
        var MessageUrl =
          self.baseUrl +
          "course/meeting/" +
          localStorage.getItem("MettingID") +
          "/message";

        axios.get(MessageUrl).then((res) => {
          self.MessageList = res.data;
        });
        var meetingMemberUrl =
          self.baseUrl +
          "course/meeting/" +
          localStorage.getItem("MettingID") +
          "/members";

        axios.get(meetingMemberUrl).then((res) => {
          self.memberList = [];
          console.log(res.data);
          self.memberList = res.data;
        });

        axios.get(MemberUrl).then((res) => {
          console.log(res.data, "筆記人員");
          self.NoteMemberList = [];
          self.NoteMemberList = res.data;

          console.log(self.memberList, "結果");
          //agora
        });

        self.timer -= 1;
        if (self.timer <= 1) {
          self.timer = 100;
        }
        if (self.meeting_count == 0) {
          clearInterval(interval);
        }
      }, 2000);
    },

    joinEvent() {
      //創建

      const self = this;
      self.timerForcus();
      self.keyWordUpdate();
      var meetingCreatUrl =
        this.baseUrl +
        "course/" +
        this.courseId +
        "/meeting/" +
        this.courseMemberId;

      axios
        .post(meetingCreatUrl, {})
        .then(function (res) {
          console.log(res.data);
          console.log(res.data.meetingId, "看mettingID");
          localStorage.setItem("MettingID", res.data.meetingId);
          // localStorage.setItem("AppId", res.data.RtcAppId);
          // localStorage.setItem("AppToken", res.data.RtcToken);
          // localStorage.setItem("AppUid", res.data.uid);

          // self.option.appid = res.data.RtcAppId;
          // self.option.token = res.data.RtcToken;
          // self.option.channel = res.data.meetingId;
          // self.option.uid = res.data.uid;

          // self.rtc.renew();

          var meetingMemberUrl =
            self.baseUrl +
            "course/meeting/" +
            localStorage.getItem("MettingID") +
            "/members";

          var TestList = [];
          axios.get(meetingMemberUrl).then((res) => {
            self.memberList = [];
            console.log(res.data);
            self.memberList = res.data;
          });
          var MemberUrl =
            self.baseUrl +
            "course/unit/" +
            localStorage.getItem("MettingUnit") +
            "/notes";

          axios.get(MemberUrl).then((res) => {
            console.log(res.data, "筆記人員");
            self.NoteMemberList = [];
            self.NoteMemberList = res.data;
            for (let i = 0; i < self.memberList.length; i++) {
              for (let j = 0; j < self.NoteMemberList.length; j++) {
                if (
                  self.memberList[i].courseMemberId ==
                  self.NoteMemberList[j].courseMemberId
                ) {
                  self.memberList[i].push(self.NoteMemberList[j].similarity);
                }
              }
            }
            console.log(self.memberList, "結果");
            //agora
          });
          var MessageUrl =
            self.baseUrl +
            "course/meeting/" +
            localStorage.getItem("MettingID") +
            "/message";

          axios.get(MessageUrl).then((res) => {
            self.MessageList = res.data;
            console.log(self.MessageList, "對話");
          });

          console.log(self.option.channel, "頻道");

          if (!self.option.appid) {
            self.judge("Appid");
            return;
          }
          if (!self.option.channel) {
            self.judge("Channel Name");
            return;
          }
          self.rtc
            .joinChannel(self.option)
            .then(() => {
              console.log("Join Success");

              self.rtc
                .publishStream()
                .then((stream: any) => {
                  console.log("Publish Success");
                  self.localStream = stream;
                })
                .catch((err: any) => {
                  console.log("Publish Failure");

                  log("publish local error", err);
                });
            })
            .catch((err: any) => {
              console.log("Join Failure");
            });
        })
        .catch(function (error) {
          console.log(error);
        });

      this.meeting_count = 1;

      // 加入

      this.disableJoin = true;
    },
    leaveEvent() {
      var self = this;
      //刪除
      var meetingDelUrl =
        self.baseUrl + "course/meeting/" + localStorage.getItem("MettingID");
      axios
        .delete(meetingDelUrl, {})
        .then(function (res) {
          // localStorage.removeItem("MettingID");
          console.log(res, "確認刪除");
        })
        .catch(function (error) {
          console.log(error);
        });
      this.meeting_count = 0;
      this.disableJoin = false;

      this.rtc
        .leaveChannel()
        .then(() => {
          console.log("Leave Success");
        })
        .catch((err: any) => {
          console.log("Leave Failure");
          log("leave error", err);
        });
      this.localStream = null;
      this.remoteStreams = [];
    },
    judge(detail: any) {
      console.log(`Please enter the ${detail}`);
    },
  },

  created() {
    this.rtc = new RTCClient();
    let rtc = this.rtc;
    rtc.on("stream-added", (evt: any) => {
      var self = this;
      let { stream } = evt;
      log("[agora] [stream-added] stream-added", stream.getId());
      rtc.client.subscribe(stream);
    });

    rtc.on("stream-subscribed", (evt: any) => {
      var self = this;
      let { stream } = evt;
      log("[agora] [stream-subscribed] stream-added", stream.getId());
      if (
        !this.remoteStreams.find((it: any) => it.getId() === stream.getId())
      ) {
        this.remoteStreams.push(stream);
      }
    });

    rtc.on("stream-removed", (evt: any) => {
      var self = this;
      let { stream } = evt;
      log("[agora] [stream-removed] stream-removed", stream.getId());
      this.remoteStreams = this.remoteStreams.filter(
        (it: any) => it.getId() !== stream.getId()
      );

      var meetingMemberUrl =
        this.baseUrl +
        "course/meeting/" +
        localStorage.getItem("MettingID") +
        "/members";
      self.memberList = [];

      axios.get(meetingMemberUrl).then((res) => {
        console.log(res.data);
        self.memberList = res.data;
      });
      var MemberUrl =
        self.baseUrl +
        "course/unit/" +
        localStorage.getItem("MettingUnit") +
        "/notes";

      axios.get(MemberUrl).then((res) => {
        console.log(res.data, "筆記人員");
        self.NoteMemberList = [];
        self.NoteMemberList = res.data;
        for (let i = 0; i < self.memberList.length; i++) {
          for (let j = 0; j < self.NoteMemberList.length; j++) {
            if (
              self.memberList[i].courseMemberId ==
              self.NoteMemberList[j].courseMemberId
            ) {
              self.memberList[i].push(self.NoteMemberList[j].similarity);
            }
          }
        }
        console.log(self.memberList, "結果");
        //agora
      });
    });

    rtc.on("peer-online", (evt: any) => {
      var self = this;
      console.log(`Peer ${evt.uid} is online`);
    });

    rtc.on("peer-leave", (evt: any) => {
      var self = this;
      console.log(`Peer ${evt.uid} already leave`);
      this.remoteStreams = this.remoteStreams.filter(
        (it: any) => it.getId() !== evt.uid
      );
    });
  },
};
</script>

<template>
  <div class="textbook_Management">
    <n-row gutter="12"
      ><n-col :span="11"> <div class="textbook_header">會議管理</div></n-col>
      <n-col :span="12">
        <n-button
          v-if="meeting_count < 1"
          type="info"
          color="#170600"
          class="creatCourse_btn"
          @click="joinEvent"
          :disabled="disableJoin"
        >
          創建會議
        </n-button>
        <div
          style="float: right; width: 30%; margin-right: 30px"
          v-show="meeting_count == 0"
        >
          選擇單元
          <n-select
            v-model:value="selectUnit"
            :options="options"
            style="width: 100%"
          />
        </div>
      </n-col>
    </n-row>

    <div v-show="meeting_count >= 1">
      <n-row gutter="12"
        ><n-col :span="16"
          ><div class="call">
            <div class="shareScreen">
              <n-button
                @click="share_screen()"
                v-if="!screenStream"
                color="#170600"
                >分享螢幕</n-button
              >
              <n-button @click="close_screen()" v-else color="#170600"
                >關閉分享</n-button
              >
            </div>
            <div class="REvideo">
              <div>
                <div class="start-screen-recording">
                  <div>
                    <div class="rec-dot"></div>
                    <span>開始錄製</span>
                  </div>
                </div>
              </div>
            </div>
            <div class="agora-view">
              <div class="agora-video">
                <StreamPlayer
                  :stream="screenStream"
                  :domId="screenStream.getId()"
                  v-if="screenStream"
                ></StreamPlayer>
              </div>
              <div class="agora-video">
                <StreamPlayer
                  :stream="localStream"
                  :domId="localStream.getId()"
                  v-if="localStream"
                ></StreamPlayer>
              </div>
              <div
                class="agora-video"
                :key="index"
                v-for="(remoteStream, index) in remoteStreams"
              >
                <StreamPlayer
                  :stream="remoteStream"
                  :domId="remoteStream.getId()"
                ></StreamPlayer>
              </div>
            </div>

            <div class="call_btn">
              <n-row gutter="12"
                ><n-col :span="12" class="callPhone"
                  ><n-button
                    @click="leaveEvent"
                    plain
                    :disabled="!disableJoin"
                    color="#170600"
                    circle
                  >
                    <img
                      src="../../assets/img/conference/phoneMissed.png"
                      width="25" /></n-button></n-col
                ><n-col :span="12" class="callMic"
                  ><n-button color="#170600" circle
                    ><img
                      src="../../assets/img/conference/mic.png"
                      width="25" /></n-button></n-col
              ></n-row>
            </div></div
        ></n-col>

        <n-col :span="7"
          ><div class="people">
            <div class="people_show">
              <n-scrollbar class="pepole_list">
                <div v-if="select_people == 0">
                  <div
                    class="people_list2"
                    v-for="person in memberList"
                    :key="person"
                  >
                    <n-row gutter="12"
                      ><n-col :span="16"
                        ><n-popover
                          trigger="hover"
                          placement="bottom"
                          v-if="person.host == false"
                        >
                          <template #trigger>
                            <n-progress
                              stroke-width="10"
                              :percentage="timer"
                              color="red"
                              style="width: 100%; top: -3px; margin-left: 5px"
                              :show-indicator="false"
                            >
                            </n-progress>
                          </template>
                          <span
                            >學生專注度
                            <p>(紅色進度條會隨著學生閒置時間逐漸減少)</p></span
                          >
                        </n-popover>
                        <div class="peopleImgBorder">
                          <img
                            :src="person.image"
                            width="35"
                            class="peopleImg"
                          />
                        </div>
                        <span class="people_name">{{
                          person.name
                        }}</span></n-col
                      ><n-col :span="8" class="mic">
                        <img
                          src="../../assets/img/conference/mic.png"
                          width="28"
                          class="peopleRightMic"
                          style="
                            background-color: #000;
                            padding: 2px;
                            border-radius: 100%;
                            margin-top: 5px;
                          "
                        /> </n-col
                    ></n-row>
                    <n-popover
                      trigger="hover"
                      placement="bottom"
                      v-if="person.host == false"
                    >
                      <template #trigger>
                        <n-progress
                          type="line"
                          stroke-width="15"
                          :percentage="NoteMemberList[1].similarity"
                          color="#170600"
                          style="top: 5px; padding-left: 5px; width: 95%"
                        >
                        </n-progress>
                      </template>
                      <span
                        >學生理解度
                        <p>(進度條會隨著學生筆記相似度增加)</p></span
                      >
                    </n-popover>
                  </div>
                </div>
                <div class="people_list3" v-if="select_people == 1">
                  <n-row gutter="12"
                    ><n-col :span="17"
                      ><div
                        style="margin-top: 20px"
                        v-for="item in MessageList"
                        :key="item"
                      >
                        <div class="peopleImgBorder">
                          <img :src="item.image" width="35" class="peopleImg" />
                        </div>
                        <span class="user_messageName">
                          {{ item.name }}
                        </span>
                        <span class="people_messageName">
                          {{ item.message }}
                        </span>
                      </div></n-col
                    ></n-row
                  >
                  <div></div>
                </div>
              </n-scrollbar>
              <div class="messageInput" v-if="select_people == 1">
                <n-input
                  @keyup.enter="PostMessage()"
                  v-model:value="messageInput"
                  type="text"
                  placeholder="Basic Input"
                />
              </div>
            </div>

            <div class="people_mean">
              <n-row gutter="12" v-if="select_people == 0"
                ><n-col :span="12" class="people_count"
                  ><n-badge :value="memberList.length" :max="60">
                    <n-icon color="#170600" size="30"
                      ><svg
                        xmlns="http://www.w3.org/2000/svg"
                        xmlns:xlink="http://www.w3.org/1999/xlink"
                        viewBox="0 0 448 512"
                      >
                        <path
                          d="M224 256c70.7 0 128-57.3 128-128S294.7 0 224 0S96 57.3 96 128s57.3 128 128 128zm89.6 32h-16.7c-22.2 10.2-46.9 16-72.9 16s-50.6-5.8-72.9-16h-16.7C60.2 288 0 348.2 0 422.4V464c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48v-41.6c0-74.2-60.2-134.4-134.4-134.4z"
                          fill="currentColor"
                        ></path>
                      </svg>
                    </n-icon> </n-badge></n-col
                ><n-col :span="12" class="message_mean">
                  <n-icon color="gray" size="30" @click="select_call()"
                    ><svg
                      xmlns="http://www.w3.org/2000/svg"
                      xmlns:xlink="http://www.w3.org/1999/xlink"
                      viewBox="0 0 24 24"
                    >
                      <path
                        d="M20 2H4c-1.1 0-1.99.9-1.99 2L2 22l4-4h14c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2zm-2 12H6v-2h12v2zm0-3H6V9h12v2zm0-3H6V6h12v2z"
                        fill="currentColor"
                      ></path>
                    </svg>
                  </n-icon> </n-col
              ></n-row>
              <n-row gutter="12" v-if="select_people == 1"
                ><n-col :span="12" class="people_count"
                  ><n-badge :value="memberList.length" :max="60">
                    <div>
                      <n-icon @click="select_call()" size="30" color="gray"
                        ><svg
                          xmlns="http://www.w3.org/2000/svg"
                          xmlns:xlink="http://www.w3.org/1999/xlink"
                          viewBox="0 0 448 512"
                        >
                          <path
                            d="M224 256c70.7 0 128-57.3 128-128S294.7 0 224 0S96 57.3 96 128s57.3 128 128 128zm89.6 32h-16.7c-22.2 10.2-46.9 16-72.9 16s-50.6-5.8-72.9-16h-16.7C60.2 288 0 348.2 0 422.4V464c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48v-41.6c0-74.2-60.2-134.4-134.4-134.4z"
                            fill="currentColor"
                          ></path>
                        </svg>
                      </n-icon></div></n-badge></n-col
                ><n-col :span="12" class="message_mean"
                  ><n-icon color="#170600" size="30" @click="select_call()"
                    ><svg
                      xmlns="http://www.w3.org/2000/svg"
                      xmlns:xlink="http://www.w3.org/1999/xlink"
                      viewBox="0 0 24 24"
                    >
                      <path
                        d="M20 2H4c-1.1 0-1.99.9-1.99 2L2 22l4-4h14c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2zm-2 12H6v-2h12v2zm0-3H6V9h12v2zm0-3H6V6h12v2z"
                        fill="currentColor"
                      ></path>
                    </svg> </n-icon></n-col
              ></n-row>
            </div></div></n-col
      ></n-row>

      <n-row gutter="12"
        ><n-col :span="23"
          ><div class="keyword">
            <n-row gutter="12"
              ><n-col :span="24">
                <!-- <n-button
                  type="info"
                  color="#170600"
                  class="creatCourse_btn"
                  @click="randomValue"
                >
                </n-button> -->
                <div class="box">
                  <n-popover trigger="hover" placement="right">
                    <template #trigger>
                      <div class="rect">
                        <text>{{ allSimilarity }}%</text>
                      </div>
                    </template>
                    <span>全班理解度</span>
                  </n-popover>
                </div>
                <div class="keywordPlace">
                  <div class="keywordCloud">
                    <div ref="wordCloud" id="wordCloud" class="wordCloud" />
                  </div>
                  <n-scrollbar class="keyword_list">
                    <div
                      class="keywordRank"
                      v-for="site in keyWordList"
                      :key="site"
                    >
                      <div class="keywordName">{{ site.name }}</div>
                      <n-progress
                        type="line"
                        color="#170600"
                        :percentage="Math.ceil(site.value)"
                        indicator-text-color="#170600"
                        class="keywordProgress"
                      />
                    </div>
                  </n-scrollbar>
                </div> </n-col
            ></n-row></div></n-col
      ></n-row>
    </div>

    <div v-show="meeting_count < 1" class="empty">
      <img src="../../assets/img/conference/NoConference.png" />
    </div>
  </div>
</template>

<style>
</style>
