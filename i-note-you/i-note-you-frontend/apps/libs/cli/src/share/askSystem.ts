import inquirer from "inquirer";
import * as fs from "fs";
import { readCache } from "./fs";

type ChoiseType = {
  name: string;
  value: string;
  checked: boolean;
};

export const askSystem = async (
  type: string,
  isDefaultChoiceChecked = true
) => {
  const systems = fs.readdirSync("../../repos");

  const cache = await readCache();

  const cacheChoices = cache.split(",");

  const choices: ChoiseType[] = [];
  systems.forEach((x: string) => {
    if (x.includes(".")) {
      return;
    }

    const cacheSystem = cacheChoices.find((c) => c === x);

    choices.push({
      name: x,
      value: x,
      checked: cacheSystem ? true : false,
    });
  });
  const { system } = await inquirer.prompt({
    name: "system",
    message: `請選擇要${type}的系統`,
    type: "checkbox",
    choices,
  });
  return system;
};
