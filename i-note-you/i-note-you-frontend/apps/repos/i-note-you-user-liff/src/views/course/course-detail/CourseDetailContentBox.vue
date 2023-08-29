<script setup lang="ts">
import CourseDetailNotify from "./course-detail-notify/index.vue";
import CourseDetailOutline from "./course-detail-outline/index.vue";
import CourseDtailUnit from "./course-dtail-unit/index.vue";
interface Props {
  navbarIndex: number;
}
const props = defineProps<Props>();
</script>
<template>
  <CourseDetailNotify v-if="props.navbarIndex === 0" />
  <CourseDetailOutline v-if="props.navbarIndex === 1" />
  <CourseDtailUnit v-if="props.navbarIndex === 2" />
</template>

<style scoped></style>
