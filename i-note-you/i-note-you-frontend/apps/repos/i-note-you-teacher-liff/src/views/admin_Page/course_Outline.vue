<script setup lang="ts">
import { defineComponent, ref } from "vue";
import { useMessage, useDialog, FormInst } from "naive-ui";
import axios from "axios";
const baseUrl = ref("https://www.noteyou.ga/");
const url = baseUrl.value + "user/0f478c9f-dc69-47fb-9008-636d9ffa0e05";
const courseListUrl = baseUrl.value + "teacher/course/list";
const courseId = ref(localStorage.getItem("SelectCourse"));
const course_Outline =
  baseUrl.value + "teacher/course/" + courseId.value + "/outline";
const course_OutlineList =
  baseUrl.value + "course/" + courseId.value + "/outline/list";

const formRef = ref<FormInst | null>(null);
const message = useMessage();
const dialog = useDialog();

const showCreatOutline = ref(false);

const bodyStyle2 = {
  width: "400px",
};

const userData = ref(JSON.parse(localStorage.getItem("userData")));
const courseUserId =
  baseUrl.value + "course/" + courseId.value + "/user/" + userData.value.id;
const teacherName = ref(userData.value.name);
const teacherPhone = ref(userData.value.phone);
const teacherPhone_text = "電話";
const attendance_rate = ref("80%");
const attendance_rate_text = "學生到課率";
const Email = ref(userData.value.email);
const Email_text = "電子信箱";
const teaching_success_rate = ref("80%");
const teaching_success_rate_text = "教學成功率";

const course_Img = ref(userData.value.image);
const course_code = ref("");
const course_code_text = "課程代碼";
const course_name = ref("");
const course_name_text = "課程名稱";
const class_time = ref("");
const class_time_text = "上課時間";
const people_count = ref(null);
const people_count_text = "課程人數";

const Outline_count = 10;

const week = "第一週";
const class_day = "2022/05/27";
const course_unit = "第一章";
const teaching_content = "遠距授課";
const evaluate = "問卷";
const course_Outline_list = ref([]);

const OutlineForm = ref<
  Partial<{
    creatClassDayInput: Date;
    Unit: string;
    teaching_contentInput: string;
    evaluateInput: string;
    WeekInput: string;
  }>
>({
  creatClassDayInput: new Date(),
  Unit: "",
  teaching_contentInput: "",
  evaluateInput: "",
  WeekInput: "",
});

axios.get(courseListUrl).then((res) => {
  console.log(localStorage.getItem("SelectCourse"));

  for (let i = 0; i < res.data.length; i++) {
    if (res.data[i].id == localStorage.getItem("SelectCourse")) {
      console.log(res.data[i].id);
      course_code.value = res.data[i].inviteCode;
      course_name.value = res.data[i].name;
      people_count.value = res.data[i].peopleCount;
    }
  }
});

