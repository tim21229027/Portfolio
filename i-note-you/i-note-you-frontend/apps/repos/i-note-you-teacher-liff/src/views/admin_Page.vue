<script setup lang="ts">
import TextbookManagement from "./admin_Page/textbook_Management.vue";
import ConferenceManagement from "./admin_Page/conference_Management.vue";
import CourseOutline from "./admin_Page/course_Outline.vue";
import NotificationManagement from "./admin_Page/notification_management.vue";
import StudentManagement from "./admin_Page/student_Management.vue";
import { ref } from "vue";
import axios from "axios";
const baseUrl = ref("https://www.noteyou.ga/");
const courseListUrl = baseUrl.value + "teacher/course/list";
const courseId = ref(localStorage.getItem("SelectCourse"));
axios.get(courseListUrl).then((res) => {
  console.log(localStorage.getItem("SelectCourse"));

  for (let i = 0; i < res.data.length; i++) {
    if (res.data[i].id == courseId.value) {
      console.log(res.data[i].id);

      courseName.value = res.data[i].name;
    }
  }
});
const courseName = ref("");
const testValue = ref(0);
const deviceEnableOrDisable = (value: any) => {
  testValue.value = value;
};
</script>

<template>
  <div>
    <n-row gutter="12">
      <div class="secend_mean">
        <div class="class_title">{{ courseName }}</div>
        <div class="secend_list">
          <n-row gutter="12"
            ><n-col :span="24"
              ><button
                class="check_outline"
                @click="deviceEnableOrDisable(0)"
                v-if="testValue == 0"
              >
                <n-row gutter="12"
                  ><n-col :span="6"
                    ><n-icon size="34"
                      ><img src="../assets/img/book.png" /></n-icon></n-col
                  ><n-col :span="18"
                    ><p class="secend_list_text">課程大綱</p></n-col
                  ></n-row
                ></button
              ><button
                class="outline"
                @click="deviceEnableOrDisable(0)"
                v-if="testValue != 0"
              >
                <n-row gutter="12"
                  ><n-col :span="6"
                    ><n-icon size="34"
                      ><img src="../assets/img/book2.png" /></n-icon></n-col
                  ><n-col :span="18"
                    ><p class="secend_list_text">課程大綱</p></n-col
                  ></n-row
                >
              </button></n-col
            ></n-row
          >
          <n-row gutter="12"
            ><n-col :span="24"
              ><button
                class="check_outline"
                @click="deviceEnableOrDisable(1)"
                v-if="testValue == 1"
              >
                <n-row gutter="12"
                  ><n-col :span="6"
                    ><n-icon size="34"
                      ><img src="../assets/img/textbook1.png" /></n-icon></n-col
                  ><n-col :span="18"
                    ><p class="secend_list_text">教材管理</p></n-col
                  ></n-row
                ></button
              ><button
                class="outline"
                @click="deviceEnableOrDisable(1)"
                v-if="testValue != 1"
              >
                <n-row gutter="12"
                  ><n-col :span="6"
                    ><n-icon size="34"
                      ><img src="../assets/img/textbook2.png" /></n-icon></n-col
                  ><n-col :span="18"
                    ><p class="secend_list_text">教材管理</p></n-col
                  ></n-row
                >
              </button></n-col
            ></n-row
          >
          <n-row gutter="12"
            ><n-col :span="24"
              ><button
                class="check_outline"
                @click="deviceEnableOrDisable(2)"
                v-if="testValue == 2"
              >
                <n-row gutter="12"
                  ><n-col :span="6"
                    ><n-icon size="34"
                      ><img src="../assets/img/messages1.png" /></n-icon></n-col
                  ><n-col :span="18"
                    ><p class="secend_list_text">通知管理</p></n-col
                  ></n-row
                >
              </button>
              <button
                class="outline"
                @click="deviceEnableOrDisable(2)"
                v-if="testValue != 2"
              >
                <n-row gutter="12"
                  ><n-col :span="6"
                    ><n-icon size="34"
                      ><img src="../assets/img/messages2.png" /></n-icon></n-col
                  ><n-col :span="18"
                    ><p class="secend_list_text">通知管理</p></n-col
                  ></n-row
                >
              </button></n-col
            ></n-row
          >
          <n-row gutter="12"
            ><n-col :span="24"
              ><button
                class="check_outline"
                @click="deviceEnableOrDisable(3)"
                v-if="testValue == 3"
              >
                <n-row gutter="12"
                  ><n-col :span="6"
                    ><n-icon size="34"
                      ><img
                        src="../assets/img/videoconference1.png" /></n-icon></n-col
                  ><n-col :span="18"
                    ><p class="secend_list_text">會議管理</p></n-col
                  ></n-row
                ></button
              ><button
                class="outline"
                @click="deviceEnableOrDisable(3)"
                v-if="testValue != 3"
              >
                <n-row gutter="12"
                  ><n-col :span="6"
                    ><n-icon size="34"
                      ><img
                        src="../assets/img/videoconference2.png" /></n-icon></n-col
                  ><n-col :span="18"
                    ><p class="secend_list_text">會議管理</p></n-col
                  ></n-row
                >
              </button></n-col
            ></n-row
          >
          <n-row gutter="12"
            ><n-col :span="24"
              ><button
                class="check_outline"
                @click="deviceEnableOrDisable(4)"
                v-if="testValue == 4"
              >
                <n-row gutter="12"
                  ><n-col :span="6"
                    ><n-icon size="34"
                      ><img src="../assets/img/student1.png" /></n-icon></n-col
                  ><n-col :span="18"
                    ><p class="secend_list_text">學生管理</p></n-col
                  ></n-row
                ></button
              ><button
                class="outline"
                @click="deviceEnableOrDisable(4)"
                v-if="testValue != 4"
              >
                <n-row gutter="12"
                  ><n-col :span="6"
                    ><n-icon size="34"
                      ><img src="../assets/img/student2.png" /></n-icon></n-col
                  ><n-col :span="18"
                    ><p class="secend_list_text">學生管理</p></n-col
                  ></n-row
                >
              </button></n-col
            ></n-row
          >
        </div>
      </div>

      <n-col :span="24"
        ><div class="Management">
          <div v-if="testValue == 0"><CourseOutline /></div>
          <div v-if="testValue == 1"><TextbookManagement /></div>
          <div v-if="testValue == 2"><NotificationManagement /></div>
          <div v-if="testValue == 3"><ConferenceManagement /></div>
          <div v-if="testValue == 4"><StudentManagement /></div></div></n-col
    ></n-row>
  </div>
</template>
