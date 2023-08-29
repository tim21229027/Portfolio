<script setup lang="ts">
import { onMounted, ref } from "vue";
import axios from "axios";

const baseUrl = ref("https://www.noteyou.ga/");
const url = baseUrl.value + "user/0f478c9f-dc69-47fb-9008-636d9ffa0e05";

const userName = ref("");
const Data = ref<any>(null);
const classList = ref<any>(null);
const system = ref<any>(null);
const Img = ref(
  "https://firebasestorage.googleapis.com/v0/b/i-note-you.appspot.com/o/logo.png?alt=media&token=2917b640-3d83-4891-a3ed-1c37b8c186b1"
);
const peopleImg = ref("");
const deviceEnableOrDisable = (value: any) => {
  if (value == 1) {
    Data.value.style.color = "#fff";
    classList.value.style.background = "transparent";
    classList.value.style.color = "#909090";
    system.value.style.background = "transparent";
    system.value.style.color = "#909090";
  } else if (value == 2) {
    Data.value.style.background = "transparent";
    Data.value.style.color = "#909090";
    classList.value.style.background = "transparent";
    classList.value.style.color = "#909090";

    system.value.style.color = "#fff";
  } else if (value == 0) {
    classList.value.style.color = "#fff";
    Data.value.style.background = "transparent";
    Data.value.style.color = "#909090";
    system.value.style.background = "transparent";
    system.value.style.color = "#909090";
  }
};

axios.get(url).then((res) => {
  console.log(res.data);
  userName.value = res.data.name;
  peopleImg.value = res.data.image;
  localStorage.setItem("userData", JSON.stringify(res.data));
});
</script>
<template>
  <div class="navbar">
    <n-row>
      <n-col :span="24">
        <div class="logo">
          <img :src="Img" class="logo_img" />
        </div>
      </n-col>

      <n-col :span="24">
        <RouterLink to="/">
          <button
            class="navList"
            ref="classList"
            @click="deviceEnableOrDisable(0)"
          >
            <n-row>
              <n-col :span="4"
                ><n-icon size="36">
                  <img
                    src="../assets/img/presentation1.png"
                    style="width: 16px"
                  />
                </n-icon>
              </n-col>
              <n-col :span="20"><p>課程列表</p> </n-col>
            </n-row>
          </button></RouterLink
        ></n-col
      >
      <n-col :span="24">
        <RouterLink to="/teaching_Data">
          <button class="navList2" ref="Data" @click="deviceEnableOrDisable(1)">
            <n-row>
              <n-col :span="4"
                ><n-icon size="34">
                  <img src="../assets/img/analysis1.png" style="width: 16px" />
                </n-icon>
              </n-col>
              <n-col :span="20"><p>教學數據</p> </n-col>
            </n-row>
          </button></RouterLink
        ></n-col
      >
      <n-col :span="24">
        <RouterLink to="/system">
          <button
            class="navList2"
            ref="system"
            @click="deviceEnableOrDisable(2)"
          >
            <n-row>
              <n-col :span="4"
                ><n-icon size="34">
                  <img src="../assets/img/gear1.png" style="width: 16px" />
                </n-icon>
              </n-col>
              <n-col :span="20"><p>設定</p> </n-col>
            </n-row>
          </button></RouterLink
        ></n-col
      >
    </n-row>

    <div class="personal">
      <n-row>
        <n-col :span="10">
          <div
            style="
              margin-left: 15px;
              width: 25px;
              height: 25px;
              overflow: hidden;
              border-radius: 100%;
            "
          >
            <img :src="peopleImg" class="personal_img" style="margin: auto" />
          </div>
        </n-col>
        <n-col :span="14">
          <p class="userName">{{ userName }}</p>
        </n-col>
      </n-row>
    </div>
  </div>
</template>

<style scoped></style>
