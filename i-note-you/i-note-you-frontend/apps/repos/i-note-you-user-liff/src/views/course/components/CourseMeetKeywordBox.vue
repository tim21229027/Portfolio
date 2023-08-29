<script setup lang="ts">
import { NProgress } from "naive-ui";
import { CourseKeywordType } from "@/service/course/type";
interface Props {
  keywordData: CourseKeywordType;
  keywordRank: number;
}
const props = defineProps<Props>();
</script>
<template>
  <div
    class="shadow-[0px_0px_10px_rgba(0,0,0,0.25)] rounded-[10px] mb-[1.5vh] px-[0.5vw] py-[1vh]"
  >
    <div class="text-[#170600] text-base font-['Robot-Black'] mb-[0.5vh]">
      {{ keywordRank }}. {{ keywordData.keyword }}
    </div>
    <div>
      <NProgress
        class=""
        type="line"
        :color="'#170600'"
        status="success"
        :percentage="keywordData.allRate"
      >
        {{ keywordData.allRate.toFixed(2) }}%
      </NProgress>
    </div>
  </div>
</template>

<style scoped></style>
