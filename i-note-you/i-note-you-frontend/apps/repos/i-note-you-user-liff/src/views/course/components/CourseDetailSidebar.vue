<script setup lang="ts">
interface Props {
  title: string;
}
const props = defineProps<Props>();
</script>
<template>
  <div
    class="bg-white shadow-[0px_4px_4px_rgba(0,0,0,0.25)] rounded-[10px] h-full w-[10vw] px-[1vw] py-[1.5vh]"
  >
    <div class="text-2xl font-['Robot-Bold'] text-[#535353] mb-[1vh]">
      {{ props.title }}
    </div>
    <slot></slot>
  </div>
</template>

<style scoped></style>
