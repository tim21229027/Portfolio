import type { App } from "vue";
import { createPinia } from "pinia";

const store = createPinia();

export const setupStore = async (app: App<Element>) => {
  app.use(store);
};

export { store };
