<script setup lang="ts">
import { NAvatar, NInput } from "naive-ui";
import { ElDrawer, ElNotification } from "element-plus";
import { useCourseStoreState } from "@/stores/course";
import { ref, onMounted, watchEffect } from "vue";
import { useRouter } from "vue-router";
import EmptyBox from "@/components/empty-box/index.vue";
import { getRandomInt, generaRandomArray } from "@/utils/globalMethods";
import CourseBox from "../components/CourseBox.vue";
import CourseNotifyBox from "../components/CourseNotifyBox.vue";

import { useUserState } from "@/utils/hooks/useUser";
import { CourseType, NotifyType } from "@/service/course/type";
import { getCourseList, joinCourse, getNotifyList } from "@/service/course";
import { ElLoading } from "element-plus";
import { useScroll } from "@vueuse/core";
const el = ref<HTMLElement | null>(null);
const scroll = useScroll(el, { behavior: "smooth" });
const { getUserData } = useUserState();
const courseStore = useCourseStoreState();
const courseListData = ref<CourseType[]>([]);
const courseInviteCode = ref<string>("");
const notifyListData = ref<NotifyType[]>([]);
const Router = useRouter();
const handleGoToCourseDetail = (courseId: string) => {
  console.log(24, courseId);
  Router.push({ path: `/course/${courseId}` });
};
const handleJoinCourse = async () => {
  const loading = ElLoading.service({
    lock: true,
    text: "載入中",
    background: "rgba(0, 0, 0, 0.7)",
  });
  if (courseInviteCode.value.length > 0) {
    if (await joinCourse(getUserData.value.id, courseInviteCode.value)) {
      ElNotification({
        title: "成功",
        message: "成功加入課程!",
        type: "success",
        showClose: false,
      });
      courseInviteCode.value = "";
      const courseList = await getCourseList(getUserData.value.id);
      loading.close();
      return (courseListData.value = courseList);
    }
    loading.close();
    return ElNotification({
      title: "錯誤",
      message: "請輸入正確課程代碼",
      type: "error",
      showClose: false,
    });
  } else {
    loading.close();

    ElNotification({
      title: "提示",
      message: "請輸入課程代碼",
      type: "warning",
      showClose: false,
    });
  }
};
onMounted(async () => {
  const loading = ElLoading.service({
    lock: true,
    text: "載入中",
    background: "rgba(0, 0, 0, 0.7)",
  });
  const courseList = await getCourseList(getUserData.value.id);
  courseListData.value = courseList;
  loading.close();
  console.log(courseList);
});
watchEffect(async () => {
  if (courseStore.useCourseNotify) {
    const loading = ElLoading.service({
      lock: true,
      text: "載入中",
      background: "rgba(0, 0, 0, 0.7)",
    });
    // el.value!.scrollTop = 0;
    const notifyList = await getNotifyList(getUserData.value.id);
    console.log(85, notifyList);
    notifyListData.value = notifyList;
    scroll.y!.value = 0;
    loading.close();
  }
});
</script>
<template>
  <div class="course-list px-[2vw] py-[3vh]" ref="el">
    <div class="flex justify-between mb-[2vh]">
      <div>
        <div
          :class="`init-course-btn !bg-[#170600] w-fit px-[2vw] py-[1.5vh] !rounded-[15px] text-xl font-['Robot-Bold'] text-white mb-[2.5vh]`"
        >
          新增課程
        </div>
        <div class="init-course-input-box flex items-center">
          <NInput
            v-model:value="courseInviteCode"
            type="text"
            clearable
            size="large"
            class="rounded-[15px]"
            placeholder="輸入邀請碼"
          />
          <div
            @click="handleJoinCourse"
            class="ml-[1vw] text-[#CC3300] font-['Robot-Regular'] text-xl w-fit whitespace-nowrap cursor-pointer"
          >
            加入課程
          </div>
        </div>
      </div>

      <div>
        <NAvatar class="w-[3.5vw] h-[3.5vw]" round :src="getUserData.image" />
      </div>
    </div>
    <div class="course-list-box">
      <div class="font-['Robot-Bold'] flex items-end">
        <div class="text-[1.875rem] leading-[2.3rem] text-black">所有課程</div>
        <div class="text-2xl text-[#535353] ml-[1vw]">
          共 {{ courseListData.length }} 堂
        </div>
      </div>

      <div
        class="py-[3vh] flex flex-wrap gap-[3vw]"
        v-if="courseListData.length > 0"
      >
        <CourseBox
          v-for="(courseData, index) in courseListData"
          :key="index"
          :course-data="courseData"
          @click="handleGoToCourseDetail(courseData.id)"
        />
      </div>
      <EmptyBox v-else />
    </div>
    <ElDrawer
      :size="'35%'"
      v-model="courseStore.useCourseNotify"
      :with-header="false"
      :z-index="20000"
      custom-class="!rounded-[10px]"
    >
      <div class="!text-black text-xl font-['Robot-Bold'] mb-[1vh]">
        所有通知
      </div>
      <div class="course-notify-list-box">
        <CourseNotifyBox
          v-for="(notifyData, index) in notifyListData"
          :key="index"
          :notify-data="notifyData"
        />
      </div>
    </ElDrawer>
  </div>
</template>

<style lang="scss">
.init-course-input-box {
  .n-input {
    .n-input-wrapper {
      padding: 1vh 2vw;
      width: 30vw;
      border-radius: 15px !important;
      background-color: #d9d9d9;
      .n-input__input {
        font-size: 1.25rem;
        font-family: Robot-Regular;
      }
      .n-input__placeholder {
        color: #858585;
        font-size: 1.25rem;
        font-family: Robot-Regular;
      }
    }
  }
}
.course-box-mask {
  opacity: 0;
}
.course-box:hover .course-box-mask {
  opacity: 1;
}
</style>
