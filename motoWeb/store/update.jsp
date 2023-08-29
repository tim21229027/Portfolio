<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
if(session.getAttribute("email") != null ){
    if(request.getParameter("pwd")!=null){
    sql = "UPDATE `customer` SET `pwd`='"+request.getParameter("new_pwd")+"' WHERE `email`='"+session.getAttribute("email")+"'";
	con.createStatement().execute(sql);	
	con.close();//結束資料庫連結
	response.sendRedirect("member3.jsp") ;
	}
	else{
	  con.close();//結束資料庫連結	
	  out.print("更新失敗!! 請填寫完整，<a href='member3.jsp'>按此</a>回會員頁面!!");
	}
}
else{
	con.close();//結束資料庫連結
%>
<h1><font color="red">您尚未登入，請登入！</font></h1>
<%
}
%>
