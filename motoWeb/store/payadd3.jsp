<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>add</title>
</head>
<body>
<%
try {
//Step 1: 載入資料庫驅動程式 
    Class.forName("com.mysql.jdbc.Driver");
    try {
//Step 2: 建立連線 	
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
//Step 3: 選擇資料庫   
           sql="use motorcycle";
           con.createStatement().execute(sql);
           //從表格傳遞中文到資料庫, 必須使用getBytes("ISO-8859-1")編碼
		  
		  
		  String pay_way3=new String(request.getParameter("pway3").getBytes("ISO-8859-1"),"UTF-8");
		   String sex3=new String(request.getParameter("sex3").getBytes("ISO-8859-1"));
		   String buy_id3=request.getParameter("code3");
		    String n3=new String(request.getParameter("buyer3").getBytes("ISO-8859-1"),"UTF-8");
			String card=request.getParameter("card");String card2=request.getParameter("card2");String card3=request.getParameter("card3");String card4=request.getParameter("card4");
			String card5=request.getParameter("card5");String card6=request.getParameter("card6");
				String date2=request.getParameter("date2");
			String date1=request.getParameter("date1");
		   java.sql.Date new_date3=new java.sql.Date(System.currentTimeMillis());

//Step 4: 執行 SQL 指令	
           sql="insert `buy3` (`buyer_name`,`buyer_sex`,`buy_id`,`pay_way`,`rent_date`,`return_date`,`moto_name`,`card`,`card2`,`card3`,`card4`,`card5`,`card6`,`email`,`rent`) ";
           sql+="value ('" +n3+ "', ";
		   sql+="'"+sex3+"', ";
		   sql+="'"+buy_id3+"', ";
		   sql+="'"+pay_way3+"', ";
		   sql+="'"+date2+"', ";	
           sql+="'"+date1+"', ";		   
		   sql+="'"+session.getAttribute("suzukiname")+"', ";
		    sql+="'"+card+"', ";sql+="'"+card2+"', ";sql+="'"+card3+"', ";sql+="'"+card4+"', ";sql+="'"+card5+"', ";sql+="'"+card6+"', ";
			 sql+="'"+session.getAttribute("email")+"', ";
           sql+="'"+session.getAttribute("total3")+"')";      

           con.createStatement().execute(sql);%>
		   		   <h1>
<p align="center"><font face="新細明體">您已完成線上訂購</font></p>
<p align="center"><a href=index.jsp>回首頁</a></p></h1>
<h1>
<p align="center">
會員帳號：<%=session.getAttribute("email")%><br>
姓名：<% out.println(n3);%><br>
性別: <% out.println(sex3);%><br>
租借車款:<%=session.getAttribute("suzukiname")%><br>
租借日期:<% out.println(date2);%>-<% out.println(date1);%><br>
購買總額：<%=session.getAttribute("total3")%>元<br></p></h1>
		   <%
//Step 6: 關閉連線
           con.close();
       }
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
    }
}
catch (ClassNotFoundException err) {
   out.println("class錯誤"+err.toString());
}
%>

</body>
</html>