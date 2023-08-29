import { store } from "@/stores";
import { defineStore } from "pinia";
import { UserType } from "@/service/user/type";

interface userState {
  userData: UserType;
}

export const useUserStore = defineStore({
  id: "user",
  state: (): userState => ({
    userData: {
      id: "",
      createAt: "",
      deletedAt: null,
      name: "",
      email: "",
      password: "",
      phone: "",
      image: "",
      backgroundImage: "",
    },
  }),
  getters: {
    getUserData(): UserType {
      return this.userData;
    },
  },
  actions: {
    setUserData(userData: UserType): void {
      this.userData = userData;
    },
  },
});

export const useUserStoreState = () => {
  return useUserStore(store);
};
