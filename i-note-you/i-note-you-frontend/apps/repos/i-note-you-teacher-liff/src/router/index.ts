import { createRouter, createWebHistory, RouteRecordRaw } from "vue-router";
import { App } from "vue";
const routes: Array<RouteRecordRaw> = [
  {
    path: "/",
    name: "home",
    component: () => import("../views/course_Management.vue"),
  },
  {
    path: "/teaching_Data",
    name: "teaching_Data",
    component: () => import("../views/teaching_Data.vue"),
  },
  {
    path: "/system",
    name: "system",
    component: () => import("../views/system.vue"),
  },
  {
    path: "/admin_Page",
    name: "admin_Page",
    component: () => import("../views/admin_Page.vue"),
  },
  {
    path: "/test",
    name: "test",
    component: () => import("../views/test.vue"),
  },





];

export const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes,
  scrollBehavior(to, from, savedPosition) {
    // ...
    return {
      top: 0,
    };
  },
});

export const setupRouter = (app: App) => {
  app.use(router);
};
