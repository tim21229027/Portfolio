<script setup lang="ts">
import { RouterLink } from "vue-router";
import { NAvatar, NIcon } from "naive-ui";
import { useRouter, useRoute } from "vue-router";
const Router = useRouter();
const Route = useRoute();
</script>
<template>
  <div class="bg-[#170600] text-[#F8F8F8] w-screen h-screen relative">
    <div class="flex flex-col items-center w-[6vw] py-[3.5vh]">
      <NAvatar
        class="mb-[5vh] w-[3.5vw] h-[3.5vw]"
        round
        src="https://firebasestorage.googleapis.com/v0/b/i-note-you.appspot.com/o/logo.png?alt=media&token=2917b640-3d83-4891-a3ed-1c37b8c186b1"
      />
      <RouterLink
        :to="routerData.path"
        :class="`flex flex-col items-center mb-[2.5vh] w-full   relative `"
        v-for="(routerData, index) in Router.options.routes.slice(0, 2)"
      >
        <div
          :class="`${
            Route.path === routerData.path ? 'bg-white ' : 'bg-transparent'
          } rounded-full w-[2vw] h-[2vw] flex justify-center items-center mb-[0.5vh] ease-in-out duration-500`"
        >
          <NIcon
            class="text-[1.5vw]"
            :color="Route.path === routerData.path ? '#170600' : '#F9F9F9'"
            :component="(routerData.meta?.icon as any)"
          />
        </div>

        <div class="font-['Robot-Regular'] text-base">
          {{ routerData.meta?.name }}
        </div>
        <div
          :class="`bg-white rounded-md w-[0.3vw] h-full absolute ease-in-out duration-300 right-0 ${
            Route.path === routerData.path
              ? 'translate-x-0'
              : 'translate-x-[1vw]'
          }`"
        ></div>
      </RouterLink>
    </div>
    <slot></slot>
  </div>
</template>

<style scoped></style>
