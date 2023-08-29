import { store } from "@/stores";
import { defineStore } from "pinia";
import {
  CourseDetailType,
  CourseUnitNoteType,
  VideoKeywordType,
} from "@/service/course/type";
interface courseState {
  selectKeywordData: VideoKeywordType;
  courseDetailData: CourseDetailType;
  useCourseNotify: boolean;
  courseUnitVal: number | null;
  courseData: {
    noteData: string;
    keywordsRank: {
      id: string;
      keyword: string;
      allRate: number;
      ownRate: number;
    }[];
  };
  meetingData: {
    member: {
      id: string;
      name: string;
      status: boolean | null;
    }[];
    keywords: {
      id: string;
      name: string;
      rate: number;
    }[];
  };
}

export const useCourseStore = defineStore({
  id: "course",
  state: (): courseState => ({
    selectKeywordData: {
      createAt: "",
      deletedAt: null,
      endTime: "",
      id: "",
      keywords: [],
      startTime: "",
      videoId: "",
      title: "",
    },
    courseDetailData: {
      id: "",
      teacherName: "",
      teacherImg: "",
      teacherPhone: "",
      teacherEmail: "",
      attendRate: 0,
      successRate: 0,
      courseCode: "",
      courseTime: "",
      courseName: "",
      coursePeopleCounts: 0,
      courseMemberId: "",
    },
    useCourseNotify: false,
    courseUnitVal: null,
    courseData: {
      noteData:
        "\t資訊：\n1.\t由各種的資料彙集而成。\n2.\t姓名、生日、電話、地址到身份證字號都是個人的資訊。\n3.\t客戶資料、金流紀錄、專利技術都是企業資訊。\n4.\t對組織而言就是一種資產，和其它重要的營運資產一樣有價值。\n\n\t網路資安何時變得重要\n1980 年代中期-網路普及：防止電腦中毒就是最早的網路資安問題。\n2000 年-社群媒體、物聯網：萬物相連，也代表萬物「可駭」，越是與網路接軌，就越是要考量網路資安。\n\n\t資訊安全：保護資訊不受各種威脅。\n1.\t硬體安全：\n防災、防竊取\n定期檢視硬體設備的狀態，隨時備份重要資料，設置備用電源或不斷電系統來降低硬體故障機率。\n2.\t軟體安全\n防駭客、防病毒\n軟體包括的範圍很廣泛，從電腦作業系統、應用程式到現在大家常看到的網站系統。\n3.\t資料安全\n防災、防病毒、防盜竊\n現在很多的資訊及資料都以數據的方式存放在不同的媒介上，如個人會將資料存放於電腦的硬碟中或USB隨身碟，因此我們對各種的資料處理，應抱著相對謹慎的態度去面對。\n\n\t資訊安全鐵三角\n(1)\t機密性：任何機密資訊未經授權都無法被看到。\n只要是不能公開的資料，就是敏感資料。例如公司正在開發的技術、個人信用卡資料、醫療紀錄。\n(2)\t完整性：任何機密資訊都無法被入侵者偷偷竄改/刪除。\n(3)\t可用性：已經取得授權可以及時且不間斷地讀取或使用資料。\n資訊安全上要確保資料的順暢性，像停電或網路斷了也是違反此原則。\n\n違反他們的事件行為都會減低資安的防護強度，有可能對個人及公司的重要資產或資料造成威脅。\n\n\tWannaCry「想哭」病毒\n是駭客利用從美國國安局洩漏的「永恒之藍」工具發展而成。\n-遭感染的電腦會有以下的症狀：\n\t檔案加密\n\t限時付贖金\n\t刪除檔案\n\n-「想哭」病毒的傳染途徑：\n\t網路芳鄰\n\t釣魚郵件\n\t惡意廣告\n\n-避免電腦感染病毒的好方法\n1. 補漏洞\n2. 重防禦\n3. 勤備份\n安裝合法防毒軟體並定期更新，及時修補電腦漏洞等。\n\n\t善用網路才是王道\n\n\t網購小心詐騙，3招自保\n第1，\t觀察網頁上沒有公司地址、客服電話，或售價明顯低於市場行情等「一頁式廣告」。\n第2，\t詳細觀察購物網站網址是否複雜或難以辨識，且沒有合法網站憑證（或使用免費憑證）。\nSSL憑證主要功用?\n有安裝SSL絕對比較安全，透過SSL加密，中途萬一資料被劫走，資料是加密的，所以無法觀看，可藉此防止駭客竊取資料。\n第3，\t同時做好電腦的基本安全防護，就像前面講到的安裝合法防毒軟體並定期更新，及時修補電腦漏洞。\n\n\t網路詐騙案例\n常見的詐騙手法：「解除ATM分期付款設定」\n詐騙集團冒用知名公司，以「工作人員操作錯誤，導致訂單變成50筆紀錄或12期分期付款設定，要求訂戶前往ATM解除分期設定或跨行存款」，要求民眾至自動提款機前按照指示操作，將錢轉進指定帳戶。\n\t詐騙(電話)相關資訊\n來電顯示開頭為「+2」、「+886」。\n電話中提到關鍵字：「解除ATM設定」、「誤刷條碼」、「誤設訂單」、「重複扣款」、「至ATM操作資料整理」。\n\t防範方式\n(1)\t下載「Whoscall App」過濾不明來電\n(2)\t撥打反詐騙專線165查詢\n",
      keywordsRank: [
        {
          id: "123",
          keyword: "資訊安全",
          allRate: 96,
          ownRate: 30,
        },
        {
          id: "123",
          keyword: "資訊安全鐵三角",
          allRate: 85,
          ownRate: 15,
        },
        {
          id: "123",
          keyword: "機密性",
          allRate: 82,
          ownRate: 22,
        },
        {
          id: "123",
          keyword: "檔案加密",
          allRate: 75,
          ownRate: 18,
        },
        {
          id: "123",
          keyword: "可用性",
          allRate: 70,
          ownRate: 12,
        },
        {
          id: "123",
          keyword: "想哭病毒",
          allRate: 60,
          ownRate: 55,
        },
        {
          id: "123",
          keyword: "惡意廣告",
          allRate: 55,
          ownRate: 25,
        },
        {
          id: "123",
          keyword: "SSL憑證",
          allRate: 48,
          ownRate: 10,
        },
        {
          id: "123",
          keyword: "釣魚郵件",
          allRate: 35,
          ownRate: 15,
        },
        {
          id: "123",
          keyword: "完整性",
          allRate: 12,
          ownRate: 2,
        },
      ],
    },
    meetingData: {
      member: [
        {
          id: "123",
          name: "王至明",
          status: true,
        },
        {
          id: "123",
          name: "陳文華",
          status: null,
        },
        {
          id: "123",
          name: "王博鈞",
          status: null,
        },
        {
          id: "123",
          name: "林皓翔",
          status: null,
        },
        {
          id: "123",
          name: "李麗寶",
          status: null,
        },
        {
          id: "123",
          name: "鄭宇欣",
          status: null,
        },
        {
          id: "123",
          name: "呂凱文",
          status: null,
        },
        {
          id: "123",
          name: "邱柏翔",
          status: null,
        },
        {
          id: "123",
          name: "楊嘉怡",
          status: null,
        },
        {
          id: "123",
          name: "黃語柔",
          status: null,
        },
      ],
      keywords: [
        {
          id: "123",
          name: "資訊安全",
          rate: 96,
        },
        {
          id: "123",
          name: "資訊安全鐵三角",
          rate: 85,
        },
        {
          id: "123",
          name: "機密性",
          rate: 82,
        },
        {
          id: "123",
          name: "檔案加密",
          rate: 75,
        },
        {
          id: "123",
          name: "可用性",
          rate: 70,
        },
        {
          id: "123",
          name: "想哭病毒",
          rate: 60,
        },
        {
          id: "123",
          name: "惡意廣告",
          rate: 55,
        },
        {
          id: "123",
          name: "SSL憑證",
          rate: 48,
        },
        {
          id: "123",
          name: "釣魚郵件",
          rate: 35,
        },
        {
          id: "123",
          name: "完整性",
          rate: 12,
        },
      ],
    },
  }),
  getters: {
    getCourseUnitValState(): number | null {
      return this.courseUnitVal;
    },
    getCourseDetailDataState(): CourseDetailType {
      return this.courseDetailData;
    },
  },
  actions: {
    setCourseUnitVal(courseUnitVal: number | null): void {
      this.courseUnitVal = courseUnitVal;
    },
    setCourseDetailData(courseDetailData: CourseDetailType): void {
      this.courseDetailData = courseDetailData;
    },
    setSelectKeywordData(selectKeywordData: VideoKeywordType): void {
      this.selectKeywordData = selectKeywordData;
    },
  },
});

export const useCourseStoreState = () => {
  return useCourseStore(store);
};
