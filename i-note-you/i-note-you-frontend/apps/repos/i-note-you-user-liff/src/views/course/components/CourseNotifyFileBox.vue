<script setup lang="ts">
import { NotifyFile } from "@/service/course/type";

interface Props {
  fileData: NotifyFile;
}
const props = defineProps<Props>();
const handleDownloadFile = async (url: string) => {
  console.log(url);
  window.open(url, "_blank"); // 新开窗口下载
};
</script>
<template>
  <div
    class="mb-[1vh] rounded-[15px] border-[#BCBCBC] border-[0.5px] flex cursor-pointer"
    @click="handleDownloadFile(fileData.file)"
  >
    <div
      class="bg-[#170600] text-[#F9F9F9] rounded-[15px_0px_0px_15px] w-[15.36%] flex justify-center items-center font-['Robot-Bold'] text-2xl"
    >
      {{
        fileData.file
          .split("/")
          .slice(fileData.file.split("/").length - 1)[0]
          .split(".")[1]
          .toLocaleUpperCase()
      }}
    </div>
    <div class="text-base p-[.5vh_1vw]">
      <div class="mb-[.5vh]">
        {{
          fileData.file.split("/").slice(fileData.file.split("/").length - 1)[0]
        }}
      </div>
      <div class="text-[#868686] mb-[1vh]"></div>
      <div class="flex justify-end text-[#707070]">100 MB</div>
    </div>
  </div>
</template>

<style scoped></style>
