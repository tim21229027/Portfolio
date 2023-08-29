<script setup lang="ts">
import CourseVideoBox from "@/views/course/components/CourseVideoBox.vue";
import { ref, watchEffect } from "vue";
import { NModal, NCard, NIcon } from "naive-ui";
import { Close } from "@vicons/carbon";
import { CourseUnitVideoType, VideoKeywordType } from "@/service/course/type";
import { useCourseStore } from "@/stores/course";
import { useMediaControls } from "@vueuse/core";
interface Props {
  videos: CourseUnitVideoType[];
}
const props = defineProps<Props>();
const courseStore = useCourseStore();
const selectVideoData = ref<CourseUnitVideoType>({
  id: "",
  createAt: "",
  deletedAt: null,
  title: "",
  url: "",
  analyzeStatus: 0,
  unitId: "",
});
const selectKeywordData = ref<VideoKeywordType>({
  createAt: "",
  deletedAt: null,
  endTime: "",
  id: "",
  keywords: [],
  startTime: "",
  videoId: "",
  title: "",
});

const showModalRef = ref(false);
const handleOpenCourseVideoModel = (videoId: string) => {
  Object.assign(
    selectVideoData.value,
    props.videos.find((x) => x.id === videoId)
  );
  showModalRef.value = true;
};
const handleCloseCourseVideo = () => {
  showModalRef.value = false;
};
watchEffect(() => {
  if (courseStore.selectKeywordData) {
    Object.assign(
      selectVideoData.value,
      props.videos.find((x) => x.id === courseStore.selectKeywordData.videoId)
    );
    Object.assign(selectKeywordData.value, courseStore.selectKeywordData);

    showModalRef.value = true;
  }
});
</script>
<template>
  <div
    class="shadow-[0px_4px_4px_rgba(0,0,0,0.25)] h-[93.5vh] w-full rounded-[10px] p-[1.75vh_1.25vw] grid grid-cols-5 gap-[1.5vw] overflow-y-scroll"
  >
    <CourseVideoBox
      v-for="(videoData, index) in videos"
      :video-data="videoData"
      @click="handleOpenCourseVideoModel(`${videoData.id}`)"
    />
  </div>
  <NModal v-model:show="showModalRef">
    <NCard
      style="width: 50vw"
      title=" "
      :bordered="false"
      size="huge"
      role="dialog"
      aria-modal="true"
      :header-style="{
        background: '#170600',
        height: '5vh',
      }"
    >
      <template #header-extra>
        <NIcon
          :class="` text-[1.5vw]  cursor-pointer`"
          :color="'#ffffff'"
          :component="Close"
          @click="handleCloseCourseVideo"
        />
      </template>
      <div>
        <div class="text-xl text-[#170600] font-['Robot-Bold'] py-[1.5vh]">
          {{ selectVideoData.title }}
        </div>
        <video
          ref="video"
          controls
          :currentTime="Number(courseStore.selectKeywordData.startTime)"
          :src="selectVideoData.url"
          class="rounded-[5px]"
        ></video>
      </div>
    </NCard>
  </NModal>
</template>

<style scoped></style>
