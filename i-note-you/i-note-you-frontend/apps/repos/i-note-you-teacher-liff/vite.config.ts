import { fileURLToPath, URL } from "url";
import * as path from "path";
import { defineConfig } from "vite";
import vue from "@vitejs/plugin-vue";

import * as fs from "fs";
// https://vitejs.dev/config/
let serverConfig;
if (process.env.NODE_ENV === "development") {
  serverConfig = {
    port: 8080,
    // https: {
    //   key: fs.readFileSync("../../key.pem"),
    //   cert: fs.readFileSync("../../cert.pem"),
    // },
  };
}
export default defineConfig({
  server: serverConfig,
  plugins: [vue()],
  resolve: {
    alias: {
      "@": path.resolve(__dirname, "./src"),
    },
  },
});
