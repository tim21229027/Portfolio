<script lang="ts">
import { CSSProperties, defineComponent, ref } from "vue";

export default defineComponent({
  setup() {
    const LoginIn = ref(2);
    return {
      LoginIn: ref(2),
      account: "",
      reg_account: "",
      pwd: "",
      reg_pwd: "",
      reg_pwd2: "",
      name: "",

      railStyle: ({
        focused,
        checked,
      }: {
        focused: boolean;
        checked: boolean;
      }) => {
        const style: CSSProperties = {};
        if (checked) {
          style.background = "#170600";
          if (focused) {
            style.boxShadow = "0 0 0 2px #170600";
          }
        } else {
          style.background = "#170600";
          if (focused) {
            style.boxShadow = "0 0 0 2px #170600";
          }
        }
        return style;
      },
    };
  },
  methods: {
    handleUpdateValue(value: number) {
      this.LoginIn = value;
    },
  },
});
</script>
<template>
  <div>
    <n-row style="background-color: #170600; height: 100vh">
      <n-col :span="12"
        ><div class="Login_note_line"></div>
        <div class="Login_logo">
          <img
            src="https://firebasestorage.googleapis.com/v0/b/i-note-you.appspot.com/o/logo.png?alt=media&token=2917b640-3d83-4891-a3ed-1c37b8c186b1"
            style="width: 22%"
          />
        </div>
        <div class="Login_Title">I Note YOU</div>
        <div class="Login_sec_Title">最懂你的筆記Trend</div></n-col
      ><n-col :span="12" style="background-color: #fff"
        ><div class="Login_right_Title">I Note YOU</div>
        <div style="padding: 5% 10% 0 10%">
          <n-row>
            <n-col :span="12"
              ><div class="SignIn_title">
                <div v-if="LoginIn == 2">Sign In</div>
                <div v-if="LoginIn == 1">Sign Up</div>
                <hr align="left" class="SignIn_hr" /></div></n-col
            ><n-col :span="12">
              <div style="float: right; margin-top: 20px">
                <n-switch
                  :rail-style="railStyle"
                  size="large"
                  :checked-value="1"
                  :unchecked-value="2"
                  @update:value="handleUpdateValue"
                >
                  <template #checked> 註冊 </template>
                  <template #unchecked>登入 </template>
                </n-switch>
              </div></n-col
            ></n-row
          >
          <div v-if="LoginIn == 2">
            <div style="margin-top: 3%">
              <n-form-item label="信箱帳號" path="account" size="large">
                <n-input
                  v-model:value="account"
                  type="text"
                  style="width: 100%"
                />
              </n-form-item>
            </div>

            <div style="margin-top: 3%">
              <n-form-item label="密碼" path="pwd" size="large">
                <n-input v-model:value="pwd" type="text" style="width: 100%" />
              </n-form-item>
            </div>
            <n-button type="info" color="#170600" class="LoginBtn">
              登入
            </n-button>
          </div>
          <div v-if="LoginIn == 1">
            <div style="margin-top: 3%">
              <n-form-item label="信箱帳號" path="reg_account" size="large">
                <n-input
                  v-model:value="reg_account"
                  type="text"
                  style="width: 100%"
                />
              </n-form-item>
            </div>
            <div style="margin-top: 3%">
              <n-form-item label="姓名" path="name" size="large">
                <n-input v-model:value="name" type="text" style="width: 100%" />
              </n-form-item>
            </div>
            <div style="margin-top: 3%">
              <n-form-item label="密碼" path="reg_pwd" size="large">
                <n-input
                  v-model:value="reg_pwd"
                  type="text"
                  style="width: 100%"
                />
              </n-form-item>
            </div>
            <div style="margin-top: 3%">
              <n-form-item label="確認密碼" path="reg_pwd2" size="large">
                <n-input
                  v-model:value="reg_pwd2"
                  type="text"
                  style="width: 100%"
                />
              </n-form-item>
            </div>
            <n-button type="info" color="#170600" class="LoginBtn">
              註冊
            </n-button>
          </div>
        </div>
      </n-col></n-row
    >
  </div>
</template>