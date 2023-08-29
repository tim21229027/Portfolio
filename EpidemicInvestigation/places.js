import { initializeApp } from "firebase/app";
import { 
    getDocs,
    getFirestore,
    collection,
    doc,
    getDoc,
    setDoc,
    deleteDoc,
    updateDoc,
    where,
    query,
 

} from "firebase/firestore";

import { firebaseConfig } from "../util/dbConfig";

const firebaseApp= initializeApp(firebaseConfig);
const dbFirestore =getFirestore(firebaseApp);


async function getCount(docName) {
    var counter = 0;
    const docRef = doc(dbFirestore, "count", docName);
    const docSnap = await getDoc(docRef);
    if (docSnap.exists()) {
      counter = docSnap.data().count;
      await setDoc(doc(dbFirestore, "count", docName), {
        count: (docSnap.data().count += 1),
      });
    }
    return counter;
  }

//12.新增場所
export async function addPlace(data) {
    var addStatus = false;
    var createTime = new Date();
    await getCount("placeCount").then((count) => {setDoc(doc(dbFirestore, "places", count.toString()), {
      pId:count, //document.getElementById("123").text 場所ID
      type: data.type,//場所類型
      name: data.name,//場所名稱
      identifyId: data.identifyId,//場所負責人身分證
      cellphone: data.cellphone,//場所負責人手機
      address: data.address,//場所地址
      taxId: data.taxId,//統編
      contactAddress: data.contactAddress,//聯絡地址
      telephone: data.telephone,//場所電話
      carId: data.carId,//車牌/編號
      status: "審核中",//狀態
      create_time:createTime.toISOString(),//創建時間
      uId:data.uId,//UserID
    });
    addStatus=true;
});

    return addStatus ;
}

//1.抓取場所所有資料
export async function getPlaceList(){
    var placelist=[];
    const col =collection(dbFirestore,"places");
    const querySnapshot = await getDocs(col);
    querySnapshot.forEach((doc)=>  {
        placelist.push(doc.data());
    });
    return placelist;
}
//2.抓取我的場所所有資料
export async function getMyPlaceList(data){
    var myplacelist=[];
    const mycol = query(collection(dbFirestore, "places"), where("uId", "==", data.toString()));
    const querySnapshot = await getDocs(mycol);
    querySnapshot.forEach((mydoc)=>  {
        myplacelist.push(mydoc.data());
    });
    return myplacelist;
}

//3.4抓取某筆場所詳細資料
export async function getPlace(id){
    var place="";
    const docRef =doc(dbFirestore,"places",id.toString());
    const docSnap = await getDoc(docRef);
    if(docSnap.exists()){
        place=docSnap.data();
    }else{
        console.log("No such document!")
    }
    return place;
}
//用名子查詢某筆場所
export async function searchPlaceList(data){
    var myplacelist=[];
    const mycol = query(collection(dbFirestore, "places"), where("name", "==", data.toString()));
    const querySnapshot = await getDocs(mycol);
    querySnapshot.forEach((mydoc)=>  {
        myplacelist.push(mydoc.data());
    });
    return myplacelist;
}

//13.更新場所資料
export async function updatePlace(data) {
    var Status = false;
    const place=await getPlace(data.pId);
    var updateTime = new Date();
    if(place !="")
    {
     await updateDoc(doc(dbFirestore, "places", data.pId.toString()), {
        pId: data.pId, //document.getElementById("123").text 場所ID
        type: data.type,//場所類型
        name: data.name,//場所名稱
        identifyId: data.identifyId,//場所負責人身分證
        cellphone: data.cellphone,//場所負責人手機
        address: data.address,//場所地址
        taxId: data.taxId,//統編
        contactAddress: data.contactAddress,//聯絡地址
        telephone: data.telephone,//場所電話
        carId: data.carId,//車牌/編號
        uId: data.uId,//UserID
        status: "審核通過",//狀態
        update_time:updateTime.toISOString(),//更新時間
     });
     Status=true;
    }
    return Status ;

}
//13.刪除場所
export async function deletePlace (id) {
    var status = false;
    const place = await getPlace (id) ;
    if (place !="") {
    deleteDoc(doc(dbFirestore,"places",id.toString()));
    status = true;
}
    return status;
}
//14.新增場所出入口
export async function addEntrances(data) {
    var addStatus = false;
    var createTime = new Date();
    await getCount("entrancesPlace").then((count) =>{setDoc(doc(dbFirestore, "entrances", count.toString()), {
      eId: count, //document.getElementById("123").text 出入口ID
      pId: data.pId,
      hwId:data.hwId,
      note:data.note,
      eName:data.eName,
      create_time:createTime.toISOString(),//創建時間
    });
    addStatus=true;
});
    return addStatus ;
}
//#5.6抓取所有場所出入口資料