axios.get(course_OutlineList).then((res) => {
  course_Outline_list.value = res.data;
  console.log(res, "大綱list");
});
axios.get(courseUserId).then((res) => {
  if (res.data.attendRate == null) {
    res.data.attendRate = 0;
  }
  if (res.data.successRate == null) {
    res.data.successRate = 0;
  }
  attendance_rate.value = res.data.attendRate + "%";
  teaching_success_rate.value = res.data.successRate + "%";

  console.log(res, "詳細資料");
  localStorage.setItem("courseMemberId", res.data.courseMemberId);
  localStorage.setItem("InviteCode", res.data.courseCode);
});
const creatCourse_Outline = () => {
  console.log(96, OutlineForm.value);
  axios
    .post(course_Outline, {
      week: OutlineForm.value.WeekInput,
      name: OutlineForm.value.Unit,
      teachDate: new Date(OutlineForm.value.creatClassDayInput),
      teachContent: OutlineForm.value.teaching_contentInput,
      evaluate: OutlineForm.value.evaluateInput,
    })
    .then(function (res) {
      console.log(res);
      showCreatOutline.value = false;
    })
    .catch(function (error) {
      console.log(error);
    });
};
</script>
<template>
  <div class="course_outline">
    <div class="textbook_header">課程詳細頁</div>
    <n-row class="course_outline_info"
      ><n-col :span="14"
        ><div class="teacher_info">
          <div>
            <div
              style="
                width: 100px;
                height: 100px;
                border-radius: 100%;
                overflow: hidden;
              "
            >
              <img :src="course_Img" style="width: 100%" />
            </div>
          </div>
          <div style="padding-left: 10px; width: 150px; text-align: center">
            {{ teacherName }}
          </div>
          <div style="padding-left: 10px">
            <div style="margin-bottom: 20px">
              {{ teacherPhone_text }}
              <n-input
                v-model:value="teacherPhone"
                type="text"
                style="width: 90%"
                disabled
              />
            </div>
            <div>
              {{ Email_text }}
              <n-input
                v-model:value="Email"
                type="text"
                style="width: 90%"
                disabled
              />
            </div>
          </div>
          <div style="padding-left: 10px">
            <div style="margin-bottom: 20px">
              {{ attendance_rate_text }}
              <n-input
                v-model:value="attendance_rate"
                type="text"
                style="width: 90%"
                disabled
              />
            </div>
            <div>
              {{ teaching_success_rate_text }}
              <n-input
                v-model:value="teaching_success_rate"
                type="text"
                placeholder="Basic Input"
                style="width: 90%"
                disabled
              />
            </div>
          </div></div
      ></n-col>
      <n-col :span="9"
        ><div class="course_info">
          <div style="padding-left: 10px">
            <div style="margin-bottom: 20px">
              {{ course_code_text }}
              <n-input
                v-model:value="course_code"
                type="text"
                style="width: 90%"
                disabled
              />
            </div>
            <div>
              {{ course_name_text }}
              <n-input
                v-model:value="course_name"
                type="text"
                style="width: 90%"
                disabled
              />
            </div>
          </div>
          <div style="padding-left: 10px">
            <div style="margin-bottom: 20px">
              {{ class_time_text }}
              <n-input
                v-model:value="class_time"
                type="text"
                style="width: 90%"
                disabled
              />
            </div>
            <div>
              {{ people_count_text }}
              <n-input
                v-model:value="people_count"
                type="text"
                style="width: 90%"
                disabled
              />
            </div>
          </div></div
      ></n-col>
    </n-row>
    <n-row class="course_outline_info"
      ><n-col :span="23"
        ><div class="course_outline_info_list">
          <div class="creat_button">
            <n-button
              type="info"
              color="#170600"
              class="creatOutline_btn"
              @click="showCreatOutline = true"
            >
              創建課綱
            </n-button>
          </div>

          <n-row
            ><n-col :span="24">
              <div class="Outline_titleList">
                <div class="Outline_titlelist_text">週</div>
                <div class="Outline_titlelist_text">上課日</div>
                <div class="Outline_titlelist_text">課程單元</div>
                <div class="Outline_titlelist_text">教學內容</div>
                <div class="Outline_titlelist_text">評量</div>
              </div></n-col
            ></n-row
          >
          <n-row v-if="course_Outline_list != 'not find outline'"
            ><n-col :span="24">
              <n-scrollbar class="Outline_scrollbar" style="margin-top: 5px">
                <div
                  class="Outline_List"
                  v-for="item in course_Outline_list"
                  :key="item"
                >
                  <div class="Outline_list_text">{{ item.week }}</div>
                  <div class="Outline_list_text">{{ item.teachDate }}</div>
                  <div class="Outline_list_text">
                    {{ item.name }}
                  </div>
                  <div class="Outline_list_text">
                    {{ item.teachContent }}
                  </div>
                  <div class="Outline_list_text">
                    {{ item.evaluate }}
                  </div>
                </div>
                <br />
              </n-scrollbar> </n-col
          ></n-row>
          <div v-else class="empty">
            <img src="../../assets/img/textbook/NoTextbook.png" />
          </div></div></n-col
    ></n-row>

    <n-modal
      v-model:show="showCreatOutline"
      class="custom-card"
      preset="card"
      :style="bodyStyle2"
      size="huge"
      :bordered="false"
    >
      <template #header class="creatCourse_header">創建課綱 </template>
      <template #header-extra> </template>
      <n-form
        ref="formRef"
        :model="OutlineForm"
        :rules="rules"
        :size="size"
        label-placement="top"
      >
        <n-form-item path="WeekInput">
          週
          <n-input v-model:value="OutlineForm.WeekInput" placeholder=" " />
        </n-form-item>
        <n-form-item path="creatClassDayInput">
          上課日
          <n-date-picker
            v-model:value="OutlineForm.creatClassDayInput"
            type="date"
          />
        </n-form-item>
        <div>
          課程單元
          <n-input v-model:value="OutlineForm.Unit" placeholder=" " />
        </div>
        <n-form-item path="creatClassDayInput">
          教學內容
          <n-input
            v-model:value="OutlineForm.teaching_contentInput"
            placeholder=" "
          />
        </n-form-item>
        <div>
          評量
          <n-input v-model:value="OutlineForm.evaluateInput" placeholder=" " />
        </div>
        <n-form-item style="text-align: center">
          <n-button
            type="info"
            color="#170600"
            @click="creatCourse_Outline"
            class="creatOutlineOK_btn"
          >
            確定
          </n-button>
        </n-form-item>
      </n-form>

      <!-- <template #footer> 尾部 </template> -->
    </n-modal>
  </div>
</template>
