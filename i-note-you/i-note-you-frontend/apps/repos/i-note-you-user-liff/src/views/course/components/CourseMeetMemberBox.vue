<script setup lang="ts">
import { NAvatar, NIcon, NPopover } from "naive-ui";
import { Microphone, Information } from "@vicons/carbon";
import { CourseMeetMemberType } from "@/service/course/type";
interface Props {
  memberData: CourseMeetMemberType;
}
const props = defineProps<Props>();
</script>
<template>
  <!-- <div
    :class="`shadow-[0px_0px_10px_rgba(0,0,0,0.25)] mb-[1.5vh] flex justify-between items-center px-[0.5vw] py-[1vh] rounded-[10px] ease-in-out duration-300 ${
      props.memberData.status === null
        ? ''
        : props.memberData.status
        ? ''
        : 'border-4 border-[#DF0000]'
    } `"
  >
    <div class="flex items-center">
      <NAvatar
        class="w-[1.5vw] h-[1.5vw]"
        round
        src="https://firebasestorage.googleapis.com/v0/b/i-note-you.appspot.com/o/user.png?alt=media&token=14e3c898-b5c5-4cda-8a8f-6b904be5b33a"
      />
      <div class="ml-[0.5vw] text-lg">{{ memberData.name }}</div>
    </div>
    <div class="flex items-center">
      <NPopover
        trigger="hover"
        :arrow-style="{ backgroundColor: '#7C7C7C' }"
        :placement="'left'"
        class="!bg-[#7C7C7C] text-white"
        v-if="
          props.memberData.status === null ? false : !props.memberData.status
        "
      >
        <template #trigger>
          <NIcon
            class="text-[1.5vw] cursor-pointer"
            :color="'#DF0000'"
            :component="Information"
          />
        </template>
        <span>分心了嗎? 趕快回來做筆記吧!</span>
      </NPopover>

      <NIcon
        class="text-[1.5vw] cursor-pointer ml-[0.5vw]"
        :color="'#170600'"
        :component="Microphone"
      />
    </div>
  </div> -->
  <div
    :class="`shadow-[0px_0px_10px_rgba(0,0,0,0.25)] mb-[1.5vh] flex justify-between items-center px-[0.5vw] py-[1vh] rounded-[10px] ease-in-out duration-300  `"
  >
    <div class="flex items-center">
      <NAvatar class="w-[1.5vw] h-[1.5vw]" round :src="memberData.image" />
      <div class="ml-[0.5vw] text-lg">{{ memberData.name }}</div>
    </div>
    <div class="flex items-center">
      <NIcon
        class="text-[1.5vw] cursor-pointer ml-[0.5vw]"
        :color="'#170600'"
        :component="Microphone"
      />
    </div>
  </div>
</template>

<style lang="scss">
.n-popover {
  .n-popover-shared {
    display: none !important;
  }
}
</style>
