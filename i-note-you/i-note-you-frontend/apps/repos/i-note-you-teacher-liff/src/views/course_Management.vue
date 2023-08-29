<script setup lang="ts">
import { defineComponent, ref, onMounted } from "vue";
import { useMessage, useDialog, FormInst, UploadFileInfo } from "naive-ui";
import axios from "axios";
const baseUrl = ref("https://www.noteyou.ga/");
const url = baseUrl.value + "user/0f478c9f-dc69-47fb-9008-636d9ffa0e05";
const courseUrl = baseUrl.value + "teacher/course";
const courseListUrl = baseUrl.value + "teacher/course/list";
const formRef = ref<FormInst | null>(null);
const courseList = ref([]);
const message = useMessage();
const dialog = useDialog();
const title_count = ref(null);
const course_name = ref("");
const course_class = "資管三乙";
const course_code = "G2FSDF21";
const course_people = 60;
const inviteCode = ref("GSLKDGJ123");
const inviteLink = ref("Https://");

const size = ref("medium");
const courseForm: any = ref({
  user: {
    name: "",
    age: "",
  },
  phone: "",
  teacherName: "",
  tacheremail: "",
  courseCode: "",
  courseName: "",
  coursePeople: "",
  courseTime: "",
  courseIntroduction: "",
  class: "",
  courseImg: "",
});

axios.get(courseListUrl).then((res) => {
  courseList.value = res.data;
  course_name.value = res.data.name;
  for (let i = 0; i < res.data.length; i++) {
    title_count.value = res.data.length;
  }
});

axios.get(url).then((res) => {
  courseForm.value.teacherName = res.data.name;
  courseForm.value.tacheremail = res.data.email;
  courseForm.value.phone = res.data.phone;
  course_name.value = res.data.name;
});

const bodyStyle = {
  width: "700px",
};
const bodyStyle2 = {
  width: "400px",
};
const segmented = {
  content: "soft",
  footer: "soft",
} as const;

const showModal = ref(false);
const showInviteCode = ref(false);

const creatCourse = () => {
  axios
    .post(courseUrl, {
      userId: "0f478c9f-dc69-47fb-9008-636d9ffa0e05",
      image:
        "https://i-note-you-s3.s3.ap-northeast-1.amazonaws.com/images/709291-1.jpg",
      name: courseForm.value.courseName,
      peopleCount: courseForm.value.coursePeople,
      session: courseForm.value.class,
      courseTime: courseForm.value.courseTime,
      description: courseForm.value.courseIntroduction,
    })
    .then(function (response) {
      showModal.value = false;
      showInviteCode.value = true;
      inviteCode.value = response.data.inviteCode;
    })
    .catch(function (error) {
      console.log(error);
    });
};
const getCourseId = (id: any) => {
  console.log(id);
  localStorage.setItem("SelectCourse", id);
};
</script>

