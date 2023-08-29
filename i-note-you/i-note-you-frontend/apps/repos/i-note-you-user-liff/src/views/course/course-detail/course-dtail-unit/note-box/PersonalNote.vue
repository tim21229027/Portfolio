<script setup lang="ts">
import { NIcon, NPopover, NSpin } from "naive-ui";
import { Pen, Information } from "@vicons/carbon";
import { EyeOutlined } from "@vicons/antd";
import Codemirror from "codemirror-editor-vue3";
// import "codemirror/mode/javascript/javascript.js"; // language
import { getCourseUnitPersonNote } from "@/service/course";
import { ref, onMounted } from "vue";
import CoursePreviewNoteBox from "@/views/course/components/CoursePreviewNoteBox.vue";
import {
  postCourseUnitPersonNote,
  getCourseUnitAllKeywords,
  getCourseUnitKeywordVideos,
} from "@/service/course";
import {
  CourseUnitNoteType,
  VideoKeywordType,
  NoteKeyWordsType,
} from "@/service/course/type";
import { useCourseStoreState } from "@/stores/course";
import { useCourseState } from "@/utils/hooks/useCourse";
import { ElLoading } from "element-plus";
import dayjs from "dayjs";
import duration from "dayjs/plugin/duration";
dayjs.extend(duration);
interface Props {
  unitId: string;
}
const courseStore = useCourseStoreState();
const props = defineProps<Props>();
const allKeywordsData = ref<string[]>([]);
const previewNote = ref<string[]>([]);
const keywordLoading = ref(false);
const hoverKeywordData = ref<VideoKeywordType[]>([]);
const { getCourseDetailData } = useCourseState();
const noteData = ref<CourseUnitNoteType>({
  id: "",
  createAt: "",
  deletedAt: null,
  unitId: "",
  courseMemberId: "",
  content: "",
  similarity: null,
});
const noteValue = ref(0);
const cmOptions = {
  mode: "text/javascript", // 语言模式
  theme: "default", // 主题
  lineNumbers: true, // 显示行号
  smartIndent: true, // 智能缩进
  indentUnit: 2, // 智能缩进单位为4个空格长度
  foldGutter: true, // 启用行槽中的代码折叠
  styleActiveLine: true, // 显示选中行的样式
  origin: true,
};
const onChange = (val: any, cm: any) => {
  console.log(20, val);
  console.log(21, cm);

  setTimeout(async () => {
    console.log(noteData.value.unitId, noteData.value.courseMemberId);
    console.log(31, val);
    const uploaadNoteData = await postCourseUnitPersonNote(
      noteData.value.unitId,
      noteData.value.courseMemberId,
      val
    );
    console.log(51, uploaadNoteData);
  }, 5000);
};
const handleShowVideoKeyword = async (keyword: string) => {
  console.log(62, keyword);
  keywordLoading.value = true;
  const keywordVideos = await getCourseUnitKeywordVideos(
    noteData.value.unitId,
    keyword
  );
  console.log(70, keywordVideos);
  const testData: any = [];
  const test = keywordVideos.map((x: NoteKeyWordsType) => {
    return x.videoKeywords.map((x: VideoKeywordType) => {
      if (x.keywords.includes(keyword)) return testData.push(x);
    });
  });

  hoverKeywordData.value = testData;
  console.log(73, test);
  keywordLoading.value = false;
};

