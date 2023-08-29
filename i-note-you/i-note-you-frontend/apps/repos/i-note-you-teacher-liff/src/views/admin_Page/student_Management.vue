<script setup lang="ts">
import { defineComponent, ref, onMounted } from "vue";
import { useMessage, useDialog, FormInst } from "naive-ui";
import axios from "axios";
const baseUrl = ref("https://www.noteyou.ga/");
const courseId = ref(localStorage.getItem("SelectCourse"));
const course_User = baseUrl.value + "course/" + courseId.value + "/users";

const studentList = ref("");
const StudentData = ref<any>([]);
const page = ref<any>(1);
const page_count = ref<any>(null);
const page_list = 2;
const showInviteCode = ref(false);
const message = useMessage();
const dialog = useDialog();
const inviteCode = localStorage.getItem("InviteCode");
const inviteLink = ref("Https://");
const bodyStyle2 = {
  width: "400px",
};
const data = [
  {
    key: 1,
    name: "John Brown",
    studentEmail: "a315146466@gmail.com",
    similarity: 90,
    attend: 96,
  },
  {
    key: 2,
    name: "Jim Green",
    studentEmail: "a315146466@gmail.com",
    similarity: 90,
    attend: 96,
  },
  {
    key: 3,
    name: "Joe Black",
    studentEmail: "a315146466@gmail.com",
    similarity: 90,
    attend: 96,
  },
  {
    key: 4,
    name: "Jim Red",
    studentEmail: "a315146466@gmail.com",
    similarity: 90,
    attend: 96,
  },
  {
    key: 4,
    name: "Jim Red",
    studentEmail: "a315146466@gmail.com",
    similarity: 90,
    attend: 96,
  },
  {
    key: 4,
    name: "Jim Red",
    studentEmail: "a315146466@gmail.com",
    similarity: 90,
    attend: 96,
  },
  {
    key: 4,
    name: "Jim Red",
    studentEmail: "a315146466@gmail.com",
    similarity: 90,
    attend: 96,
  },
  {
    key: 4,
    name: "Jim Red",
    studentEmail: "a315146466@gmail.com",
    similarity: 90,
    attend: 96,
  },
  {
    key: 4,
    name: "Jim Red",
    studentEmail: "a315146466@gmail.com",
    similarity: 90,
    attend: 96,
  },
  {
    key: 4,
    name: "Jim Red",
    studentEmail: "a315146466@gmail.com",
    similarity: 90,
    attend: 96,
  },
  {
    key: 4,
    name: "Jim Red",
    studentEmail: "a315146466@gmail.com",
    similarity: 90,
    attend: 96,
  },
  {
    key: 4,
    name: "Jim Red",
    studentEmail: "a315146466@gmail.com",
    similarity: 90,
    attend: 96,
  },
  {
    key: 4,
    name: "Jim Red",
    studentEmail: "a315146466@gmail.com",
    similarity: 90,
    attend: 96,
  },
];
const student_list_count = data.length;
axios.get(course_User).then((res) => {
  studentList.value = res.data;
  console.log(res, "學生list");
});
function increment() {
  for (let i = 1; i <= studentList.value.length; i++) {
    page_count.value = Math.ceil(studentList.value.length / 8);

    studentList.value = studentList.value.slice(
      page.value * 8 - 8,
      page.value * 8
    );
    console.log(studentList.value, "查");
  }
}

onMounted(() => {
  increment();
});
</script>
<template>
  <div class="student_Management">
    <n-row gutter="12"
      ><n-col :span="11"> <div class="textbook_header">學生管理</div></n-col>
      <n-col :span="12">
        <n-button
          type="info"
          color="#170600"
          class="creatCourse_btn"
          @click="showInviteCode = true"
        >
          邀請
        </n-button>
        <n-button
          type="info"
          color="#018A0E"
          class="creatCourse_btn"
          style="margin-right: 30px"
        >
          匯出成Excel
        </n-button>
      </n-col>
    </n-row>
    <n-row gutter="12"
      ><n-col :span="23"
        ><div class="student_list_border">
          <div class="student_list_header">
            <div class="student_page_header_left">
              <n-input placeholder=" " style="width: 85%">
                <template #prefix>
                  <n-icon size="20"
                    ><svg
                      xmlns="http://www.w3.org/2000/svg"
                      xmlns:xlink="http://www.w3.org/1999/xlink"
                      viewBox="0 0 512 512"
                    >
                      <path
                        d="M456.69 421.39L362.6 327.3a173.81 173.81 0 0 0 34.84-104.58C397.44 126.38 319.06 48 222.72 48S48 126.38 48 222.72s78.38 174.72 174.72 174.72A173.81 173.81 0 0 0 327.3 362.6l94.09 94.09a25 25 0 0 0 35.3-35.3zM97.92 222.72a124.8 124.8 0 1 1 124.8 124.8a124.95 124.95 0 0 1-124.8-124.8z"
                        fill="currentColor"
                      ></path></svg
                  ></n-icon>
                </template>
              </n-input>
            </div>
            <div class="student_page_header_right">
              <n-space vertical>
                <n-pagination
                  v-model:page="page"
                  :page-count="page_count"
                  show-quick-jumper
                  :page-slot="7"
                  :page-size="page_list"
                  @change="increment()"
                >
                  <template #goto> 跳至 </template>
                </n-pagination>
              </n-space>
            </div>
          </div>
          <div class="student_title">
            <n-row gutter="12"
              ><n-col :span="24">
                <div class="student_titleList">
                  <div class="student_titlelist_text">姓名</div>
                  <div class="student_titlelist_text">E-mail</div>
                  <div class="student_titlelist_text">筆記總相似度</div>
                  <div class="student_titlelist_text">課堂總出席率</div>
                  <div></div></div></n-col
            ></n-row>
            <n-row gutter="12"
              ><n-col :span="24">
                <div v-if="student_list_count >= 1">
                  <div
                    class="student_List"
                    v-for="item in studentList"
                    :key="item"
                  >
                    <div class="student_list_text">{{ item.user.name }}</div>
                    <div class="student_list_text">{{ item.user.email }}</div>
                    <div class="student_list_text">
                      {{ item.noteSimilarity }}%
                    </div>
                    <div class="student_list_text">
                      {{ item.attendanceRate }}%
                    </div>
                    <div></div>
                  </div>
                </div>
                <div v-else class="empty">
                  <img src="../../assets/img/textbook/NoTextbook.png" />
                </div>
              </n-col>
            </n-row>
          </div>
          <div class="student_list"></div></div></n-col
    ></n-row>
    <n-modal
      v-model:show="showInviteCode"
      class="custom-card"
      preset="card"
      :style="bodyStyle2"
      size="huge"
      :bordered="false"
    >
      <template #header class="creatCourse_header">發送邀請連結 </template>
      <template #header-extra> </template>
      <div class="invite">
        <img src="@/assets/img/hash.png" />邀請碼
        <n-input placeholder=" " readonly v-model:value="inviteCode">
          <template #suffix>
            <img src="@/assets/img/copy.png" />
          </template>
        </n-input>
      </div>
      <!-- <div class="invite">
        <img src="@/assets/img/paperclip.png" />邀請連結
        <n-input placeholder=" " readonly v-model:value="inviteLink">
          <template #suffix>
            <img src="@/assets/img/copy.png" />
          </template>
        </n-input>
      </div> -->
      <!-- <template #footer> 尾部 </template> -->
    </n-modal>
  </div>
</template>