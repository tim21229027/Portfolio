<script setup lang="ts">
import CoursePreviewNoteBox from "@/views/course/components/CoursePreviewNoteBox.vue";
import { useCourseState } from "@/utils/hooks/useCourse";
import { getCourseUnitClassNote } from "@/service/course";
import { onMounted, ref } from "vue";
interface Props {
  unitId: string;
}
const props = defineProps<Props>();
const classNoteData = ref("");
const { getCourseNoteData } = useCourseState();
onMounted(async () => {
  const classNote = await getCourseUnitClassNote(props.unitId);
  console.log(13, classNote);
  classNoteData.value = classNote;
});
</script>
<template>
  <CoursePreviewNoteBox class="!h-[93.5vh]">{{
    classNoteData
  }}</CoursePreviewNoteBox>
</template>

<style scoped></style>
