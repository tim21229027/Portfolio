<script setup lang="ts">
import { ref } from "vue";

const props = defineProps({
  submit: { type: Boolean, required: true },
});

const Message_title = ref("");
const Message = ref("");
</script>

<template>
  <div class="add_notification">
    <div class="notification_title">
      標題
      <n-input placeholder=" " v-model:value="Message_title" size="large">
      </n-input>
    </div>
    <div class="notification_title">
      內容
      <n-input v-model:value="Message" type="textarea" />
    </div>
    <div class="notification_title">上傳檔案</div>
    <div class="notification_background">
      <n-upload
        action="https://www.mocky.io/v2/5e4bafc63100007100d8b70f"
        :default-file-list="fileList"
        list-type="image"
        :create-thumbnail-url="createThumbnailUrl"
        :max="6"
      >
        <n-button
          type="info"
          color="#170600"
          class="add_message_file"
          @click="handleClick"
        >
          選擇檔案
        </n-button>
      </n-upload>
    </div>
    <n-button type="info" color="#170600" class="add_notification_OK">
      發送
    </n-button>
  </div>
</template>
<style scoped>
.n-upload /deep/ .n-upload-trigger {
  position: relative;
  top: -85px;
  left: 70px;
}
</style>