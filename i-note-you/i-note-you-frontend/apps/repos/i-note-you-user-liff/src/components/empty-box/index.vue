<script setup lang="ts">
import { NEmpty, NIcon, NButton } from "naive-ui";
import EmptyIcon from "@/components/icons/EmptyIcon.vue";
import { useRouter } from "vue-router";
const Router = useRouter();
const handleGoToCoachList = () => {
  Router.push({ path: "/coach" });
};
</script>
<template>
  <NEmpty class="px-[14vw]">
    <template #icon>
      <NIcon :size="'25vw'">
        <EmptyIcon />
      </NIcon>
    </template>
    <div class="text-[#3A3A3A] text-center mb-[5vh]">
      <div class="font-['Robot-Bold'] text-[#9A9A9A] text-[1.75rem]">
        輸入<span class="text-[#170600]">邀請碼</span>加入課程 !
      </div>
    </div>
  </NEmpty>
</template>

<style lang="scss">
.n-empty__icon {
  width: fit-content !important;
  height: fit-content !important;
}
</style>
