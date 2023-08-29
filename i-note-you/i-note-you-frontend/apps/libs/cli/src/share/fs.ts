import { promises as fs } from "fs";

export const writeCache = async (
  choices: string[] | string,
  path = "cache.txt"
) => {
  try {
    await fs.writeFile(path, choices.toString());
  } catch (err) {
    console.error(err);
  }
};

export const readCache = async () => {
  try {
    const cache = await fs.readFile("cache.txt", "utf-8");
    console.log("read successfully");
    return cache;
  } catch (err) {
    writeCache(["jd-admin,gobo-liff"]);
    return "";
  }
};
