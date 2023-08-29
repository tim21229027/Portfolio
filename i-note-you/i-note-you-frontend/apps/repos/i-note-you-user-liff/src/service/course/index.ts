import { api } from "@/api/axios";
import * as type from "./type";

// get 課程列表
export async function getCourseList(
  userId: string
): Promise<type.CourseType[]> {
  const res = await api.get("/course/list", { userId });
  return res.data;
}

export async function getNotifyList(
  userId: string,
  courseId?: string,
  readStatus?: boolean
): Promise<type.NotifyType[]> {
  const res = await api.get(`/course/notifies/${userId}`, {
    courseId,
    readStatus,
  });
  return res.data;
}

export async function getNotifyDetail(
  userId: string,
  notifyId: string
): Promise<type.NotifyType[]> {
  const res = await api.get(`/course/notify/${notifyId}`, { userId });
  return res.data;
}

export async function joinCourse(
  userId: string,
  inviteCode: string
): Promise<boolean> {
  const res = await api.post("/course/join", { userId, inviteCode });
  return res.data;
}

export async function getCourseDetail(
  courseId: string,
  userId: string
): Promise<type.CourseDetailType> {
  const res = await api.get(`/course/${courseId}/user/${userId}`);
  return res.data;
}

export async function getCourseOutline(
  courseId: string
): Promise<type.CourseOutlineType[]> {
  const res = await api.get(`/course/${courseId}/outline/list`);
  return res.data;
}

export async function getCourseUnitMaterial(
  unitId: string
): Promise<type.CourseUnitMaterialType[]> {
  const res = await api.get(`/course/unit/${unitId}/materials`);
  return res.data;
}

export async function getCourseUnitVideo(
  unitId: string
): Promise<type.CourseUnitVideoType[]> {
  const res = await api.get(`/course/unit/${unitId}/videos`);
  return res.data;
}

export async function getCourseUnitAllKeywords(
  unitId: string
): Promise<string[]> {
  const res = await api.get(`/course/unit/${unitId}/video/keyword`);
  return res.data;
}

export async function getCourseUnitKeywordVideos(
  unitId: string,
  keyword: string
): Promise<type.NoteKeyWordsType[]> {
  const res = await api.get(`/course/unit/${unitId}/video/keyword/${keyword}`);
  return res.data;
}

export async function getCourseUnitPersonNote(
  unitId: string,
  courseMemberId: string
): Promise<type.CourseUnitNoteType> {
  const res = await api.get(`/course/unit/${unitId}/note/${courseMemberId}`);
  return res.data;
}

export async function getCourseUnitClassNote(unitId: string): Promise<string> {
  const res = await api.get(`/course/unit/${unitId}/classNote`);
  return res.data;
}

export async function postCourseUnitPersonNote(
  unitId: string,
  courseMemberId: string,
  content: string
) {
  const res = await api.post(`/course/unit/${unitId}/note/${courseMemberId}`, {
    content,
  });
  return res.data;
}

export async function getCourseUnitMeetMember(
  meetingId: string
): Promise<type.CourseMeetMemberType[]> {
  const res = await api.get(`/course/meeting/${meetingId}/members`);
  return res.data;
}

export async function getCourseUnitMeetMessageList(
  meetingId: string
): Promise<type.CourseMeetMessageType[]> {
  const res = await api.get(`/course/meeting/${meetingId}/message`);
  return res.data;
}

export async function postCourseUnitMeetMessage(
  meetingMemberId: string,
  message: string
): Promise<type.CourseMeetMessageType[]> {
  const res = await api.post(`/course/meeting/message/${meetingMemberId}`, {
    message,
  });
  return res.data;
}

export async function getCourseUnitKeywords(
  unitId: string,
  courseMemberId?: string
): Promise<type.CourseKeywordType[]> {
  const res = await api.get(`/course/unit/${unitId}/keyword`, {
    courseMemberId,
  });
  return res.data;
}

export async function postJoinMeet(
  courseId: string,
  courseMemberId: string
): Promise<type.JoinMeetType> {
  const res = await api.post(`/course/${courseId}/meeting/${courseMemberId}`);
  return res.data;
}

export async function postLeaveMeet(
  meetingId: string,
  meetingMemberId: string
): Promise<boolean> {
  const res = await api.delete(
    `/course/meeting/${meetingId}/meetingMember/${meetingMemberId}`
  );
  return res.data;
}
