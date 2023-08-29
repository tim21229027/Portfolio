<script setup lang="ts">
import { RouterLink, RouterView } from "vue-router";
import { defineComponent, ref } from "vue";
import TheNavbar from "@/layout/TheNavbar.vue";
import Login from "@/views/Login.vue";

const loginOn = true;
</script>

<template>
  <div>
    <Login v-if="loginOn == false" />
    <div v-if="loginOn">
      <TheNavbar />
      <n-row>
        <n-col :span="24">
          <div class="teach">
            <n-dialog-provider>
              <n-message-provider>
                <router-view />
              </n-message-provider>
            </n-dialog-provider>
          </div>
        </n-col>
      </n-row>
    </div>
  </div>
</template>

<style>
@import "@/assets/scss/index.scss";
@import "@/assets/scss/course_Management.scss";
@import "@/assets/scss/admin_Page.scss";
@import "@/assets/scss/textbook_Management.scss";
@import "@/assets/scss/conference_Management.scss";
@import "@/assets/scss/teaching_Data.scss";
@import "@/assets/scss/note_Management.scss";
@import "@/assets/scss/system.scss";
@import "@/assets/scss/course_outline.scss";
@import "@/assets/scss/notification_management.scss";
@import "@/assets/scss/student_Management.scss";
@import "@/assets/scss/video_Management.scss";
@import "@/assets/scss/Login.scss";
</style>
