import inquirer from "inquirer";
import { runCreate } from "./create";
import { runDev } from "./dev";
import { runDeploy } from "./deploy";
import { runTest } from "./test";
import { runBuild } from "./build";

const run = async () => {
  const { cmd }: { cmd: string } = await inquirer.prompt({
    type: "list",
    name: "cmd",
    message: "請選擇指令",
    choices: [
      { name: "啟動", value: "dev" },
      { name: "編譯", value: "build" },
      { name: "創建", value: "create" },
      { name: "部屬", value: "deploy" },
      // { name: "測試", value: "test" },
      // { name: "api編譯", value: "api-build" },
      // 全部部屬或單一部屬
    ],
  });

  switch (cmd) {
    case "create":
      runCreate();
      break;
    case "dev":
      runDev();
      break;
    case "build":
      runBuild();
      break;
    case "test":
      runTest();
      break;
    case "deploy":
      runDeploy();
      break;
    default:
      console.log("無此指令");
      break;
  }
};

run();
