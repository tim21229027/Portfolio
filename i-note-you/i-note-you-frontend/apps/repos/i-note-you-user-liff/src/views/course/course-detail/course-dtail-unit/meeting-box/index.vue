<script setup lang="ts">
import {
  Microphone,
  PhoneBlock,
  Chat,
  ChartBarStacked,
  UserMultiple,
} from "@vicons/carbon";
import { NIcon, NBadge, NInput, NSpin } from "naive-ui";
import { useMagicKeys } from "@vueuse/core";
import { ref, watch, onMounted } from "vue";
import CourseMeetMemberBox from "@/views/course/components/CourseMeetMemberBox.vue";
import CourseMeetKeywordBox from "@/views/course/components/CourseMeetKeywordBox.vue";
import Codemirror from "codemirror-editor-vue3";
// import "codemirror/mode/javascript/javascript.js"; // language
import { useCourseState } from "@/utils/hooks/useCourse";
import CourseMeetChatBox from "@/views/course/components/CourseMeetChatBox.vue";
// @ts-ignore
import { rtc } from "@/utils/agora-rtc-client.js";
import StreamPlayer from "@/components/StreamPlayer.vue";
import {
  getCourseUnitPersonNote,
  postCourseUnitPersonNote,
  getCourseUnitMeetMember,
  getCourseUnitMeetMessageList,
  postCourseUnitMeetMessage,
  getCourseUnitKeywords,
  postJoinMeet,
  postLeaveMeet,
} from "@/service/course";
import {
  CourseUnitNoteType,
  CourseMeetMemberType,
  CourseMeetMessageType,
  CourseKeywordType,
  JoinMeetType,
} from "@/service/course/type";
import { ElLoading } from "element-plus";
interface Props {
  unitId: string;
  sidebarValue: number;
}
interface Emits {
  (e: "update:sidebarValue", sidebarValue: number): void;
}
const props = defineProps<Props>();
const emits = defineEmits<Emits>();
const { getCourseDetailData } = useCourseState();
const noteData = ref<CourseUnitNoteType>({
  id: "",
  createAt: "",
  deletedAt: null,
  unitId: "",
  courseMemberId: "",
  content: "",
  similarity: null,
});
const meetMembersData = ref<CourseMeetMemberType[]>([]);
const meetMessagesData = ref<CourseMeetMessageType[]>([]);
const meetKeywordsData = ref<CourseKeywordType[]>([]);
const meetRoomData = ref<JoinMeetType>({
  uid: 0,
  host: false,
  meetingId: "",
  courseMemberId: "",
  deletedAt: null,
  id: "",
  createAt: "",
  RtcAppId: "",
  RtcToken: "",
});
const option: {
  appid: string;
  token: string;
  uid: number | null;
  channel: string;
} = {
  appid: "416dd14141354b38b7954203f20175df",
  token:
    "007eJxTYNBdKBN2fdU0J8+bi2wnfgqzer6/9pmy1PZ/k5/st7n41/mZAoOJoVlKiqEJEBqbmiQZWySZW5qaGBkYpxkZGJqbpqR9+pyX3BDIyLBigQUrIwMEgvisDCWpxSWGDAwABxQh8Q==",
  uid: null,
  channel: "test1",
};
let disableJoin = false;
let localStream: any = null;
let remoteStreams: any = [];
// let rtc: any = {
//   localAudioTrack: null,
//   localVideoTrack: null,
//   client: null,
// };
// let options = {
//   // Pass your App ID here.
//   appId: "77bb08e4cd5b4496a17658e7cff74f60",
//   // Set the channel name.
//   channel: "test",
//   // Pass your temp token here.
//   token:
//     "007eJxTYJD5YFTZsWQxS/lkv36e6zryvl6O6Wnx7w+wTRC8N8V/8X0FBnPzpCQDi1ST5BTTJBMTS7NEQ3MzU4tU8+S0NHOTNDMDh3MRyQ2BjAy7y4SYGBkgEMRnYShJLS5hYAAAyg0dzQ==",
//   // Set the user ID.
//   uid: null,
// };
const { getCourseNoteData, getCourseMeetingData } = useCourseState();
const { Enter } = useMagicKeys();
const meetRoomValue = ref(0);
const meetChat = ref("");
const cmOptions = {
  mode: "text/javascript", // 语言模式
  theme: "dracula", // 主题
  lineNumbers: true, // 显示行号
  smartIndent: true, // 智能缩进
  indentUnit: 2, // 智能缩进单位为4个空格长度
  foldGutter: true, // 启用行槽中的代码折叠
  styleActiveLine: true, // 显示选中行的样式
  origin: true,
};
const onChange = (val: any, cm: any) => {
  // console.log(20, val);
  // console.log(21, cm);

  setTimeout(async () => {
    console.log(noteData.value.unitId, noteData.value.courseMemberId);
    console.log(31, val);
    const uploaadNoteData = await postCourseUnitPersonNote(
      noteData.value.unitId,
      noteData.value.courseMemberId,
      val
    );
    console.log(51, uploaadNoteData);
  }, 5000);
};
const handleSelectAction = (selectIndex: number) => {
  meetRoomValue.value = selectIndex;
};
const handleSentMessage = async () => {
  console.log(meetChat.value);
  if (meetChat.value.length !== 0) {
    const messsage = meetChat.value;
    meetChat.value = "";
    const postMeetMessage = await postCourseUnitMeetMessage(
      meetRoomData.value.id,
      messsage
    );
    console.log(100, postMeetMessage);
  }
  const meetMessageList = await getCourseUnitMeetMessageList(
    meetRoomData.value.meetingId
  );
  meetMessagesData.value = meetMessageList;
};

