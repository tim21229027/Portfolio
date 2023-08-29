export type CourseType = {
  id: string;
  teacherName: string;
  teacherImg: string;
  teacherPhone: string;
  teacherEmail: string;
  attendRate: number;
  successRate: number;
  courseCode: string;
  courseTime: string;
  courseName: string;
  coursePeopleCounts: number;
  courseMemberId: string;
};

export type NotifyType = {
  id: string;
  createAt: string;
  deletedAt: null | string;
  title: string;
  image: string;
  content: string;
  courseId: string;
  notifyRead: boolean;
  notifyReads: {
    id: string;
    createAt: string;
    deletedAt: null | string;
    readStatus: boolean;
    courseNotifyId: string;
    courseMemberId: string;
  };
};

export type NotifyDetailType = {
  id: string;
  createAt: string;
  deletedAt: null | string;
  title: string;
  image: string;
  content: string;
  courseId: string;
  notifyFiles: NotifyFile[];
  teacherName: string;
  teacherImg: string;
  teacherPhone: string;
  teacherEmail: string;
  attendRate: number;
  successRate: number;
  courseCode: string;
  courseTime: string;
  courseName: string;
  coursePeopleCounts: number;
  readstatus: boolean;
};

export type NotifyFile = {
  id: string;
  createAt: string;
  deletedAt: null | string;
  file: string;
};

export type CourseDetailType = {
  attendRate: number;
  courseCode: string;
  courseMemberId: string;
  courseName: string;
  coursePeopleCounts: number;
  courseTime: string;
  id: string;
  successRate: number;
  teacherEmail: string;
  teacherImg: string;
  teacherName: string;
  teacherPhone: string;
};

export type CourseOutlineType = {
  id: string;
  createAt: string;
  deletedAt: null | string;
  courseId: string;
  week: string;
  name: string;
  teachDate: string;
  teachContent: string;
};

export type CourseUnitMaterialType = {
  id: string;
  createAt: string | null;
  deletedAt: null | string;
  unitId: string;
  name: string;
  url: string;
};

export type CourseUnitVideoType = {
  id: string;
  createAt: string;
  deletedAt: null | string;
  title: string;
  url: string;
  analyzeStatus: VideoAnalyzeStatus;
  unitId: string;
};

export type CourseUnitNoteType = {
  id: string;
  createAt: string;
  deletedAt: null | string;
  unitId: string;
  courseMemberId: string;
  content: string;
  similarity: number | null;
};

export type CourseMeetMemberType = {
  id: string;
  uid: number;
  host: boolean;
  courseMemberId: string;
  image: string;
  name: string;
};

export type CourseMeetMessageType = {
  id: string;
  createAt: string;
  deletedAt: null | string;
  message: string;
  meetingMemberId: string;
  image: string;
  name: string;
};

export enum VideoAnalyzeStatus {
  Analyzing = 0,
  Analyzed = 1,
}

export type CourseKeywordType = {
  keyword: string;
  allRate: number;
  ownRate: number;
};

export type JoinMeetType = {
  uid: number;
  host: boolean;
  meetingId: string;
  courseMemberId: string;
  deletedAt: null | string;
  id: string;
  createAt: string;
  RtcAppId: string;
  RtcToken: string;
};

export type VideoKeywordType = {
  createAt: string;
  deletedAt: null | string;
  endTime: string;
  id: string;
  keywords: string[];
  title: string;
  startTime: string;
  videoId: string;
};

export type NoteKeyWordsType = {
  analyzeStatus: VideoAnalyzeStatus;
  createAt: string;
  deletedAt: null | string;
  id: string;
  title: string;
  unitId: string;
  url: string;
  videoKeywords: VideoKeywordType[];
};
