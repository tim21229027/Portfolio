<script setup lang="ts">
import { BarChart, useBarChart } from "vue-chart-3";
import { Chart, registerables } from "chart.js";
import { ref, computed, onMounted } from "vue";
import { useCourseState } from "@/utils/hooks/useCourse";
import { getCourseUnitKeywords } from "@/service/course";
import { CourseKeywordType } from "@/service/course/type";
import { ElLoading } from "element-plus";
const { getCourseDetailData } = useCourseState();
interface Props {
  unitId: string;
}
const props = defineProps<Props>();
const { getCourseKeywordRank } = useCourseState();
const courseKeywordsData = ref<CourseKeywordType[]>([]);
const chartData = computed(() => ({
  labels: courseKeywordsData.value.map(
    (x, index) => `${index + 1}. ${x.keyword}`
  ),
  datasets: [
    {
      label: "全班關鍵字比例(%)",
      barThickness: 20,
      data: courseKeywordsData.value.map((x) => x.allRate),
      backgroundColor: ["#97B0C4"],
      borderRadius: 20,
    },
    {
      label: "我的筆記次數(%)",
      barThickness: 20,
      data: courseKeywordsData.value.map((x) => x.ownRate),
      backgroundColor: ["#0079AF"],
      borderRadius: 20,
    },
  ],
}));

const options = {
  responsive: true,
  scales: {
    yAxes: [
      {
        scaleLabel: {
          display: true,
          labelString: "probability",
        },
      },
    ],
  },
  plugins: {
    legend: {
      position: "top",
    },
    title: {
      display: true,
      text: "關鍵字排行",
    },
  },
};
const { barChartProps } = useBarChart({
  chartData,
  options,
});

Chart.register(...registerables);
onMounted(async () => {
  const loading = ElLoading.service({
    lock: true,
    text: "載入中",
    background: "rgba(0, 0, 0, 0.7)",
  });
  const courseKeywords = await getCourseUnitKeywords(
    props.unitId,
    getCourseDetailData.value.courseMemberId
  );
  courseKeywordsData.value = courseKeywords.slice(0, 15);
  console.log(70, courseKeywords);
  loading.close();
});
</script>
<template>
  <div
    class="shadow-[0px_4px_4px_rgba(0,0,0,0.25)] h-full rounded-[10px] flex justify-center items-center"
  >
    <BarChart v-bind="barChartProps" class="w-[90%] h-[90%]" />
  </div>
</template>

<style scoped></style>
