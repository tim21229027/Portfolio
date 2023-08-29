<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%

    sql = "DELETE FROM `buy2` WHERE `buyer_id`="+request.getParameter("delete2");
	con.createStatement().execute(sql);	
	con.close();//結束資料庫連結
	response.sendRedirect("order.jsp") ;
	
%>
