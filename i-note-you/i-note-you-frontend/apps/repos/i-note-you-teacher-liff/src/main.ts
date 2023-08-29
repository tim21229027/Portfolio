import { createApp } from "vue";
import App from "./App.vue";
import { router } from "@/router/index";
import { setupRouter } from "@/router/index";
import { setupRouterGuard } from "@/router/guard/index";
import { setupStore } from "@/stores";
import naive from 'naive-ui';


const bootstarap = async () => {
  const app = createApp(App);
  setupStore(app);
  setupRouter(app);
  setupRouterGuard(router);
  app.use(naive);

  app.mount("#app");
};

bootstarap();
