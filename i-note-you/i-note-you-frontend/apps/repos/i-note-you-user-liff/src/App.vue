<script setup lang="ts">
import { RouterView, useRoute } from "vue-router";
import TheNavbar from "./layout/TheNavbar.vue";
import { NIcon } from "naive-ui";
import { NotificationsNoneRound } from "@vicons/material";
import { useCourseStoreState } from "@/stores/course";
import { ElLoading } from "element-plus";
import { ref, watchEffect } from "vue";

import { useSettingStore } from "@/stores/setting";
const courseStore = useCourseStoreState();
const settingStore = useSettingStore();
const route = useRoute();
const test = ref(true);
const loading = ElLoading.service({
  lock: true,
  text: "載入中",
  background: "rgba(0, 0, 0, 0.7)",
});

const handleOpenCourseNotify = () => {
  courseStore.useCourseNotify = true;
};
watchEffect(() => {
  if (settingStore.loading) {
    // loading.visible;
  } else {
    // loading.close();
  }
});
</script>

<template>
  <!-- <MButton />
  <MButton2></MButton2> -->

  <TheNavbar>
    <RouterView
      :class="`router-view absolute bg-[#F9F9F9] z-10 left-[6vw] top-1/2 -translate-y-1/2 h-[96.5vh]  w-[93.3vw] rounded-[20px] ${
        courseStore.useCourseNotify ? 'overflow-y-hidden' : 'overflow-y-scroll'
      }`"
      v-slot="{ Component }"
    >
      <keep-alive>
        <component :is="Component" />
      </keep-alive>
    </RouterView>

    <div
      @click="handleOpenCourseNotify"
      v-if="route.path === '/course' && !courseStore.useCourseNotify"
      class="shadow-[0px_4px_4px_rgba(0,0,0,0.25)] w-[3vw] h-[3vw] cursor-pointer rounded-full fixed text-black right-[5vw] bottom-[4vh] bg-white z-[20]"
    >
      <NIcon :size="'3vw'">
        <NotificationsNoneRound />
      </NIcon>
    </div>
  </TheNavbar>
</template>

<style>
@import "@/assets/scss/index.scss";
::-webkit-scrollbar {
  width: 0.6rem;
  border-radius: 0.5rem;
  height: 0rem;
  background-color: transparent;
}

::-webkit-scrollbar-thumb {
  border-radius: 0.5rem;
  background-color: #9f9f9f;
}
</style>
