<script setup lang="ts"></script>
<template>
  <div
    class="w-full bg-white shadow-[0px_4px_4px_rgba(0,0,0,0.25)] rounded-[10px] px-[1vw] py-[1vh] flex justify-between items-center"
  >
    <div class="text-[1.875rem] font-['Robot-Bold']">
      <slot name="navbar-left-title"></slot>
    </div>
    <slot name="navbar-right-box"></slot>
  </div>
</template>

<style scoped></style>
