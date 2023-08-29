import { createApp } from "vue";
import App from "./App.vue";
import { router } from "@/router/index";
import { setupRouter } from "@/router/index";
import { setupRouterGuard } from "@/router/guard/index";
import { setupStore } from "@/stores";
import { getUser } from "@/service/user";
import { useUserStore } from "@/stores/user";
import "@/assets/tailwind/index.css";
import "element-plus/dist/index.css";
const userStore = useUserStore();
const bootstarap = async () => {
  const app = createApp(App);
  setupStore(app);
  setupRouter(app);
  setupRouterGuard(router);
  const userData = await getUser(import.meta.env.VITE_USERID as string);
  console.log(18, userData);
  userStore.setUserData(userData);
  app.mount("#app");
};

bootstarap();
