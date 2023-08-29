<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/?serverTimezone=UTC";
Connection con=DriverManager.getConnection(url,"root","1234");
String sql="use motorcycle";
con.createStatement().execute(sql);
%>
<%
request.setCharacterEncoding("UTF-8");
request.getSession(true);
sql="select * from buy";
ResultSet rs=con.createStatement().executeQuery(sql);
%>
<%
request.setCharacterEncoding("UTF-8");
request.getSession(true);
sql="select * from buy2";
ResultSet rs2=con.createStatement().executeQuery(sql);


%>
<%
request.setCharacterEncoding("UTF-8");
request.getSession(true);
sql="select * from buy3";
ResultSet rs3=con.createStatement().executeQuery(sql);


%>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>訂單管理</title>
</head>
<style>
  @import url(order.css);
  @import url(headfoot.css);
</style>

<body>
  <header>
    <div>
      <div class="option">
        <div>
          <a href="index.jsp"> <img class="logo" src="home/logo.png"></a>
        </div>
        <div class="box">
          <div class="seen">

            <input type="search" id="search" placeholder="Search">
          </div>
        </div>
        <div class="drop">

          <ul class="dropdown">
            <p> 商品分類</p>
            <li><a href="honda.jsp">Honda</a></li>
            <li><a href="yamaha.jsp">Yamaha</a></li>
            <li><a href="suzuki.jsp">Suzuki</a></li>


          </ul>
          <ul class="dropdown">
            <p>客服中心</p>
            <li><a href="qa.jsp">常見Q&A</a></li>

          </ul>
          <ul class="dropdown">
            <p>關於我們</p>
            <li><a href="about.jsp">我們的小故事</a></li>
          </ul>
		  <form name="form1" method="post" action="outUser.jsp" >
		  		 <h4> <% 
           String abc=String.valueOf(session.getAttribute("email"));
		   if((abc).equals("tt33252637@gmail.com")){
		out.print("<ul class='dropdown'><p>管理者介面</p><li><a href='back.jsp'>後臺管理</a></li><li><a href='order.jsp'>訂單管理</a></li></ul>");

			out.print("<ul class='dropdown'>" + session.getAttribute("email")+"</ul>");
			
			%>
			<input class='combtn' type='submit' value='登出'>			
<%
	}
	else if( session.getAttribute("email") != null ){
		out.print("<ul class='dropdown'><p>立即訂購</p><li><a href='honda.jsp'>Honda</a></li><li><a href='yamaha.jsp'>Yamaha</a></li><li><a href='suzuki.jsp'>Suzuki</a></li></ul>");
		    out.print("<ul class='dropdown'><p>會員中心</p><li><a href='member.jsp'>個人資料</a></li><li><a href='member2.jsp'>訂單查詢</a></li><li><a href='member3.jsp'>更改密碼</a></li></ul>");
			out.print("<ul class='dropdown'>" + session.getAttribute("email")+"</ul>");
			
		%>
			<input class='combtn' type='submit' value='登出'>
		
	
	<%
}	
else{
	
%>
</h4>
          <a href="login.html">
		          <p>註冊/登入</p>
          </a>
		  
        </div>
      </div>
    </div>
	<% } %>
	</form>
  </header>

  <div class="title">
    <h1>訂單管理</h1>
  </div>
  <div class="change">
    <a href="back.jsp">
      <h4>後臺管理平台(點擊進入後台)</h4>
    </a>
  </div>
  <hr>
   
    		  <%
 while(rs.next()){%>
  <div class="content">
    <div class="contain">
      <div class="ordertrack">
	   <form name="information" method="Post" action="delete.jsp">
        <div>
          <h2>訂購型號:</h2>
          <h3><%=rs.getString(9)%></h3>
          <h2>訂購者:</h2>
          <h3><%=rs.getString(2)%></h3>
		  <h2>訂單編號:</h2>
		  <h3>H<%=rs.getString(1)%></h3>
        </div>
        <div>
          <h2>E-mail:</h2>
          <h3><%=rs.getString(11)%></h3>
          <h2>身分證字號:</h2>
          <h3><%=rs.getString(4)%></h3>
        </div>
        <div>
          <h2>付款方式:</h2>
          <h3><%=rs.getString(5)%></h3>
          <h2>卡號/有效期限:</h2>
          <h3><%=rs.getString(10)%>-<%=rs.getString(12)%>-<%=rs.getString(13)%>-<%=rs.getString(14)%><br>有效期限:<%=rs.getString(15)%>背面後三碼:<%=rs.getString(16)%></h3>
        </div>
        <div>
          <h2>開始日期/結束日期:</h2>
          <h3><%=rs.getString(6)%>-<%=rs.getString(8)%></h3>
          <h2>總金額:$</h2>
          <h3><%=rs.getString(7)%></h3>
        </div>
      </div>
      <div class="cancel">
        <h1>刪除訂單</h1><input type="submit" class="nobtn" value="<%=rs.getString(1)%>" name="delete">
		</form>
      </div>
    </div>
  </div>
  <hr>
    <% }
 %>
 
    		  <%
 while(rs2.next()){%>
  <div class="content">
    <div class="contain">
      <div class="ordertrack">
	   <form name="information" method="Post" action="delete2.jsp">
        <div>
          <h2>訂購型號:</h2>
          <h3><%=rs2.getString(9)%></h3>
          <h2>訂購者:</h2>
          <h3><%=rs2.getString(2)%></h3>
		  <h2>訂單編號:</h2>
		  <h3>Y<%=rs2.getString(1)%></h3>
        </div>
        <div>
          <h2>E-mail:</h2>
          <h3><%=rs2.getString(11)%></h3>
          <h2>身分證字號:</h2>
          <h3><%=rs2.getString(4)%></h3>
        </div>
        <div>
          <h2>付款方式:</h2>
          <h3><%=rs2.getString(5)%></h3>
          <h2>卡號/有效期限:</h2>
          <h3><%=rs2.getString(10)%>-<%=rs2.getString(12)%>-<%=rs2.getString(13)%>-<%=rs2.getString(14)%><br>有效期限:<%=rs2.getString(15)%>背面後三碼:<%=rs2.getString(16)%></h3>
        </div>
        <div>
          <h2>開始日期/結束日期:</h2>
          <h3><%=rs2.getString(6)%>-<%=rs2.getString(8)%></h3>
          <h2>總金額:$</h2>
          <h3><%=rs2.getString(7)%></h3>
        </div>
      </div>
      <div class="cancel">
        <h1>刪除訂單</h1><input type="submit" class="nobtn" value="<%=rs2.getString(1)%>" name="delete2">
		</form>
      </div>
    </div>
  </div>
  <hr>
    <% }
 %>
     		  <%
 while(rs3.next()){%>
  <div class="content">
    <div class="contain">
      <div class="ordertrack">
	   <form name="information" method="Post" action="delete3.jsp">
        <div>
          <h2>訂購型號:</h2>
          <h3><%=rs3.getString(9)%></h3>
          <h2>訂購者:</h2>
          <h3><%=rs3.getString(2)%></h3>
		  <h2>訂單編號:</h2>
		  <h3>S<%=rs3.getString(1)%></h3>
        </div>
        <div>
          <h2>E-mail:</h2>
          <h3><%=rs3.getString(11)%></h3>
          <h2>身分證字號:</h2>
          <h3><%=rs3.getString(4)%></h3>
        </div>
        <div>
          <h2>付款方式:</h2>
          <h3><%=rs3.getString(5)%></h3>
          <h2>卡號/有效期限:</h2>
          <h3><%=rs3.getString(10)%>-<%=rs3.getString(12)%>-<%=rs3.getString(13)%>-<%=rs3.getString(14)%><br>有效期限:<%=rs3.getString(15)%>背面後三碼:<%=rs3.getString(16)%></h3>
        </div>
        <div>
          <h2>開始日期/結束日期:</h2>
          <h3><%=rs3.getString(6)%>-<%=rs3.getString(8)%></h3>
          <h2>總金額:$</h2>
          <h3><%=rs3.getString(7)%></h3>
        </div>
      </div>
      <div class="cancel">
         <h1>刪除訂單</h1><input type="submit" class="nobtn" value="<%=rs3.getString(1)%>" name="delete3">
		</form>
      </div>
    </div>
  </div>
  <hr>
    <% }
 %>
 
  <hr>
  
  <footer>
    <div class="foot">
      <h5>Copyright: RentUMoto 好騎一直騎</h5>
      <h5>服務時間:周一至周日 A.M 8:00~P.M 6:00</h5>
      <h5>電話:(03)38123456</h5>
      <h5>地址:32023 桃園市中壢區中北路2OO號</h5>
      <h5>E-mail:rentumoto@gmail.com</h5>
    </div>

  </footer>
</body>

</html>