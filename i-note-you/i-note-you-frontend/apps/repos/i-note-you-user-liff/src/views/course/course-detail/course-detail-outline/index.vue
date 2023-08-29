<script setup lang="ts">
import { NAvatar, NPagination } from "naive-ui";
import { ref, onMounted } from "vue";
import UnitList from "../course-dtail-unit/UnitList.vue";
import { getCourseOutline } from "@/service/course";
import { CourseOutlineType } from "@/service/course/type";
import { ElLoading } from "element-plus";
import { useCourseState } from "@/utils/hooks/useCourse";
const { getCourseDetailData } = useCourseState();
const unitVal = ref(null);
const outlineData = ref<CourseOutlineType[]>([]);
onMounted(async () => {
  const loading = ElLoading.service({
    lock: true,
    text: "載入中",
    background: "rgba(0, 0, 0, 0.7)",
  });
  const outline = await getCourseOutline(getCourseDetailData.value.id);
  console.log(outline);
  outlineData.value = outline;
  loading.close();
});
</script>
<template>
  <div class="w-full px-[1vw]">
    <div class="text-2xl text-[#535353] font-['Robot-Bold'] mb-[1vh]">
      課程大綱
    </div>
    <div class="flex justify-between items-center mb-[2vh]">
      <div
        class="bg-[#170600] rounded-[15px] flex justify-evenly items-center p-[1.75vh_2vw] w-[45vw]"
      >
        <div class="flex justify-between items-center">
          <NAvatar
            round
            class="w-[5vw] h-[5vw] mr-[1vw]"
            size="small"
            :src="getCourseDetailData.teacherImg"
          />
          <div class="text-[#f9f9f9] text-2xl font-['Robot-Bold']">
            {{ getCourseDetailData.teacherName }}
          </div>
        </div>
        <div class="flex items-center ml-[2vw]">
          <div class="mr-[2vw]">
            <div class="text-sm mb-[1.5vh]">
              <div class="text-[#f9f9f9] font-['Robot-Bold'] mb-[0.5vh]">
                電話
              </div>
              <div class="bg-[#D9D9D9] rounded-[5px] p-[0.25vh_0.5vw] w-[10vw]">
                {{ getCourseDetailData.teacherPhone }}
              </div>
            </div>
            <div class="text-sm">
              <div class="text-[#f9f9f9] font-['Robot-Bold'] mb-[0.5vh]">
                學生到課率
              </div>
              <div class="bg-[#D9D9D9] rounded-[5px] p-[0.25vh_0.5vw] w-[10vw]">
                {{ getCourseDetailData.attendRate }}%
              </div>
            </div>
          </div>
          <div>
            <div class="text-sm mb-[1.5vh]">
              <div class="text-[#f9f9f9] font-['Robot-Bold'] mb-[0.5vh]">
                電子郵件
              </div>
              <div class="bg-[#D9D9D9] rounded-[5px] p-[0.25vh_0.5vw] w-[10vw]">
                {{ getCourseDetailData.teacherEmail }}
              </div>
            </div>
            <div class="text-sm">
              <div class="text-[#f9f9f9] font-['Robot-Bold'] mb-[0.5vh]">
                教學成功率
              </div>
              <div class="bg-[#D9D9D9] rounded-[5px] p-[0.25vh_0.5vw] w-[10vw]">
                {{ getCourseDetailData.successRate }}%
              </div>
            </div>
          </div>
        </div>
      </div>
      <div
        class="flex justify-evenly items-center rounded-[15px] border-[5px] border-[#170600] p-[1.75vh_2vw] w-[42vw]"
      >
        <div class="mr-[2vw]">
          <div class="text-sm mb-[1.5vh]">
            <div class="text-[#151515] font-['Robot-Bold'] mb-[0.5vh]">
              課程代碼
            </div>
            <div class="bg-[#D9D9D9] rounded-[5px] p-[0.25vh_0.5vw] w-[10vw]">
              {{ getCourseDetailData.courseCode }}
            </div>
          </div>
          <div class="text-sm">
            <div class="text-[#151515] font-['Robot-Bold'] mb-[0.5vh]">
              上課時間
            </div>
            <div class="bg-[#D9D9D9] rounded-[5px] p-[0.25vh_0.5vw] w-[10vw]">
              {{ getCourseDetailData.courseTime }}
            </div>
          </div>
        </div>
        <div>
          <div class="text-sm mb-[1.5vh]">
            <div class="text-[#151515] font-['Robot-Bold'] mb-[0.5vh]">
              課程名稱
            </div>
            <div
              class="bg-[#D9D9D9] rounded-[5px] p-[0.25vh_0.5vw] w-[10vw] whitespace-nowrap overflow-ellipsis"
            >
              {{ getCourseDetailData.courseName }}
            </div>
          </div>
          <div class="text-sm">
            <div class="text-[#151515] font-['Robot-Bold'] mb-[0.5vh]">
              課程人數
            </div>
            <div class="bg-[#D9D9D9] rounded-[5px] p-[0.25vh_0.5vw] w-[10vw]">
              {{ getCourseDetailData.coursePeopleCounts }}
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="pb-[2vh]">
      <UnitList v-model:unitDetailValue="unitVal" :unitData="outlineData" />
    </div>
  </div>
</template>

<style scoped></style>