const startBasicCall = async () => {
  rtc.on("stream-added", (evt: any) => {
    let { stream } = evt;
    console.log("[agora] [stream-added] stream-added", stream.getId());
    rtc.client.subscribe(stream);
  });

  rtc.on("stream-subscribed", (evt: any) => {
    let { stream } = evt;
    console.log("[agora] [stream-subscribed] stream-added", stream.getId());
    if (!remoteStreams.find((it: any) => it.getId() === stream.getId())) {
      remoteStreams.push(stream);
    }
  });

  rtc.on("stream-removed", (evt: any) => {
    let { stream } = evt;
    console.log("[agora] [stream-removed] stream-removed", stream.getId());
    remoteStreams = remoteStreams.filter(
      (it: any) => it.getId() !== stream.getId()
    );
  });

  rtc.on("peer-online", (evt: any) => {
    console.log(`Peer ${evt.uid} is online`);
  });

  rtc.on("peer-leave", (evt: any) => {
    console.log(`Peer ${evt.uid} already leave`);
    remoteStreams = remoteStreams.filter((it: any) => it.getId() !== evt.uid);
  });
};

const joinEvent = async () => {
  rtc
    .joinChannel(option)
    .then(() => {
      console.log({
        message: "Join Success",
        type: "success",
      });
      rtc
        .publishStream()
        .then((stream: any) => {
          const loading = ElLoading.service({
            lock: true,
            text: "載入中",
            background: "rgba(0, 0, 0, 0.7)",
          });
          console.log({
            message: "Publish Success",
            type: "success",
          });
          localStream = stream;
          loading.close();
        })
        .catch((err: any) => {
          console.error("Publish Failure");
          console.log("publish local error", err);
        });
    })
    .catch((err: any) => {
      console.error("Join Failure");
      console.log("join channel error", err);
    });
  disableJoin = true;
};
const handleLeaveMeet = async () => {
  disableJoin = false;
  rtc
    .leaveChannel()
    .then(() => {
      console.log({
        message: "Leave Success",
        type: "success",
      });
    })
    .catch((err: any) => {
      console.error("Leave Failure");
      console.log("leave error", err);
    });
  localStream = null;
  remoteStreams = [];
  const leaveMeet = await postLeaveMeet(
    meetRoomData.value.meetingId,
    meetRoomData.value.id
  );
  emits("update:sidebarValue", 0);

  console.log(253, leaveMeet);
};
watch(Enter, (v) => {
  if (v) handleSentMessage();
});