export async function getEntrancesList(data){
    var OneEntrancesList=[];
    const mycol = query(collection(dbFirestore, "entrances"),where("pId", "==",data));
    const querySnapshot = await getDocs(mycol);
    querySnapshot.forEach((mydoc)=>  {
        OneEntrancesList.push(mydoc.data());
    });
    return OneEntrancesList;
}
//x.抓取某筆出入口資料
export async function getEntrance(id){
    var place="";
    const docRef =doc(dbFirestore,"entrances",id.toString());
    const docSnap = await getDoc(docRef);
    if(docSnap.exists()){
        place=docSnap.data();
    }else{
        console.log("No such document!")
    }
    return place;
}
//15.更新出入口
export async function updateEntrances(data) {
    var Status = false;
    const place=await getEntrance(data.eId);

    if(place !="")
    {
     await updateDoc(doc(dbFirestore, "entrances", data.eId.toString()), {
        eId: data.eId, //document.getElementById("123").text 場所ID
        pId: data.pId,
        hwId:data.hwId,
        note:data.note,
        eName:data.eName,
     });
     Status=true;
    }
    return Status ;

}

//16.刪除場所出入口
export async function deleteEntrances (id) {
    var status = false;
    const entrances = await getEntrance (id) ;
    if (entrances !="") {
    deleteDoc(doc(dbFirestore,"entrances",id.toString()));
    status = true;
}
    return status;
}

//17.新增附屬場所
export async function addAttachPlace(data) {
    var addStatus = false;
    var createTime = new Date();
    await getCount("attachPlaceCount").then((count) =>{ setDoc(doc(dbFirestore, "attachPlaces", count.toString()), {
      apId: count, //document.getElementById("123").text 場所ID
      pId: data.pId,
      apType: data.apType,//場所類型
      apName: data.apName,//場所名稱
      apIdentifyId: data.apIdentifyId,//場所負責人身分證
      apCellphone: data.apCellphone,//場所負責人手機
      apAddress: data.apAddress,//場所地址
      apTaxId: data.apTaxId,//統編
      apContactAddress: data.apContactAddress,//聯絡地址
      apTelephone: data.apTelephone,//場所電話
      apCarId: data.apCarId,//車牌/編號
      apStatus: "審核中",//狀態
      create_time:createTime.toISOString(),//創建時間
      apUid:data.apUid,//UserID
    });
    addStatus=true;
});
    return addStatus ;
}

//7.抓取附屬場所所有資料
export async function getAttachPlaceList(pId){
    var Entranceslist=[];
    const col =query(collection(dbFirestore,"attachPlaces"),where("pId","==",pId));
    const querySnapshot = await getDocs(col);
    querySnapshot.forEach((doc)=>  {
        Entranceslist.push(doc.data());
    });
    return Entranceslist;
}

//#8.9抓取某筆附屬場所詳細資料
export async function getAttachPlace(id){
    var Entrances="";
    const docRef =doc(dbFirestore,"attachPlaces",id.toString());
    const docSnap = await getDoc(docRef);
    if(docSnap.exists()){
        Entrances=docSnap.data();
    }else{
        console.log("No such document!")
    }
    return Entrances;
}
//18.更新附屬場所資料
export async function updateAttachPlace(data) {
    var Status = false;
    const attachplace=await getAttachPlace(data.apId);
    var updateTime = new Date();
    if(attachplace !="")
    {
     await updateDoc(doc(dbFirestore, "attachPlaces", data.apId.toString()), {
        apId: data.apId, //document.getElementById("123").text 場所ID
        pId: data.pId,
        apType: data.apType,//場所類型
        apName: data.apName,//場所名稱
        apIdentifyId: data.apIdentifyId,//場所負責人身分證
        apCellphone: data.apCellphone,//場所負責人手機
        apAddress: data.apAddress,//場所地址
        apTaxId: data.apTaxId,//統編
        apContactAddress: data.apContactAddress,//聯絡地址
        apTelephone: data.apTelephone,//場所電話
        apCarId: data.apCarId,//車牌/編號
        apStatus: "審核中",//狀態
        apUid:data.apUid,//UserID
        update_time:updateTime.toISOString(),//更新時間
     });
     Status=true;
    }
    return Status ;

}

//19.刪除附屬場所
export async function deleteAttachPlace (id) {
    var status = false;
    const attachPlaces = await getAttachPlace (id) ;
    if (attachPlaces !="") {
    deleteDoc(doc(dbFirestore,"attachPlaces",id.toString()));
    status = true;
}
    return status;
}
//20.新增附屬場所出入口
export async function addAttachEntrances(data) {
    var addStatus = false;
    var createTime = new Date();
    await getCount("attachEntranceCount").then((count) =>{setDoc(doc(dbFirestore, "attachEntrances", count.toString()), {
      apeId: count, //document.getElementById("123").text 出入口ID
      apId: data.apId,
      apehwId:data.apehwId,
      apeNote:data.apeNote,
      apeName:data.apeName,
      create_time:createTime.toISOString(),//創建時間
    });
    addStatus=true;
});
    return addStatus ;
}

