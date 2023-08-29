<script setup lang="ts">
import { NSpin, NIcon } from "naive-ui";
import { CourseUnitVideoType } from "@/service/course/type";
import { CheckmarkFilled } from "@vicons/carbon";
interface Props {
  videoData: CourseUnitVideoType;
}
const props = defineProps<Props>();
</script>
<template>
  <div
    class="rounded-[10px] bg-white shadow-[0px_0px_10px_rgba(0,0,0,0.25)] w-[14vw] h-fit p-[1vh_1vw] mb-[1vh] cursor-pointer"
  >
    <video :src="videoData.url" class="!w-full !rounde-[5px]"></video>
    <div class="flex justify-between items-center mt-[0.5vh]">
      <div
        style="
          display: -webkit-box;
          -webkit-box-orient: vertical;
          -webkit-line-clamp: 2;
          overflow: hidden;
        "
        class="font-['Robot-Bold'] text-base"
      >
        {{ videoData.title }}
      </div>
      <div class="flex items-center" v-if="videoData.analyzeStatus === 0">
        <NSpin size="small" />
        <div class="ml-[.5vw] text-green-700">分析中...</div>
      </div>
      <div v-else>
        <NIcon size="1vw" class="text-green-700" :component="CheckmarkFilled" />
      </div>
    </div>
  </div>
</template>

<style scoped></style>
