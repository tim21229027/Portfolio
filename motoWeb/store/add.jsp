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
		   String id=new String(request.getParameter("id").getBytes("ISO-8859-1"),"UTF-8");
		   String pwd=request.getParameter("pwd");
		   String email=new String(request.getParameter("email").getBytes("ISO-8859-1"));


//Step 4: 執行 SQL 指令	
           sql="insert `customer` (`id`,`pwd`,`number`,`birth`,`email`) ";
           sql+="value ('" +id + "', ";
		   sql+="'"+pwd+"', ";
		   sql+="'"+"', ";
		   sql+="'"+"', ";
           sql+="'"+email+"')";      

           con.createStatement().execute(sql);
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
註冊完畢: <a href=login.html>回登入畫面</a>
</body>
</html>


