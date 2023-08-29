<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%

if(session.getAttribute("idh") == "1" ){
 sql = "UPDATE `honda` SET `stock`='"+request.getParameter("change")+"' WHERE `honda_id`='"+session.getAttribute("idh")+"'";
	con.createStatement().execute(sql);
	con.close();
	response.sendRedirect("back.jsp") ;
}
else if(session.getAttribute("idh2") == "2" ){
	
	 sql = "UPDATE `honda` SET `stock`='"+request.getParameter("change")+"' WHERE `honda_id`='"+session.getAttribute("idh2")+"'";
	con.createStatement().execute(sql);
	con.close();
	response.sendRedirect("back.jsp") ;
}
else if(session.getAttribute("idh3") == "3" ){
	
	 sql = "UPDATE `honda` SET `stock`='"+request.getParameter("change")+"' WHERE `honda_id`='"+session.getAttribute("idh3")+"'";
	con.createStatement().execute(sql);
	con.close();
	response.sendRedirect("back.jsp") ;
}
else{
	  con.close();//結束資料庫連結	
	  out.print("更新失敗!! 請填寫完整，<a href='member.jsp'>按此</a>回會員頁面!!");
	}

%>