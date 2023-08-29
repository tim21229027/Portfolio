<script setup lang="ts">
import { useCourseStoreState } from "../../../../stores/course";
import { CourseOutlineType } from "@/service/course/type";
interface Props {
  unitDetailValue: string | null;
  unitData: CourseOutlineType[];
}
interface Emits {
  (e: "update:unitDetailValue", unitDetailValue: string | null): void;
}
const courseStore = useCourseStoreState();
const props = defineProps<Props>();
const emits = defineEmits<Emits>();
const unitListColumns = [
  {
    title: "週",
    key: "week",
  },
  {
    title: "上課日",
    key: "courseTime",
  },
  {
    title: "課程單元",
    key: "unit",
  },
  {
    title: "教學內容",
    key: "content",
  },
];

const handleGoToUnitDetail = (unitId: string) => {
  courseStore.setCourseUnitVal(1);
  emits("update:unitDetailValue", unitId);
};
</script>
<template>
  <div class="pb-[0.5vh]">
    <div class="unit-list-table w-full">
      <div
        class="title-box flex w-full mb-[2vh] justify-between items-center bg-[#616161] border-[5px] border-[#170600] font-['Robot-Bold'] rounded-[5px] text-lg text-white"
      >
        <div
          v-for="(columnData, index) in unitListColumns"
          :key="index"
          class="px-[1.5vw] py-[2vh]"
        >
          {{ columnData.title }}
        </div>
      </div>
    </div>

    <div
      class="content-box flex w-full cursor-pointer mb-[2.5vh] py-[1.5vh] justify-between items-center bg-white hover:bg-[#170600] rounded-[5px] text-lg hover:text-white text-[#170600] shadow-[0px_0px_10px_rgba(0,0,0,0.25)] ease-in-out duration-300"
      v-for="(columnData, index) in unitData"
      :key="index"
      @click="handleGoToUnitDetail(`${columnData.id}`)"
    >
      <div class="px-[1.5vw]">
        {{ columnData.week }}
      </div>
      <div class="px-[1.5vw]">
        {{ columnData.teachDate }}
      </div>
      <div class="px-[1.5vw]">
        {{ columnData.name }}
      </div>
      <div class="px-[1.5vw]">
        {{ columnData.teachContent }}
      </div>
    </div>
  </div>
</template>

<style lang="scss"></style>
