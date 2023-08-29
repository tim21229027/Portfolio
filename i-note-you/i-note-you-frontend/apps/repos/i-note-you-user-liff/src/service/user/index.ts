import { api } from "@/api/axios";
import * as type from "./type";

// get 系統設定
export async function getUser(userId: string): Promise<type.UserType> {
  const res = await api.get(`/user/${userId}`);
  return res.data;
}

// // get 地區選項
// export async function getAvailableRegion(): Promise<any> {
//   const res = await api.get("/systemConfig/getAvailableRegion");
//   return res.data;
// }

// // getLiffId
// export async function getLiffId() {
//   const res = await api.get("/line/liffId");
//   return res.data;
// }
