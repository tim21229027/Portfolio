<script setup lang="ts">
import { ref } from "vue";
import axios from "axios";

const baseUrl = ref("https://www.noteyou.ga/");
const courseId = ref(localStorage.getItem("SelectCourse"));
const course_User = baseUrl.value + "course/" + courseId.value + "/users";

const course_userList = ref([]);

const UserNote = ref("");
const userNoteSimilarity = ref("");
const MemberUrl = ref(
  baseUrl.value + "course/unit/" + localStorage.getItem("SelectUnit") + "/notes"
);
axios.get(MemberUrl.value).then((res) => {
  course_userList.value = res.data;
});

const sites = [
  { text: "王至明", index: 57, att: 15 },
  { text: "陳文華", index: 66, att: 100 },
  { text: "王博鈞", index: 83, att: 95 },
  { text: "林皓翔", index: 43, att: 77 },
  { text: "李麗寶", index: 22, att: 25 },
  { text: "鄭宇欣", index: 15, att: 10 },
  { text: "呂凱文", index: 89, att: 50 },
  { text: "邱柏翔", index: 98, att: 37 },
  { text: "楊嘉怡", index: 32, att: 76 },
  { text: "黃與柔", index: 31, att: 12 },
];
const getUserID = (userId: any) => {
  console.log(userId);
  const NoteBookUrl =
    baseUrl.value +
    "course/unit/" +
    localStorage.getItem("SelectUnit") +
    "/note/" +
    userId;
  axios.get(NoteBookUrl).then((res) => {
    console.log(res.data);
    UserNote.value = res.data.content;
    userNoteSimilarity.value = res.data.similarity + "%";
  });
};
</script>

<template>
  <div class="note_Management">
    <n-row gutter="12"
      ><n-col :span="23"> <div class="textbook_header">筆記管理</div></n-col>
    </n-row>
    <n-row gutter="12"
      ><n-col :span="23">
        <div class="noteBorder">
          <n-row gutter="12"
            ><n-col :span="7">
              <div class="NoteStudentList">
                <div style="padding: 4%">
                  <n-input placeholder=" ">
                    <template #prefix
                      ><img src="../../assets/img/note/search.png" width="20"
                    /></template>
                  </n-input>
                </div>
                <n-scrollbar style="max-height: 700px">
                  <div
                    class="NotestudentListOne"
                    v-for="site in course_userList"
                    :key="site"
                    @click="getUserID(site.courseMemberId)"
                  >
                    <div>
                      <img
                        src="../../assets/img/conference/peopleCount.png"
                        width="25"
                        style="margin-right: 5%; top: 7px"
                      /><span class="NotestudentListName">{{ site.name }}</span>
                    </div>
                  </div>
                </n-scrollbar>
              </div></n-col
            ><n-col :span="17">
              <n-row gutter="12"
                ><n-col :span="24">
                  <div class="note_similar">
                    <img
                      src="../../assets/img/note/alertCircle.png"
                      width="25"
                    />
                    <span class="note_similar_name">筆記相似度</span>
                    <span class="note_similar_rate">{{
                      userNoteSimilarity
                    }}</span>
                  </div></n-col
                ></n-row
              >
              <div class="notebook">
                <n-scrollbar style="max-height: 650px"
                  ><div>{{ UserNote }}</div></n-scrollbar
                >
              </div>
            </n-col></n-row
          >
        </div>
      </n-col></n-row
    >
  </div>
</template>
