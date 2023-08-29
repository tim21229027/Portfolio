import { Router } from "vue-router";
import { useSettingStoreState } from "@/stores/setting";
export function setupRouterGuard(router: Router) {
  createPageLoadingGuard(router);
}

const createPageLoadingGuard = (router: Router) => {
  const settingStore = useSettingStoreState();
  router.beforeEach(async (to, from) => {
    if (to.meta.loaded) {
      return true;
    }
    // if (!settingStore.loading) {
    //   settingStore.setLoading(true);
    //   return true;
    // }
  });
  router.afterEach(async (to, from) => {
    if (!settingStore.loading) {
      return true;
    }
    return setTimeout(() => {
      settingStore.setLoading(false);
    }, settingStore.loadingSec);
  });
};
