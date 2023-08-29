<script setup lang="ts">
import CoursePreviewNoteBox from "@/views/course/components/CoursePreviewNoteBox.vue";
import { useCourseState } from "@/utils/hooks/useCourse";
const { getCourseNoteData } = useCourseState();
</script>
<template>
  <CoursePreviewNoteBox class="!h-[93.5vh]">{{
    getCourseNoteData
  }}</CoursePreviewNoteBox>
</template>

<style scoped></style>
