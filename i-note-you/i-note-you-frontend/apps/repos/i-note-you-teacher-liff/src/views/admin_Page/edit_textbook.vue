<script setup lang="ts">
import { defineComponent, ref } from "vue";
import { useMessage, useDialog, FormInst } from "naive-ui";
import axios from "axios";
const baseUrl = ref("https://www.noteyou.ga/");
const showCreatTextBook = ref(false);
const size = ref("medium");
const bodyStyle = {
  width: "600px",
};
const UnitId = ref(localStorage.getItem("SelectUnit"));
const materialsList = ref([]);
const materialsUrl =
  baseUrl.value + "course/unit/" + UnitId.value + "/materials";
const UploadUrl =
  baseUrl.value + "teacher/course/unit/" + UnitId.value + "/file/upload";
axios.get(materialsUrl).then((res) => {
  console.log(res, "教材list");
  materialsList.value = res.data;
});
</script>
<template>
  <div class="textbook_Management">
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
      >
    </n-row>
    <div
      style="margin-top: 80px; margin-left: 2%"
      v-for="item in materialsList"
      :key="item"
    >
      <p>教材:{{ item.name }}</p>
      <iframe
        :src="item.url"
        width="90%"
        height="700px"
        frameborder="0"
      ></iframe>
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
                :action="UploadUrl"
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
  </div>
</template>