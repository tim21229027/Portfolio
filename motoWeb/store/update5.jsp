<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%

if(session.getAttribute("ids") == "1" ){
 sql = "UPDATE `suzuki` SET `stock`='"+request.getParameter("change3")+"' WHERE `suzuki_id`='"+session.getAttribute("ids")+"'";
	con.createStatement().execute(sql);
	con.close();
	response.sendRedirect("back.jsp") ;
}
else if(session.getAttribute("ids2") == "2" ){
	
	 sql = "UPDATE `suzuki` SET `stock`='"+request.getParameter("change3")+"' WHERE `suzuki_id`='"+session.getAttribute("ids2")+"'";
	con.createStatement().execute(sql);
	con.close();
	response.sendRedirect("back.jsp") ;
}
else if(session.getAttribute("ids3") == "3" ){
	
	 sql = "UPDATE `suzuki` SET `stock`='"+request.getParameter("change3")+"' WHERE `suzuki_id`='"+session.getAttribute("ids3")+"'";
	con.createStatement().execute(sql);
	con.close();
	response.sendRedirect("back.jsp") ;
}
else{
	  con.close();//結束資料庫連結	
	  out.print("更新失敗!! 請填寫完整，<a href='member.jsp'>按此</a>回會員頁面!!");
	}

%>