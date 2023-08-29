import { fileURLToPath, URL } from "url";
import * as path from "path";
import { defineConfig } from "vite";
import vue from "@vitejs/plugin-vue";
import AutoImport from "unplugin-auto-import/vite";
import Components from "unplugin-vue-components/vite";
import { ElementPlusResolver } from "unplugin-vue-components/resolvers";

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
  plugins: [
    vue(),
    AutoImport({
      resolvers: [ElementPlusResolver()],
    }),
    Components({
      resolvers: [ElementPlusResolver()],
    }),
  ],
  resolve: {
    alias: {
      "@": path.resolve(__dirname, "./src"),
    },
  },
});
