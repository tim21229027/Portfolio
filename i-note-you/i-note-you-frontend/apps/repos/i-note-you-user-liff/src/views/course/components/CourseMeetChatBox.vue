<script setup lang="ts">
import { NAvatar } from "naive-ui";
import { CourseMeetMessageType } from "@/service/course/type";
import dayjs from "dayjs";
interface Props {
  messageData: CourseMeetMessageType;
}
const props = defineProps<Props>();
</script>
<template>
  <div class="mb-[0.75vh] flex items-end justify-between w-full">
    <div class="flex items-start w-[80%]">
      <NAvatar
        class="w-[1.67vw] h-[1.67vw] mr-[0.5vw]"
        round
        :src="messageData.image"
      />
      <div
        class="chat-content-box mt-[1vh] border-2 w-[85%] border-black px-[0.5vw] py-[0.25vh] rounded-tl-[0px] rounded-[5px] text-xs break-all"
      >
        {{ messageData.message }}
      </div>
    </div>
    <div class="text-xs text-[#7B7B7B] w-[15%] whitespace-nowrap">
      {{ dayjs(messageData.createAt).format("A") === "AM" ? "上午" : "下午"
      }}{{ dayjs(dayjs(messageData.createAt).format()).get("hour") }}:{{
        dayjs(dayjs(messageData.createAt).format()).get("minute") < 10
          ? `0${dayjs(dayjs(messageData.createAt).format()).get("minute")}`
          : dayjs(dayjs(messageData.createAt).format()).get("minute")
      }}
    </div>
  </div>
</template>

<style scoped></style>
