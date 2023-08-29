<script setup lang="ts">
import PersonalNote from "./PersonalNote.vue";
import ClassNote from "./ClassNote.vue";
import HistoryNote from "./HistoryNote.vue";
import KeywordRank from "./KeywordRank.vue";
import { watchEffect, ref } from "vue";
import { CourseUnitNoteType } from "@/service/course/type";
interface Props {
  noteType: number;
  unitId: string;
}
const props = defineProps<Props>();
watchEffect(async () => {
  if (props.noteType === 0) {
  }
});
</script>
<template>
  <div class="h-full">
    <PersonalNote v-if="props.noteType === 0" :unit-id="unitId" />
    <ClassNote v-if="props.noteType === 1" :unit-id="unitId" />
    <HistoryNote v-if="props.noteType === 2" />
    <KeywordRank v-if="props.noteType === 3" :unit-id="unitId" />
  </div>
</template>

<style scoped></style>
