import * as fs from "fs";
import { exec } from "child_process";
import { askSystem } from "./share/askSystem";

export const runBuild = async () => {
  const system: string[] = await askSystem("編譯");
  const systemDevViteCli = system.map((x: string) => `\"pnpm -F ${x} build \"`);
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
  console.log("編譯專案中..");
};
