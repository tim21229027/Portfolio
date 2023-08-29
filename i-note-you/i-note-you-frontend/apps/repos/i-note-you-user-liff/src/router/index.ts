import { createRouter, createWebHistory, RouteRecordRaw } from "vue-router";
import { App } from "vue";
import { BookOutlined, SettingOutlined } from "@vicons/antd";
const routes: Array<RouteRecordRaw> = [
  {
    path: "/course",
    name: "Course",
    meta: {
      name: "所有課程",
      icon: BookOutlined,
    },
    component: () => import("@/views/course/course-list/index.vue"),
  },
  {
    path: "/setting",
    name: "Setting",
    meta: {
      name: "設定",
      icon: SettingOutlined,
    },
    component: () => import("@/views/setting/index.vue"),
  },
  {
    path: "/",
    name: "home",
    redirect: "/course",
  },
  {
    path: "/course/:courseId",
    name: "CourseDetail",
    meta: {
      name: "課程詳細",
    },
    component: () => import("@/views/course/course-detail/index.vue"),
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
