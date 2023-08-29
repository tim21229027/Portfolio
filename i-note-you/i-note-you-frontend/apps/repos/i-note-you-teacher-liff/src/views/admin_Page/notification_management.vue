
<script setup lang="ts">
import { defineComponent, ref, onMounted } from "vue";
import { DataTableColumns } from "naive-ui";
import AddNotification from "./add_notification.vue";

const userData = ref(JSON.parse(localStorage.getItem("userData")));
const peopleImg = ref(userData.value.image);

const page = ref<any>(1);
const page_count = ref<any>(null);
const page_list = 2;
const pagination = { pageSize: 10 };
const MessageData = ref<any>([]);
const message_Day = new Date();
const data = [
  {
    key: 1,
    name: "作業",
    message: "第一章作業",
    message_Day: message_Day.toLocaleString(),
  },
  {
    key: 2,
    name: "作業",
    message: "第二章作業",
    message_Day: message_Day.toLocaleString(),
  },
  {
    key: 3,
    name: "作業",
    message: "第三章作業",
    message_Day: message_Day.toLocaleString(),
  },
  {
    key: 4,
    name: "作業",
    message: "第四章作業",
    message_Day: message_Day.toLocaleString(),
  },
  {
    key: 4,
    name: "作業",
    message: "第五章作業",
    message_Day: message_Day.toLocaleString(),
  },
  {
    key: 4,
    name: "作業",
    message: "第六章作業",
    message_Day: message_Day.toLocaleString(),
  },
  {
    key: 4,
    name: "作業",
    message: "第七章作業",
    message_Day: message_Day.toLocaleString(),
  },
  {
    key: 4,
    name: "作業",
    message: "第八章作業",
    message_Day: message_Day.toLocaleString(),
  },
  {
    key: 4,
    name: "作業",
    message: "第九章作業",
    message_Day: message_Day.toLocaleString(),
  },
  {
    key: 4,
    name: "作業",
    message: "第十章作業",
    message_Day: message_Day.toLocaleString(),
  },
  {
    key: 4,
    name: "作業",
    message: "第十一章作業",
    message_Day: message_Day.toLocaleString(),
  },
  {
    key: 4,
    name: "作業",
    message: "第十二章作業",
    message_Day: message_Day.toLocaleString(),
  },
  {
    key: 4,
    name: "作業",
    message: "第十三章作業",
    message_Day: message_Day.toLocaleString(),
  },
];

var CreatNewNotification = ref(0);

const CreatBtn = (value: any) => {
  CreatNewNotification.value = value;
};

function increment() {
  for (let i = 1; i <= data.length; i++) {
    page_count.value = Math.ceil(data.length / 6);

    MessageData.value = data.slice(page.value * 6 - 6, page.value * 6);
  }
}

onMounted(() => {
  increment();
});
</script>

<template>
  <div class="notification_management">
    <n-row gutter="12"
      ><n-col :span="11"> <div class="textbook_header">通知管理</div> </n-col
      ><n-col :span="12">
        <n-button
          type="info"
          color="#170600"
          class="creatCourse_btn"
          @click="CreatBtn(1)"
        >
          撰寫通知
        </n-button></n-col
      ></n-row
    >
    <n-row gutter="12"
      ><n-col :span="23">
        <div class="message_page" v-if="CreatNewNotification == false">
          <div class="message_page_header">
            <div class="message_page_header_left">您送出的通知</div>
            <div class="message_page_header_right">
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
          <div class="message_page_body">
            <div v-for="item in MessageData" :key="item">
              <div class="message_info">
                <n-row gutter="12"
                  ><n-col :span="7">
                    <div style="display: flex; align-items: center">
                      <div
                        style="
                          border-radius: 100%;
                          overflow: hidden;
                          height: 50px;
                          width: 50px;
                          display: flex;
                          align-items: center;
                        "
                      >
                        <img :src="peopleImg" style="width: 100%" />
                      </div>

                      <p style="margin-left: 30px; font-size: 20px">
                        {{ item.name }}
                      </p>
                    </div>
                  </n-col>
                  <n-col :span="12" style="display: flex; align-items: center">
                    <div
                      style="
                        overflow: hidden;
                        text-overflow: ellipsis;
                        display: -webkit-box;
                        -webkit-line-clamp: 2;
                        -webkit-box-orient: vertical;
                        color: #b2b2b2;
                      "
                    >
                      {{ item.message }}
                    </div></n-col
                  >
                  <n-col
                    :span="5"
                    style="
                      display: flex;
                      align-items: end;
                      justify-content: flex-end;
                    "
                  >
                    <div>{{ item.message_Day }}</div></n-col
                  >
                </n-row>
              </div>
            </div>
          </div>
        </div>
        <div v-if="CreatNewNotification == 1">
          <AddNotification /></div></n-col
    ></n-row>
  </div>
</template>