<template>
  <div class="course_Manage">
    <div class="course_hearder">
      <n-row gutter="12">
        <n-col :span="11">
          <span class="title"
            >課程列表<span class="title_count"
              >共{{ title_count }}堂</span
            ></span
          ></n-col
        ><n-col :span="12">
          <n-button
            type="info"
            color="#170600"
            class="creatCourse_btn"
            @click="showModal = true"
          >
            創建課程
          </n-button></n-col
        ></n-row
      >

      <n-modal
        v-model:show="showModal"
        class="custom-card"
        preset="card"
        :style="bodyStyle"
        size="huge"
        :bordered="false"
        :segmented="segmented"
      >
        <template #header class="creatCourse_header">創建課程 </template>
        <template #header-extra> </template>
        <n-row gutter="12">
          <n-form
            ref="formRef"
            inline
            :label-width="120"
            :model="courseForm"
            :size="size"
          >
            <n-col :span="8" class="course_col"
              ><n-form-item label="課程照片" path="courseImg">
                <n-upload
                  action="https://www.mocky.io/v2/5e4bafc63100007100d8b70f"
                  list-type="image-card"
                  max="1"
                >
                  +
                </n-upload></n-form-item
              >
              <div class="teacherBasic">
                <n-form-item label="老師姓名" path="teacherName">
                  <n-input
                    v-model:value="courseForm.teacherName"
                    placeholder=" "
                    disabled
                  />
                </n-form-item>
                <n-form-item label="電話" path="phone">
                  <n-input
                    v-model:value="courseForm.phone"
                    placeholder=" "
                    disabled
                  />
                </n-form-item>
                <n-form-item label="E-mail" path="tacheremail">
                  <n-input
                    v-model:value="courseForm.tacheremail"
                    placeholder=" "
                    disabled
                  />
                </n-form-item>
                <n-form-item> </n-form-item>
              </div>
            </n-col>
            <n-col :span="16" class="course_col">
              <n-row gutter="12">
                <n-col :span="11" class="course_col">
                  <n-form-item label="課程名稱" path="courseName">
                    <n-input
                      v-model:value="courseForm.courseName"
                      placeholder=" "
                    />
                  </n-form-item> </n-col
                ><n-col :span="12" class="course_col"
                  ><n-form-item label="課程班級" path="coursePeople">
                    <n-input
                      v-model:value="courseForm.class"
                      placeholder=" "
                    /> </n-form-item></n-col></n-row
              ><n-row gutter="12">
                <n-col :span="11" class="course_col">
                  <n-form-item label="課程人數" path="coursePeople">
                    <n-input
                      v-model:value="courseForm.coursePeople"
                      placeholder=" "
                    /> </n-form-item
                ></n-col>
                <n-col :span="12" class="course_col">
                  <n-form-item label="上課時間" path="courseTime">
                    <n-input
                      v-model:value="courseForm.courseTime"
                      placeholder=" "
                    /> </n-form-item></n-col
              ></n-row>
              <n-form-item label="課程簡介" path="courseIntroduction">
                <n-input
                  v-model:value="courseForm.courseIntroduction"
                  placeholder=" "
                  type="textarea"
                  style="height: 205px"
                />
              </n-form-item>

              <n-button
                type="info"
                color="#170600"
                class="creatCourseC_btn"
                @click="creatCourse"
              >
                創建
              </n-button>
            </n-col></n-form
          >
        </n-row>
        <!-- <template #footer> 尾部 </template> -->
      </n-modal>
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
          <img src="../assets/img/hash.png" />邀請碼
          <n-input placeholder=" " readonly v-model:value="inviteCode">
            <template #suffix>
              <img src="../assets/img/copy.png" />
            </template>
          </n-input>
        </div>
        <!-- <div class="invite">
          <img src="../assets/img/paperclip.png" />邀請連結
          <n-input placeholder=" " readonly v-model:value="inviteLink">
            <template #suffix>
              <img src="../assets/img/copy.png" />
            </template>
          </n-input>
        </div> -->
        <!-- <template #footer> 尾部 </template> -->
      </n-modal>

      <n-row gutter="12" v-if="title_count >= 1">
        <n-col :span="24" class="course_col"
          ><router-link
            to="/admin_Page"
            v-for="item in courseList"
            v-bind:key="item"
            ><div class="course" @click="getCourseId(item.id)">
              <div class="course_imgBoredr">
                <img :src="item.image" />
              </div>
              <div class="course_name">{{ item.name }}</div>
              <div class="course_class">{{ item.session }}</div>
              <div class="course_code_people">
                <n-row gutter="12">
                  <n-col :span="16">{{ item.inviteCode }}</n-col
                  ><n-col :span="8"
                    ><n-icon size="20"
                      ><img
                        src="../assets/img/users.png"
                        style="width: 12px" /></n-icon
                    >{{ item.peopleCount }}人</n-col
                  ></n-row
                >
              </div>
            </div></router-link
          >
        </n-col></n-row
      >
      <div v-else class="empty">
        <img src="../assets/img/EmptyBox.png" />
      </div>
    </div>
  </div>
</template>
