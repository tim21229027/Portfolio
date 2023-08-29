import * as childProcess from "child_process";

export const runCreate = async () => {
  const ls = childProcess.execSync(`pnpm -F repos run create `, {
    stdio: "inherit",
  });
  console.log("創建專案成功");
};
