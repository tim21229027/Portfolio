<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%

if(session.getAttribute("idy") == "1" ){
 sql = "UPDATE `yamaha` SET `stock`='"+request.getParameter("change2")+"' WHERE `yamaha_id`='"+session.getAttribute("idy")+"'";
	con.createStatement().execute(sql);
	con.close();
	response.sendRedirect("back.jsp") ;
}
else if(session.getAttribute("idy2") == "2" ){
	
	 sql = "UPDATE `yamaha` SET `stock`='"+request.getParameter("change2")+"' WHERE `yamaha_id`='"+session.getAttribute("idy2")+"'";
	con.createStatement().execute(sql);
	con.close();
	response.sendRedirect("back.jsp") ;
}
else if(session.getAttribute("idy3") == "3" ){
	
	 sql = "UPDATE `yamaha` SET `stock`='"+request.getParameter("change2")+"' WHERE `yamaha_id`='"+session.getAttribute("idy3")+"'";
	con.createStatement().execute(sql);
	con.close();
	response.sendRedirect("back.jsp") ;
}
else{
	  con.close();//結束資料庫連結	
	  out.print("更新失敗!! 請填寫完整，<a href='member.jsp'>按此</a>回會員頁面!!");
	}

%>