<script setup lang="ts">
import { defineComponent, ref } from "vue";
import { useMessage, useDialog, FormInst } from "naive-ui";
import axios from "axios";
const baseUrl = ref("https://www.noteyou.ga/");
const UnitId = ref(localStorage.getItem("SelectUnit"));
const ViedoValue = ref("123");
const UploadUrl =
  baseUrl.value + "teacher/course/unit/" + UnitId.value + "/file/upload";
const VideoUrl = baseUrl.value + "course/unit/" + UnitId.value + "/videos";

const message = useMessage();
const dialog = useDialog();
const videoName = "2001-1資訊安全";
const showCreatVideo = ref(false);
const VideoList = ref([]);
const bodyStyle = {
  width: "400px",
};
axios.get(VideoUrl).then((res) => {
  console.log(res, "影片list");
  VideoList.value = res.data;
});
</script>

<template>
  <div class="Video_Management">
    <n-row gutter="12">
      <n-col :span="11"> <span class="title">錄影管理</span></n-col
      ><n-col :span="12">
        <n-button
          type="info"
          color="#170600"
          class="creatCourse_btn"
          @click="showCreatVideo = true"
        >
          上傳錄影
        </n-button></n-col
      ></n-row
    >
    <n-row gutter="12">
      <n-col :span="24" class="course_col"
        ><div v-for="item in VideoList" v-bind:key="item">
          <div class="textboox_video">
            <div class="course_imgBoredr">
              <video class="video" controls>
                <source :src="item.url" type="video/mp4" />
              </video>
            </div>
            <div style="padding-left: 10px">{{ item.title }}</div>
            <div
              style="float: right; padding-right: 15px; padding-top: 10px"
              v-if="item.analyzeStatus == 0"
            >
              分析中
            </div>
            <div
              style="float: right; padding-right: 15px; padding-top: 10px"
              v-else
            >
              分析完成
            </div>
          </div>
        </div>
      </n-col></n-row
    >
    <n-modal
      v-model:show="showCreatVideo"
      class="custom-card"
      preset="card"
      :style="bodyStyle"
      size="huge"
      :bordered="false"
    >
      <template #header class="creatCourse_header">創建教材 </template>
      <template #header-extra> </template>

      <n-row gutter="12"
        ><n-col :span="24">
          <n-upload
            :action="UploadUrl"
            :headers="{
              'naive-info': 'hello!',
            }"
            :data="{
              'naive-data': 'cool! naive!',
            }"
          >
            <n-button color="#170600" class="selectVideo"
              >選擇影片</n-button
            > </n-upload
          ><n-button
            color="#170600"
            @click="showCreatVideo = false"
            class="CreatVideoBtn"
            >確認</n-button
          ></n-col
        ></n-row
      >
    </n-modal>
  </div>
</template>
