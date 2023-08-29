<script setup lang="ts">
import { NAvatar, NIcon } from "naive-ui";
import { PeopleTeam24Filled } from "@vicons/fluent";
import { CourseType } from "@/service/course/type";
interface Props {
  courseData: CourseType;
}
const props = defineProps<Props>();
</script>
<template>
  <div
    :class="`course-box relative bg-[url(https://firebasestorage.googleapis.com/v0/b/i-note-you.appspot.com/o/course%2Fcourse-box-bg-img%2Fbg2.jpg?alt=media&token=85005511-23b7-485c-b961-b0495dfa410a)] bg-cover bg-center rounded-[15px] w-[15vw] h-[22.5vh]`"
  >
    <div
      class="flex flex-col items-center justify-center text-base font-['Robot-Bold'] w-full h-full bg-[rgba(58,58,58,0.4)] rounded-[15px]"
    >
      <NAvatar
        class="w-[4.5vw] h-[4.5vw] mb-[2vh]"
        round
        :src="courseData.image"
      />
      <div class="">{{ courseData.name }}</div>
    </div>
    <div
      class="course-box-mask absolute cursor-pointer rounded-[15px] text-base ease-in-out flex duration-300 top-0 left-0 w-full h-full bg-[rgba(58,58,58,0.9)] flex-col items-center justify-center"
    >
      <div class="font-['Robot-Bold'] mb-[2vh]">進入課程</div>
      <div class="flex items-center">
        <NIcon
          class="text-[1.5vw]"
          :color="'#FFFFFF'"
          :component="PeopleTeam24Filled"
        />
        <div class="ml-[0.5vw] font-['Robot-Regular']">
          {{ courseData.peopleCount }}
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped></style>
