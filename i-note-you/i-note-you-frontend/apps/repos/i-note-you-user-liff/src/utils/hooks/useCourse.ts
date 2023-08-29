import { useCourseStoreState } from "@/stores/course";
import { computed } from "vue";

export function useCourseState() {
  const courseStore = useCourseStoreState();
  const getCourseDetailData = computed(() => courseStore.courseDetailData);
  const getCourseUseNotify = computed(() => courseStore.useCourseNotify);
  const getCourseUnitValue = computed(() => courseStore.courseUnitVal);
  const getCourseNoteData = computed(() => courseStore.courseData.noteData);
  const getCourseKeywordRank = computed(
    () => courseStore.courseData.keywordsRank
  );
  const getCourseMeetingData = computed(() => courseStore.meetingData);
  return {
    getCourseDetailData,
    getCourseUseNotify,
    getCourseUnitValue,
    getCourseNoteData,
    getCourseKeywordRank,
    getCourseMeetingData,
  };
}
