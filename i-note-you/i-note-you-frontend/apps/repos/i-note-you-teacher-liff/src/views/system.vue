<script setup lang="ts">
import { ref } from "vue";
import { useMessage, useDialog, FormInst } from "naive-ui";
import axios from "axios";
const baseUrl = ref("https://www.noteyou.ga/");
const url = baseUrl.value + "user/0f478c9f-dc69-47fb-9008-636d9ffa0e05";
const formRef = ref<FormInst | null>(null);
const formValue = ref({
  user: {
    name: "",
    Email: "",
    phone: "",
    pwd: "",
    photo: "",
  },
});
axios.get(url).then((res) => {
  formValue.value.user.name = res.data.name;
  formValue.value.user.photo = res.data.image;
  formValue.value.user.Email = res.data.email;
  formValue.value.user.pwd = res.data.password;
  formValue.value.user.phone = res.data.phone;
});
</script>
<template>
  <div class="teaching_Data">
    <div class="course_hearder">
      <n-row gutter="12"
        ><n-col :span="23"> <div class="textbook_header">設定</div></n-col>
      </n-row>
    </div>
    <div class="system_body">
      <div class="system_personal">
        <n-form
          ref="formRef"
          :label-width="80"
          :model="formValue"
          :rules="rules"
        >
          <n-row gutter="12">
            <n-col :span="8">
              <div class="system_personal_left">
                <div class="system_personal_img">
                  <img style="width: 100%" :src="formValue.user.photo" />
                </div>

                <div
                  style="
                    padding-left: 50px;
                    padding-right: 50px;
                    padding-top: 50px;
                  "
                >
                  <n-form-item>
                    <label path="user.name" style="color: #fff; font-size: 20px"
                      >姓名</label
                    >
                    <n-input
                      v-model:value="formValue.user.name"
                      type="text"
                      placeholder=""
                  /></n-form-item>
                </div>
              </div>
            </n-col>
            <n-col :span="16">
              <div class="system_personal_right" style="z-index: 1">
                <div style="width: 70%">
                  <n-form-item>
                    <label style="font-size: 14px">帳號信箱</label>
                    <n-input
                      v-model:value="formValue.user.Email"
                      type="text"
                      placeholder=""
                    />
                  </n-form-item>
                  <n-form-item>
                    <label style="font-size: 14px">密碼</label>
                    <n-input
                      v-model:value="formValue.user.pwd"
                      type="text"
                      placeholder=""
                    />
                  </n-form-item>
                  <n-form-item>
                    <label style="font-size: 14px">手機號碼</label>
                    <n-input
                      v-model:value="formValue.user.phone"
                      type="text"
                      placeholder=""
                    />
                  </n-form-item>
                </div>
              </div>
              <div style="z-index: 0; text-align: center">
                <n-button type="info" color="#170600" class="save_btn">
                  儲存
                </n-button>
              </div>
            </n-col>
          </n-row>
        </n-form>
      </div>
    </div>
  </div>
</template>

<style scoped>
</style>
