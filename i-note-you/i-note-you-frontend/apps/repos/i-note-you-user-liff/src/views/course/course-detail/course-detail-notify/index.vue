<script setup lang="ts">
import CourseDetailSidebar from "../../components/CourseDetailSidebar.vue";
import { NTimeline, NTimelineItem, NInput, NIcon, NAvatar } from "naive-ui";
import { Search } from "@vicons/carbon";
import { ArrowBackIosRound } from "@vicons/material";
import { ref, Ref, onMounted } from "vue";
import { useRoute } from "vue-router";
import CourseNotifyBox from "../../components/CourseNotifyBox.vue";
import CourseNotifyFileBox from "../../components/CourseNotifyFileBox.vue";
import { ElLoading } from "element-plus";
import { useUserState } from "@/utils/hooks/useUser";
import { NotifyType, NotifyDetailType } from "@/service/course/type";
import { getNotifyList, getNotifyDetail } from "@/service/course";
import dayjs from "dayjs";
const { getUserData } = useUserState();
const sidebarDatas = ref(["全部", "已讀", "未讀"]);
const sidebarValue = ref(0);
const route = useRoute();
const notifyListData = ref<NotifyType[]>([]);
const selectNotifyData = ref<NotifyDetailType>({
  id: "",
  createAt: "",
  deletedAt: null,
  title: "",
  image: "",
  content: "",
  courseId: "",
  notifyFiles: [],
  teacherName: "",
  teacherImg: "",
  teacherPhone: "",
  teacherEmail: "",
  attendRate: 0,
  successRate: 0,
  courseCode: "",
  courseTime: "",
  courseName: "",
  coursePeopleCounts: 0,
  readstatus: false,
});
const notifyValue: Ref<null | string> = ref(null);
const handleSelectSidebar = async (sidebarIndex: number) => {
  const loading = ElLoading.service({
    lock: true,
    text: "載入中",
    background: "rgba(0, 0, 0, 0.7)",
  });
  if (sidebarIndex === 0) {
    const notifyList = await getNotifyList(
      getUserData.value.id,
      route.params.courseId as string
    );
    console.log(53, notifyList);
    notifyListData.value = notifyList;
    loading.close();
  }
  if (sidebarIndex === 1) {
    const notifyList = await getNotifyList(
      getUserData.value.id,
      route.params.courseId as string,
      true
    );
    console.log(85, notifyList);
    notifyListData.value = notifyList;
    loading.close();
  }

  if (sidebarIndex === 2) {
    const notifyList = await getNotifyList(
      getUserData.value.id,
      route.params.courseId as string,
      false
    );
    console.log(85, notifyList);
    notifyListData.value = notifyList;
    loading.close();
  }
  sidebarValue.value = sidebarIndex;
};
const handleSelectCourseNotify = async (courseNotifyId: string) => {
  console.log(courseNotifyId);
  const loading = ElLoading.service({
    lock: true,
    text: "載入中",
    background: "rgba(0, 0, 0, 0.7)",
  });
  notifyValue.value = courseNotifyId;
  const notifyDetail = await getNotifyDetail(
    getUserData.value.id,
    courseNotifyId
  );

  Object.assign(selectNotifyData.value, notifyDetail);
  loading.close();
};
const handleGoBackNotify = () => {
  notifyValue.value = null;
};
onMounted(async () => {
  const loading = ElLoading.service({
    lock: true,
    text: "載入中",
    background: "rgba(0, 0, 0, 0.7)",
  });

  const notifyList = await getNotifyList(
    getUserData.value.id,
    route.params.courseId as string
  );
  console.log(85, notifyList);
  notifyListData.value = notifyList;

  loading.close();
});
</script>
<template>
  <div class="h-full flex justify-between">
    <CourseDetailSidebar :title="'通知'">
      <div class="course-notify-sidebar">
        <NTimeline>
          <NTimelineItem
            v-for="(sidebarData, index) in sidebarDatas"
            :key="index"
          >
            <div
              @click="handleSelectSidebar(index)"
              v-if="index % 2 === 1"
              :class="`${
                sidebarValue === index
                  ? 'bg-[#170600] text-white rounded-[5px] px-[0.5vw] py-[0.1vh]'
                  : ''
              } cursor-pointer font-['Robot-Regular'] text-sm w-fit ease-in-out duration-500 `"
            >
              {{ sidebarData }}
            </div>

            <div
              v-else
              @click="handleSelectSidebar(index)"
              :class="` cursor-pointer font-['Robot-Regular'] text-sm`"
            >
              <div
                :class="`${
                  sidebarValue === index
                    ? 'bg-[#170600] text-white rounded-[5px] px-[0.5vw] py-[0.1vh]'
                    : ''
                } w-fit ease-in-out duration-500`"
              >
                {{ sidebarData }}
              </div>
            </div>
          </NTimelineItem>
        </NTimeline>
      </div>
    </CourseDetailSidebar>
    <div class="w-[80vw] h-[96.5vh] overflow-y-scroll px-[1.5vw]">
      <div class="course-notify-list-box py-[1.5vh]" v-if="!notifyValue">
        <NInput
          placeholder=""
          class="!w-[10vw] !rounded-[10px] shadow-[0px_4px_6px_rgba(0,0,0,0.25)] mb-[1.5vh]"
        >
          <template #prefix>
            <NIcon :size="'1vw'" class="!text-black" :component="Search" />
          </template>
        </NInput>
        <CourseNotifyBox
          v-for="(notifyData, index) in notifyListData"
          :notify-data="notifyData"
          :key="index"
          @click="handleSelectCourseNotify(`${notifyData.id}`)"
        />
      </div>
      <div v-else>
        <NIcon
          :size="'1vw'"
          class="!text-black cursor-pointer"
          :component="ArrowBackIosRound"
          @click="handleGoBackNotify"
        />
        <div
          class="shadow-[0px_4px_4px_rgba(0,0,0,0.25)] p-[1vh_1vw] rounded-[10px] h-[91.1vh] overflow-y-scroll"
        >
          <div class="font-['Robot-Bold'] text-2xl notify-title mb-[1vh]">
            {{ selectNotifyData.title }}
          </div>
          <div class="notify-desc mb-[2vh] text-[#868686] text=base">
            {{ selectNotifyData.content }}
          </div>
          <div
            class="notify-teacher-info flex justify-between items-end mb-[1vh]"
          >
            <div class="flex items-center">
              <NAvatar
                round
                class="w-[3vw] h-[3vw]"
                src="https://07akioni.oss-cn-beijing.aliyuncs.com/07akioni.jpeg"
              />
              <div class="flex-col ml-[.5vw]">
                <div class="font-['Robot-Bold'] text-lg">
                  {{ selectNotifyData.teacherName }}
                </div>
                <div class="text-sm text-[#868686]">
                  {{ selectNotifyData.courseName }}
                </div>
              </div>
            </div>
            <div class="text-base">
              {{ dayjs(selectNotifyData.createAt).format("YYYY/MM/DD") }}
              {{
                dayjs(dayjs(selectNotifyData.createAt).format()).get("hour")
              }}:{{
                dayjs(dayjs(selectNotifyData.createAt).format()).get("minute") <
                10
                  ? `0${dayjs(dayjs(selectNotifyData.createAt).format()).get(
                      "minute"
                    )}`
                  : dayjs(dayjs(selectNotifyData.createAt).format()).get(
                      "minute"
                    )
              }}
            </div>
          </div>
          <div>
            <div class="flex justify-between items-end mb-[2vh]">
              <div class="font-['Robot-Bold'] text-2xl">上傳檔案</div>
              <div class="text-sm">
                共 {{ selectNotifyData.notifyFiles.length }} 個檔案
              </div>
            </div>
            <div class="notify-file-list">
              <CourseNotifyFileBox
                v-for="(fileData, index) in selectNotifyData.notifyFiles"
                :key="index"
                :file-data="fileData"
              />
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style lang="scss">
.course-notify-sidebar {
  .n-collapse-item-arrow {
    display: none !important;
  }
  .n-timeline-item-timeline__circle {
    background-color: #170600;
    border-color: #170600 !important;
  }
  .n-timeline-item-timeline__line {
    background-color: #170600 !important;
  }
  .n-collapse-item__header {
    font-size: 0.875rem;
  }
  .n-radio .n-radio--checked {
    --n-dot-color-active: #170600 !important;
  }
}
</style>
