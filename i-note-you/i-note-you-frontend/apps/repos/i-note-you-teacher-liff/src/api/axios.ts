/* eslint-disable prettier/prettier */
import { useSettingStoreState } from "@/stores/setting";

import axios from "axios";
import { useMessage } from "naive-ui";
import { endpoint } from "./endpoint";
const message = useMessage();
const settingStore = useSettingStoreState();

const requestList: number[] = settingStore.requestList;
const requestFinish = () => {
  requestList.pop();
  if (requestList.length === 0) {
    settingStore.setLoading(false);
  }
};
//設定cross跨域 並設定訪問許可權 允許跨域攜帶cookie資訊
axios.defaults.withCredentials = false;
// 設置請求超時時間
// axios.defaults.timeout = 60000;
// 預設環境
axios.defaults.baseURL = endpoint as string;
//request 攔截器
axios.interceptors.request.use(
  (config) => {
    requestList.push(0);
    // 配置請求表頭
    config.headers = {
      "Content-Type": "application/json",
    };

    return new Promise(function (resolve, reject) {
      settingStore.setLoading(true);
      resolve(config);
    });
  },
  (error) => {
    return Promise.reject(error);
  }
);
//http response 攔截器
axios.interceptors.response.use(
  (response) => {
    requestFinish();
    if (response.data.message) {
      return response;
    }
    return response;
  },
  (error) => {
    requestFinish();
    const { response } = error;
    if (response) {
      // 請求發出，但是不在2xx的範圍
      message.error(`${error.response.data.message}`);

      return Promise.reject(response.data);
    } else {
      message.error("網路連線異常, 請稍後再試");
    }
  }
);

class Api {
  // eslint-disable-next-line @typescript-eslint/no-empty-function
  constructor() {}

  get(url: string, params?: unknown) {
    return axios({
      method: "get",
      url,
      params,
    }) as any;
  }
  put(url: string, data: unknown) {
    return axios({
      method: "put",
      url,
      data,
    });
  }
  patch(url: string, data: unknown) {
    return axios({
      method: "patch",
      url,
      data,
    });
  }

  post(url: string, data: unknown) {
    return axios({
      method: "post",
      url,
      data,
    });
  }

  delete(url: string, data: unknown) {
    return axios({
      method: "delete",
      url,
      data,
    });
  }
}

export const api = new Api();