//#10.11抓取所有附屬場所出入口
export async function getAttachEntrancesList(data){
    var attachEntrancesList=[];
    const mycol = query(collection(dbFirestore, "attachEntrances"),where("apId", "==",data));
    const querySnapshot = await getDocs(mycol);
    querySnapshot.forEach((mydoc)=>  {
        attachEntrancesList.push(mydoc.data());
    });
    return attachEntrancesList;
}

//x.抓取某筆附屬場所出入口資料
export async function getAttachEntrance(id){
    var place="";
    const docRef =doc(dbFirestore,"attachEntrances",id.toString());
    const docSnap = await getDoc(docRef);
    if(docSnap.exists()){
        place=docSnap.data();
    }else{
        console.log("No such document!")
    }
    return place;
}
//21.更新附屬場所出入口
export async function updateAttachEntrance(data) {
    var Status = false;
    const place=await getAttachEntrance(data.apeId);

    if(place !="")
    {
     await updateDoc(doc(dbFirestore, "attachEntrances", data.apeId.toString()), {
        apeId: data.apeId, //document.getElementById("123").text 場所ID
        apId: data.apId,
        apehwId:data.apehwId,
        apeNote:data.apeNote,
        apeName:data.apeName,
     });
     Status=true;
    }
    return Status ;

}
//22.刪除場所出入口
export async function deletedateAttachEntrance (id) {
    var status = false;
    const entrances = await getAttachEntrance (id) ;
    if (entrances !="") {
    deleteDoc(doc(dbFirestore,"attachEntrances",id.toString()));
    status = true;
}
    return status;
}

//23.新增住民
export async function addResident(data) {
    var addStatus = false;
    var createTime = new Date();
    setDoc(doc(dbFirestore, "resident", data.uId.toString()), {
      uId:data.uId,//UserID
      create_time:createTime.toISOString(),
      displayName: data.displayName,//LINE名稱
      pictureUrl: data.pictureUrl,//圖片
      privacy:data.privacy,//隱私
      chineseName:data.chineseName,//中文名稱
      originalName: data.originalName,//原文名稱
      nhiCard:data.nhiCard,//健保卡
      rpIdentifyId:data.rpIdentifyId,//在台關係人身分證
      relation: data.relation,//關係人關係
      identifyId: data.identifyId,//場所負責人身分證
      cellphone: data.cellphone,//場所負責人手機
      address: data.address,//戶籍地址
      residentialAddress: data.residentialAddress,//居住地址
      telephone: data.telephone,//場所電話
      workPlace: data.workPlace,//就職就學地點
      email: data.email,//Email
      
   
    });
    addStatus=true;

    return addStatus ;
}
//24.新增住民
export async function getResident(uid){
    var place="";
    const docRef =doc(dbFirestore,"resident",uid.toString());
    const docSnap = await getDoc(docRef);
    if(docSnap.exists()){
        place=docSnap.data();
    }else{
        console.log("No such document!")
    }
    return place;
}

//25.更新場所資料
export async function updateResident(data) {
    var Status = false;
    const place=await getResident(data.uId);
    var updateTime = new Date();
    if(place !="")
    {
     await updateDoc(doc(dbFirestore, "resident", data.uId.toString()), {
        uId:data.uId,//UserID
        update_time:updateTime.toISOString(),//更新時間
        displayName: data.displayName,//LINE名稱
        pictureUrl: data.pictureUrl,//圖片
        privacy:data.privacy,//隱私
        chineseName:data.chineseName,//中文名稱
        originalName: data.originalName,//原文名稱
        nhiCard:data.nhiCard,//健保卡
        rpIdentifyId:data.rpIdentifyId,//在台關係人身分證
        relation: data.relation,//關係人關係
        identifyId: data.identifyId,//場所負責人身分證
        cellphone: data.cellphone,//場所負責人手機
        address: data.address,//戶籍地址
        residentialAddress: data.residentialAddress,//居住地址
        telephone: data.telephone,//場所電話
        workPlace: data.workPlace,//就職就學地點
        email: data.email,//Email
        
     });
     Status=true;
    }
    return Status ;

}
//26.請求hwId列表
export async function getEntrancesHwList(data){
    var OneEntrancesList=[];
    const mycol = query(collection(dbFirestore, "entrances"),where("hwId", "==",data));
    const querySnapshot = await getDocs(mycol);
    querySnapshot.forEach((mydoc)=>  {
        OneEntrancesList.push(mydoc.data());
    });
    return OneEntrancesList;
}
//27.請求附屬hwId列表
export async function getAttachEntrancesHwList(data){
    var OneEntrancesList=[];
    const mycol = query(collection(dbFirestore, "attachEntrances"),where("apehwId", "==",data));
    const querySnapshot = await getDocs(mycol);
    querySnapshot.forEach((mydoc)=>  {
        OneEntrancesList.push(mydoc.data());
    });
    return OneEntrancesList;
}