<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>

<%
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/?serverTimezone=UTC";
Connection con=DriverManager.getConnection(url,"root","1234");
String sql="use motorcycle";
con.createStatement().execute(sql);
%>
<h1>
<%


if(request.getParameter("email") !=null && request.getParameter("pwd") != null){
     sql = "SELECT * FROM `customer` WHERE `email`='" +request.getParameter("email") + "'  AND `pwd`='" + request.getParameter("pwd") + "'"  ; 
    ResultSet paperrs =con.createStatement().executeQuery(sql);
    if(paperrs.next()){            
        session.setAttribute("email",request.getParameter("email"));
        response.sendRedirect("index.jsp") ;

    }
    else
        out.println("密碼帳號不符") ;
}


%>
 <a href=login.html>返回登入畫面</a>