onMounted(async () => {
  console.log("123123");
  console.log(303, getCourseDetailData.value.courseMemberId);
  console.log(304, props.unitId);
  const loading = ElLoading.service({
    lock: true,
    text: "載入中",
    background: "rgba(0, 0, 0, 0.7)",
  });
  const meetRoom = await postJoinMeet(
    getCourseDetailData.value.id,
    getCourseDetailData.value.courseMemberId
  );
  console.log(306, meetRoom);
  Object.assign(meetRoomData.value, meetRoom);
  console.log(322, meetRoomData.value);
  // Object.assign(option, {
  //   appid: meetRoomData.value.RtcAppId,
  //   token: meetRoomData.value.RtcToken,
  //   channel: meetRoomData.value.meetingId,
  //   uid: meetRoomData.value.uid,
  // });
  // option.appid = meetRoom.RtcAppId;
  // option.token = meetRoom.RtcToken;
  // option.uid = meetRoom.uid;
  console.log(321, option);
  const unitPersonNote = await getCourseUnitPersonNote(
    props.unitId,
    getCourseDetailData.value.courseMemberId
  );
  const meetMembers = await getCourseUnitMeetMember(
    meetRoomData.value.meetingId
  );
  const meetMessageList = await getCourseUnitMeetMessageList(
    meetRoomData.value.meetingId
  );
  const meetKeywords = await getCourseUnitKeywords(props.unitId);

  meetMessagesData.value = meetMessageList;
  meetMembersData.value = meetMembers;
  meetKeywordsData.value = meetKeywords;

  setInterval(async () => {
    const meetMembers = await getCourseUnitMeetMember(
      meetRoomData.value.meetingId
    );
    const meetMessageList = await getCourseUnitMeetMessageList(
      meetRoomData.value.meetingId
    );
    const meetKeywords = await getCourseUnitKeywords(props.unitId);

    meetMembersData.value = meetMembers;
    meetKeywordsData.value = meetKeywords;
    meetMessagesData.value = meetMessageList;
  }, 10000);
  Object.assign(noteData.value, unitPersonNote);
  loading.close();
  await startBasicCall();
  await joinEvent();
  // await joinEvent()
  // await joinMeetingRoom();
});
</script>