const handleSelectNoteAction = async (noteIndex: number) => {
  if (noteIndex === 1) {
    const loading = ElLoading.service({
      lock: true,
      text: "載入中",
      background: "rgba(0, 0, 0, 0.7)",
    });

    const allKeywords = await getCourseUnitAllKeywords(props.unitId);
    allKeywordsData.value = allKeywords;
    let note: any = noteData.value.content;

    allKeywords.forEach((x, index) => {
      console.log(69, x);
      note = note.replace(x, `__${x}__`);
    });
    console.log(87);
    note = note.split("__");
    previewNote.value = note;
    loading.close();
    return (noteValue.value = noteIndex);
  }
  return (noteValue.value = noteIndex);
};
const handleGoToVideoTime = (keywordData: VideoKeywordType) => {
  console.log(112, keywordData);
  courseStore.setSelectKeywordData(keywordData);
  console.log(132, courseStore.selectKeywordData);
};
onMounted(async () => {
  const unitPersonNote = await getCourseUnitPersonNote(
    props.unitId,
    getCourseDetailData.value.courseMemberId
  );
  Object.assign(noteData.value, unitPersonNote);
});
</script>
<template>
  <div class="flex justify-between items-center mb-[1.5vh]">
    <div class="flex items-center">
      <div
        :class="`${
          noteValue === 0 ? 'bg-[#170600]' : ''
        } rounded-[5px_0px_0px_5px] flex items-center justify-center px-[0.5vw] py-[0.75vh] border-2 border-[#170600] ease-in-out duration-300`"
      >
        <NIcon
          class="text-[1.5vw] cursor-pointer"
          :color="noteValue === 0 ? '#F9F9F9' : '#170600'"
          :component="Pen"
          @click="handleSelectNoteAction(0)"
        />
      </div>
      <div
        :class="`${
          noteValue === 1 ? 'bg-[#170600]' : ''
        } rounded-[0px_5px_5px_0px] flex items-center justify-center px-[0.5vw] py-[0.75vh] border-2 border-[#170600]  ease-in-out duration-300`"
      >
        <NIcon
          class="text-[1.5vw] cursor-pointer"
          :color="noteValue === 1 ? '#F9F9F9' : '#170600'"
          :component="EyeOutlined"
          @click="handleSelectNoteAction(1)"
        />
      </div>
    </div>
    <div
      class="bg-[#170600] text-[#F9F9F9] flex justify-between items-center w-[15vw] text-lg px-[0.5vw] py-[1vh] rounded-[5px]"
    >
      <div class="flex justify-between items-center">
        <NIcon
          class="text-[1.5vw] cursor-pointer"
          :color="'#F9F9F9'"
          :component="Information"
        />
        <div class="ml-[0.5vw]">筆記相似度</div>
      </div>
      <div>
        {{
          noteData.similarity === null
            ? "0"
            : Number(noteData.similarity).toFixed(2)
        }}%
      </div>
    </div>
  </div>
  <div>
    <div v-if="noteValue === 0">
      <Codemirror
        v-model:value="noteData.content"
        :options="cmOptions"
        :border="true"
        placeholder="测试 placeholder"
        class="!h-[87vh]"
        @change="onChange"
      />
    </div>
    <CoursePreviewNoteBox v-show="noteValue !== 0" class="h-[87vh]">
      <!-- <div id="preview"></div> -->

      <div
        v-for="(noteData, index) in previewNote"
        :key="index"
        class="flex items-center"
      >
        <span>
          {{
            allKeywordsData.find((x) => x === noteData) ? "" : noteData
          }}</span
        >

        <NPopover
          trigger="hover"
          v-if="allKeywordsData.find((x) => x === noteData)"
          @update:show="handleShowVideoKeyword(noteData)"
        >
          <template #trigger>
            <span class="text-blue-800 underline cursor-pointer">
              {{ noteData }}
            </span>
          </template>
          <NSpin size="small" v-if="keywordLoading" />

          <div
            v-for="(keywordData, index) in hoverKeywordData"
            :key="index"
            @click="handleGoToVideoTime(keywordData)"
          >
            {{ keywordData.title }}
            <div class="cursor-pointer text-blue-600 underline">
              {{
                dayjs
                  .duration(Number(keywordData.startTime), "seconds")
                  .format("m分ss秒")
              }}~{{
                dayjs
                  .duration(Number(keywordData.endTime), "seconds")
                  .format("m分ss秒")
              }}
            </div>
          </div>
        </NPopover>
      </div>
      <!-- {{ previewNote }} -->
    </CoursePreviewNoteBox>
    <!-- <div id="preview"></div> -->
  </div>
</template>

<style scoped></style>
