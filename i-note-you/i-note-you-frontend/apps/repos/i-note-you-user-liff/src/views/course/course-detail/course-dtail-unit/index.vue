<script setup lang="ts">
import { ref, onMounted } from "vue";
import UnitList from "./UnitList.vue";
import UnitDetail from "./UnitDetail.vue";
import { useCourseState } from "@/utils/hooks/useCourse";
import { getCourseOutline } from "@/service/course";
import { CourseOutlineType } from "@/service/course/type";
import { ElLoading } from "element-plus";

const { getCourseUnitValue, getCourseDetailData } = useCourseState();
const unitDetailValue = ref<string | null>(null);
const unitData = ref<CourseOutlineType[]>([]);
onMounted(async () => {
  const loading = ElLoading.service({
    lock: true,
    text: "載入中",
    background: "rgba(0, 0, 0, 0.7)",
  });
  const unit = await getCourseOutline(getCourseDetailData.value.id);
  unitData.value = unit;
  loading.close();
});
</script>
<template>
  <div class="w-full h-full">
    <div
      class="font-['Robot-Bold'] text-2xl text-[#535353] mb-[1vh]"
      v-if="getCourseUnitValue === null"
    >
      所有單元
    </div>

    <UnitList
      v-if="getCourseUnitValue === null"
      v-model:unitDetailValue="unitDetailValue"
      :unit-data="unitData"
    />

    <UnitDetail
      v-else
      :unit-data="unitData[unitData.findIndex((x) => x.id === unitDetailValue)]"
    />
  </div>
</template>

<style scoped></style>