<template>
  <div class="mb-[1.5vh]">
    <div class="flex justify-between">
      <!-- <video
        autoplay
        src="@/assets/video/metting-video.mp4"
        class="w-[56.5vw] rounded-[10px] h-[55vh] relative bg-black"
      ></video> -->
      <!-- <div class="agora-video-player">123</div> -->
      <div class="agora-view">
        <!-- <div class="agora-video">
          <StreamPlayer
            :stream="localStream"
            :domId="localStream.getId()"
            v-if="localStream"
          ></StreamPlayer>
        </div> -->
        <div
          v-if="remoteStreams.length === 0"
          class="flex items-center justify-center w-[59vw]"
        >
          <NSpin size="large" />
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
      <div class="absolute bottom-0 left-1/3 -translate-x-1/3 py-[3vh] flex">
        <div
          class="bg-[#170600] flex items-center justify-center rounded-full py-[1vh] mx-[1.5vw]"
        >
          <NIcon
            @click="handleLeaveMeet"
            class="text-[1.5vw] mx-[0.5vw]"
            :color="'#FFFFFF'"
            :component="PhoneBlock"
          />
        </div>
        <div
          class="bg-[#170600] flex items-center justify-center rounded-full py-[1vh] mx-[1.5vw]"
        >
          <NIcon
            class="text-[1.5vw] mx-[0.5vw]"
            :color="'#FFFFFF'"
            :component="Microphone"
          />
        </div>
      </div>
      <div class="border-[#170600] border-[5px] w-[22.5vw] rounded-[10px]">
        <div class="h-[48.25vh] overflow-y-scroll">
          <div
            class="member-list px-[0.5vw] py-[1vh]"
            v-if="meetRoomValue === 0"
          >
            <CourseMeetMemberBox
              v-for="(memberData, index) in meetMembersData"
              :key="index"
              :member-data="memberData"
            />
          </div>
          <div
            class="chat-room px-[1vw] py-[1.5vh] w-full"
            v-if="meetRoomValue === 1"
          >
            <div class="h-[41vh] mb-[1vh] overflow-scroll">
              <CourseMeetChatBox
                v-for="(messageData, index) in meetMessagesData"
                :key="index"
                :message-data="messageData"
              />
            </div>
            <div class="bg-[#C8C8C8] h-full rounded-[5px]">
              <NInput
                class="rounded-[5px] bg-[#C8C8C8] !border-none"
                v-model:value="meetChat"
                placeholder=""
              />
            </div>
          </div>
          <div class="chat-list p-[1vh_0.5vw]" v-if="meetRoomValue === 2">
            <CourseMeetKeywordBox
              v-for="(keywordData, index) in meetKeywordsData"
              :keyword-data="keywordData"
              :keyword-rank="index + 1"
              :key="index"
            />
          </div>
        </div>
        <div
          class="h-[6vh] border-[#170600] border-t-[5px] flex justify-center items-center"
        >
          <div
            :class="`${
              meetRoomValue === 0
                ? 'bg-[#170600] rounded-full py-[0.5vh] px-[0.5vw]'
                : ''
            }  ease-in-out duration-300 mx-[1vw]`"
          >
            <NBadge :value="10" :max="15">
              <NIcon
                :class="` text-[1.5vw]  cursor-pointer`"
                :color="meetRoomValue === 0 ? '#ffffff' : '#170600'"
                :component="UserMultiple"
                @click="handleSelectAction(0)"
              />
            </NBadge>
          </div>
          <div
            :class="`${
              meetRoomValue === 1
                ? 'bg-[#170600] rounded-full  px-[0.5vw] py-[0.5vh]'
                : ''
            }   ease-in-out duration-300 mx-[1vw]`"
          >
            <NBadge :value="10" :max="15">
              <NIcon
                class="text-[1.5vw] cursor-pointer"
                :color="meetRoomValue === 1 ? '#ffffff' : '#170600'"
                :component="Chat"
                @click="handleSelectAction(1)"
              />
            </NBadge>
          </div>
          <div
            :class="`${
              meetRoomValue === 2 ? 'bg-[#170600] rounded-full py-[0.5vh]' : ''
            }  ease-in-out duration-300 mx-[1vw]`"
          >
            <NIcon
              class="text-[1.5vw] mx-[0.5vw] cursor-pointer"
              :color="meetRoomValue === 2 ? '#ffffff' : '#170600'"
              :component="ChartBarStacked"
              @click="handleSelectAction(2)"
            />
          </div>
        </div>
      </div>
    </div>
    <div class="mt-[1.5vh] h-[37vh] rounded-[5px]">
      <Codemirror
        v-model:value="noteData.content"
        :options="cmOptions"
        :border="true"
        placeholder="测试 placeholder"
        class="!font-['Robot-Regular']"
        @change="onChange"
      />
    </div>
  </div>
</template>

<style lang="scss">
.CodeMirror-scroll {
  font-family: Robot-Regular;
  font-size: 1rem;
}
.agora-view {
  display: flex;
  flex-wrap: wrap;
  .agora-video {
    width: 59vw;
    height: 50vh;
    margin: 20px;
    background-color: black;
  }
}
</style>
