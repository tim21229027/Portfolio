import { exec } from "child_process";
import { askSystem } from "./share/askSystem";
import { writeCache } from "./share/fs";

export const runDev = async () => {
  const system: string[] = await askSystem("啟動");
  const systemDevViteCli = system.map((x: string) => `\"pnpm -F ${x} dev \"`);
  await writeCache(system);
  const ls = exec(
    `concurrently ${systemDevViteCli.join(" ")}`,
    (error, stdout, stderr) => {
      console.log(error);
      console.log(stdout);
      console.log(stderr);
    }
  );
  ls.stdout?.on("data", (data) => {
    console.log(`stdout: ${data}`);
  });

  ls.stderr?.on("data", (data) => {
    console.error(`stderr: ${data}`);
  });
  console.log("成功啟動專案");
};
