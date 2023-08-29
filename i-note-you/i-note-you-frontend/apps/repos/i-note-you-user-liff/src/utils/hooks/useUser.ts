import { useUserStoreState } from "@/stores/user";
import { computed } from "vue";

export function useUserState() {
  const userStore = useUserStoreState();
  const getUserData = computed(() => userStore.userData);

  return {
    getUserData,
  };
}
