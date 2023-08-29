<script setup lang="ts">
import { CourseUnitMaterialType } from "@/service/course/type";
interface Props {
  teachMaterial: CourseUnitMaterialType;
}

const props = defineProps<Props>();
</script>
<template>
  <div class="p-[1vh_0.5vw] rounded-[5px] bg-[#EEEEEE]">
    <iframe
      class="h-[93.5vh] w-full rounded-[5px]"
      :src="teachMaterial?.url"
    ></iframe>
  </div>
</template>

<style></style>
