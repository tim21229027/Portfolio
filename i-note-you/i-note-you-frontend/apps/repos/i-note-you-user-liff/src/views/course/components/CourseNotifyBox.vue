<script setup lang="ts">
import { NImage } from "naive-ui";
import { useRoute } from "vue-router";
import { NotifyType } from "@/service/course/type";
import dayjs from "dayjs";
const route = useRoute();
interface Props {
  notifyData: NotifyType;
}
const props = defineProps<Props>();
</script>
<template>
  <div
    :class="`${
      notifyData.notifyRead ? 'opacity-[60%]' : ''
    } text-black shadow-[0px_4px_4px_rgba(0,0,0,0.25)] rounded-[5px] mb-[1.5vh] flex items-center p-[0.5vh_0.5vw] cursor-pointer`"
  >
    <div class="h-full w-[15%]">
      <NImage
        class="w-full rounded-[8px] h-[15vh]"
        :src="notifyData.image"
        object-fit="cover"
      />
    </div>

    <div class="w-[85%] h-full ml-[1vw] flex-col justify-between items-center">
      <div>
        <div class="text-xl font-['Robot-Bold'] mb-[0.5vh]">
          {{ notifyData.title }}
        </div>
        <div class="course-notify-desc-box text-lg mb-[0.5vh] text-[#868686]">
          {{ notifyData.content }}
        </div>
      </div>
      <div
        :class="`flex ${
          route.params.courseId ? 'justify-end' : 'justify-between'
        }  items-center text-base`"
      >
        <div>{{ dayjs(notifyData.createAt).format("YYYY/MM/DD") }}</div>
        <div class="ml-[0.5vw]">
          {{ dayjs(dayjs(notifyData.createAt).format()).get("hour") }}:{{
            dayjs(dayjs(notifyData.createAt).format()).get("minute") < 10
              ? `0${dayjs(dayjs(notifyData.createAt).format()).get("minute")}`
              : dayjs(dayjs(notifyData.createAt).format()).get("minute")
          }}
        </div>
      </div>
    </div>
  </div>
</template>

<style lang="scss">
.course-notify-desc-box {
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 2;
  overflow: hidden;
}
</style>
