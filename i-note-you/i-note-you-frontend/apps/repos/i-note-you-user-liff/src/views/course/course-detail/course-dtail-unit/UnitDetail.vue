<script setup lang="ts">
import CourseDetailSidebar from "../../components/CourseDetailSidebar.vue";
import {
  NTimeline,
  NTimelineItem,
  NRadioGroup,
  NRadio,
  useDialog,
} from "naive-ui";
import { ElMessageBox } from "element-plus";
import { ref, onMounted, watchEffect } from "vue";
import NoteBox from "./note-box/index.vue";
import TeachingMaterialBox from "./teaching-material-box/index.vue";
import VideoBox from "./video-box/index.vue";
import MeetingBox from "./meeting-box/index.vue";
import { getCourseUnitMaterial, getCourseUnitVideo } from "@/service/course";
import { useCourseStore } from "@/stores/course";
import {
  CourseOutlineType,
  CourseUnitMaterialType,
  CourseUnitVideoType,
} from "@/service/course/type";
import { ElLoading } from "element-plus";
interface Props {
  unitData: CourseOutlineType;
}
const courseStore = useCourseStore();
const props = defineProps<Props>();
const sidebarDatas = ref(["開始上課", "課程錄影", "我的筆記", "加入會議"]);
const sidebarValue = ref(0);
const noteDatas = ref(["個人筆記", "班級共同筆記", "歷屆筆記", "關鍵字排行"]);
const courseTeachMaterials = ref<CourseUnitMaterialType[]>([]);
const courseTeachVideos = ref<CourseUnitVideoType[]>([]);
const noteValue = ref<number>(0);
const teachMaterialValue = ref(0);
const handleSelectSidebar = (sidebarIndex: number) => {
  console.log(sidebarIndex);
  if (sidebarIndex < 3) {
    return (sidebarValue.value = sidebarIndex);
  }
  return ElMessageBox.confirm("確定要加入會議嗎?", {
    confirmButtonText: "加入",
    cancelButtonText: "取消",
    title: "加入會議",
    type: "info",
  })
    .then(() => {
      sidebarValue.value = sidebarIndex;
    })
    .catch(() => {
      // catch error
    });
};
watchEffect(async () => {
  const loading = ElLoading.service({
    lock: true,
    text: "載入中",
    background: "rgba(0, 0, 0, 0.7)",
  });
  if (courseStore.selectKeywordData.id.length > 0) {
    sidebarValue.value = 1;
  }
  const unitMaterial = await getCourseUnitMaterial(props.unitData.id);
  const unitVideo = await getCourseUnitVideo(props.unitData.id);
  courseTeachMaterials.value = unitMaterial;
  courseTeachVideos.value = unitVideo;
  loading.close();
});
</script>
<template>
  <div class="h-full flex justify-between">
    <CourseDetailSidebar :title="unitData.name">
      <div class="unit-detail-sidebar">
        <NTimeline>
          <NTimelineItem
            v-for="(sidebarData, index) in sidebarDatas"
            :key="index"
          >
            <div
              @click="handleSelectSidebar(index)"
              v-if="index % 2 === 1"
              :class="`${
                sidebarValue === index
                  ? 'bg-[#170600] text-white rounded-[5px] px-[0.5vw] py-[0.1vh]'
                  : ''
              } cursor-pointer font-['Robot-Regular'] text-sm w-fit ease-in-out duration-500 `"
            >
              {{ sidebarData }}
            </div>

            <div
              v-else
              @click="handleSelectSidebar(index)"
              :class="` cursor-pointer font-['Robot-Regular'] text-sm`"
            >
              <div
                :class="`${
                  sidebarValue === index
                    ? 'bg-[#170600] text-white rounded-[5px] px-[0.5vw] py-[0.1vh]'
                    : ''
                } w-fit ease-in-out duration-500`"
              >
                {{ sidebarData }}
              </div>
              <div
                :class="`${
                  sidebarValue === index ? ' opacity-1 h-fit' : 'opacity-0 h-0'
                } ease-in-out duration-300 py-[0.5vh]`"
              >
                <NRadioGroup
                  v-model:value="noteValue"
                  name="radiogroup"
                  v-if="index === 2"
                >
                  <NRadio
                    v-for="(noteData, index) in noteDatas"
                    :key="index"
                    :value="index"
                  >
                    <div class="!text-[#170600]">{{ noteData }}</div>
                  </NRadio>
                </NRadioGroup>

                <NRadioGroup
                  v-model:value="teachMaterialValue"
                  name="radiogroup"
                  v-else
                >
                  <NRadio
                    v-for="(teachMaterial, index) in courseTeachMaterials"
                    :key="index"
                    :value="index"
                  >
                    <div class="!text-[#170600]">{{ teachMaterial.name }}</div>
                  </NRadio>
                </NRadioGroup>
              </div>
            </div>
          </NTimelineItem>
        </NTimeline>
      </div>
    </CourseDetailSidebar>
    <div class="w-[80vw] h-full">
      <TeachingMaterialBox
        v-if="sidebarValue === 0"
        :teach-material="courseTeachMaterials[teachMaterialValue]"
      />
      <VideoBox v-if="sidebarValue === 1" :videos="courseTeachVideos" />
      <NoteBox
        v-if="sidebarValue === 2"
        :note-type="noteValue"
        :unit-id="props.unitData.id"
      />
      <MeetingBox
        v-if="sidebarValue === 3"
        :unit-id="props.unitData.id"
        v-model:sidebar-value="sidebarValue"
      />
    </div>
  </div>
</template>

<style lang="scss">
.unit-detail-sidebar {
  .n-collapse-item-arrow {
    display: none !important;
  }
  .n-timeline-item-timeline__circle {
    background-color: #170600;
    border-color: #170600 !important;
  }
  .n-timeline-item-timeline__line {
    background-color: #170600 !important;
  }
  .n-collapse-item__header {
    font-size: 0.875rem;
  }
  .n-radio .n-radio--checked {
    --n-dot-color-active: #170600 !important;
  }
}
</style>
