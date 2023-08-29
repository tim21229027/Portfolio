<script setup lang="ts">
import NoteManagement from "./note_Management.vue";
import VideoManagerne from "./video.Managerne.vue";
import EditTextbook from "./edit_textbook.vue";
import { defineComponent, ref } from "vue";
import { useMessage, useDialog, FormInst } from "naive-ui";
import axios from "axios";
const baseUrl = ref("https://www.noteyou.ga/");
const courseId = ref(localStorage.getItem("SelectCourse"));
const UnitUrl = baseUrl.value + "course/" + courseId.value + "/units";
const UnitList = ref([]);
const formRef = ref<FormInst | null>(null);
const textbook_count = 1;
const Management = ref(0);
const InClassDate = "2022/05/06";
const Unit = "Magic";
const showCreatTextBook = ref(false);
const size = ref("medium");
const textbookForm = ref<
  Partial<{
    InClassDate: string;
    Unit: string;
    InClassDat: string;
  }>
>({
  InClassDate: "",
  Unit: "",
});
const bodyStyle = {
  width: "600px",
};
const selectMangement = (value: number, id: any) => {
  console.log(id);
  localStorage.setItem("SelectUnit", id);
  if (value == 0) {
    Management.value = 0;
  }
  if (value == 1) {
    Management.value = 1;
  }
  if (value == 2) {
    Management.value = 2;
  }
  if (value == 3) {
    Management.value = 3;
  }
};
axios.get(UnitUrl).then((res) => {
  UnitList.value = res.data;
  console.log(res, "單元list");
});
</script>
<template>
  <div class="textbook_Management" v-if="Management == 0">
    <n-row gutter="12"
      ><n-col :span="11"> <div class="textbook_header">教材管理</div></n-col>
      <n-col :span="12"
        ><n-button
          type="info"
          color="#170600"
          class="creatCourse_btn"
          @click="showCreatTextBook = true"
        >
          創建教材
        </n-button></n-col
      > </n-row
    ><n-row gutter="12"
      ><n-col :span="24">
        <div class="textbook_titleList">
          <div class="textbook_titlelist_text">上課日</div>
          <div class="textbook_titlelist_text">課程單元</div>
          <div class="textbook_titlelist_text">教材內容</div>
          <div class="textbook_titlelist_text">錄影管理</div>
          <div class="textbook_titlelist_text">筆記管理</div>
        </div></n-col
      ></n-row
    ><n-row gutter="12" v-if="UnitList.length != 0"
      ><n-col :span="24">
        <div class="textbook_List" v-for="item in UnitList" :key="item">
          <div class="textbook_list_text">{{ item.teachDate }}</div>
          <div class="textbook_list_text">{{ item.teachContent }}</div>
          <div class="textbook_list_text">
            <n-button
              type="info"
              color="#5B2202"
              class="textbookBtn"
              @click="selectMangement(3, item.id)"
            >
              進入教材
            </n-button>
          </div>
          <div class="textbook_list_text">
            <n-button
              type="info"
              color="#5B2202"
              class="textbookBtn"
              @click="selectMangement(2, item.id)"
            >
              錄影列表
            </n-button>
          </div>
          <div class="textbook_list_text">
            <n-button
              type="info"
              color="#5B2202"
              class="textbookBtn"
              @click="selectMangement(1, item.id)"
            >
              筆記列表
            </n-button>
          </div>
        </div></n-col
      ></n-row
    >
    <div v-else class="empty">
      <img src="../../assets/img/textbook/NoTextbook.png" />
    </div>
  </div>
  <n-modal
    v-model:show="showCreatTextBook"
    class="custom-card"
    preset="card"
    :style="bodyStyle"
    size="huge"
    :bordered="false"
  >
    <template #header class="creatCourse_header">創建教材 </template>
    <template #header-extra> </template>

    <n-form ref="formRef" inline :model="textbookForm">
      <n-row gutter="12"
        ><n-col :span="24">
          <label style="top: 18px; font-size: 20px"
            ><img
              src="../../assets/img/textbook/Group124.png"
              width="20"
              style="top: 2px"
            />上傳教材</label
          >
          <n-form-item path="Unit">
            <n-upload
              action="https://www.mocky.io/v2/5e4bafc63100007100d8b70f"
              :headers="{
                'naive-info': 'hello!',
              }"
              :data="{
                'naive-data': 'cool! naive!',
              }"
            >
              <n-button color="#979090">選擇文件</n-button>
            </n-upload> </n-form-item
          ><n-form-item class="center"
            ><n-button
              color="#170600"
              @click="showCreatTextBook = false"
              class="CreatTextbookBtn"
              >確認</n-button
            ></n-form-item
          ></n-col
        ></n-row
      >
    </n-form>
  </n-modal>
  <div v-if="Management == 1"><NoteManagement /></div>
  <div v-if="Management == 2"><VideoManagerne /></div>
  <div v-if="Management == 3"><EditTextbook /></div>
</template>

