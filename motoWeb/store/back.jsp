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
String left_id,left_id2,left_id3;
sql="select * from honda";
ResultSet rs=con.createStatement().executeQuery(sql);
%>
<%
request.setCharacterEncoding("UTF-8");
request.getSession(true);
sql="select * from yamaha";
ResultSet rs2=con.createStatement().executeQuery(sql);
String left2_id,left2_id2,left2_id3;

%>
<%
request.setCharacterEncoding("UTF-8");
request.getSession(true);
sql="select * from suzuki";
ResultSet rs3=con.createStatement().executeQuery(sql);
String left3_id,left3_id2,left3_id3;
%>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>後臺管理</title>
</head>
<style>
  @import url(back.css);
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
            <li><a href="honda2.jsp">Honda</a></li>
            <li><a href="yamaha2.jsp">Yamaha</a></li>
            <li><a href="suzuki2.jsp">Suzuki</a></li>

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
<%



%>
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
    <h1>後臺管理平台</h1>
  </div>
  <div class="order">
    <a href="order.jsp">
      <h4>訂單管理(點擊管理訂單)</h4>
    </a>
  </div>
  <hr>
  		  <%
 while(rs2.next()){%>
   <form name="form1" method="post" action="update4.jsp" >
  <div class="content2">
    <div class="search">
      <div class="sss">
        <div class="img">
          <img class="pro" src="home/y<%=rs2.getString(1)%>.png">
        </div>

        <div class="txt">
          <a href="moto<%=rs2.getString(8)%>.jsp">
            <h1><%=rs2.getString(2)%></h1>
          </a>

          <h4>好騎指數<img src="home/f<%=rs2.getString(3)%>.png"></h4>
          <h4>引擎形式:<%=rs2.getString(5)%></h4>
          <h4>排氣量:<%=rs2.getString(4)%></h4>
          <h4>計費方式:$<%=rs2.getString(6)%><%=rs2.getString(9)%>
          </h4>

        </div>
        <div class="pay">

          <h1>庫存量:<input class="btn" type="text" value="<%=rs2.getString(7)%>" name="change2">輛</h1>
		   <%
left2_id="1";
left2_id2="2";
left2_id3="3";
session.setAttribute("idy",left2_id);
session.setAttribute("idy2",left2_id2);
session.setAttribute("idy3",left2_id3);


 %>


            <input class="btn" type="submit" value="更改庫存">

        </div>
      </div>
    </div>
  </div>
  <hr>
    <% }
 %>
</form>
<%
 while(rs3.next()){%>
    <form name="form1" method="post" action="update5.jsp" >
  <div class="content2">
    <div class="search">
      <div class="sss">
        <div class="img">
          <img class="pro" src="home/s<%=rs3.getString(1)%>.jpg">
        </div>
        <div class="txt">
          <a href="moto<%=rs3.getString(8)%>.jsp">
            <h1><%=rs3.getString(2)%></h1>
          </a>

          <h4>好騎指數:<img src="home/f<%=rs3.getString(3)%>.png"></h4>
          <h4>引擎形式:<%=rs3.getString(5)%></h4>
          <h4>排氣量:<%=rs3.getString(4)%></h4>
          <h4>計費方式:$<%=rs3.getString(6)%><%=rs3.getString(9)%>
          </h4>

        </div>
        <div class="pay">
          <h1>庫存量:<input class="btn" type="text" value="<%=rs3.getString(7)%>" name="change3">輛</h1>
		  <h2>
		   <%
left3_id="1";
left3_id2="2";
left3_id3="3";
session.setAttribute("ids",left3_id);
session.setAttribute("ids2",left3_id2);
session.setAttribute("ids3",left3_id3);


 %>

            <input class="btn" type="submit" value="更改庫存">

        </div>
      </div>
    </div>
  </div>
  <hr>
        	  <% }
 %>
</form>
   <%
 while(rs.next()){
	 
	 %>
	  <form name="form1" method="post" action="update3.jsp" >
  <div class="content2">
    <div class="search">
      <div class="sss">
        <div class="img">
          <img class="pro" src="home/H<%=rs.getString(1)%>.png" name="motoph">
        </div>
        <div class="txt">
          <a href="moto<%=rs.getString(8)%>.jsp">
            <h1 ><label name="motoname" value="<%=rs.getString(2)%>"><%=rs.getString(2)%></label></h1>
          </a>

          <h4>好騎指數:<img src="home/f<%=rs.getString(3)%>.png"></h4>
          <h4>引擎形式:<%=rs.getString(5)%></h4>
          <h4>排氣量:<%=rs.getString(4)%></h4>
          <h4>計費方式:$<%=rs.getString(6)%><%=rs.getString(9)%>
          </h4>

        </div>
        <div class="pay"  >
          <h1>庫存量: <input class="btn" type="text" value="<%=rs.getString(7)%>" name="change">輛</h1>
		  <h2>
          
 <%
left_id=rs.getString(1);
left_id2="2";
left_id3="3";
session.setAttribute("idh",left_id);
session.setAttribute("idh2",left_id2);
session.setAttribute("idh3",left_id3);


 %>
    <input class="btn" type="submit" value="更改庫存"> 
 

        </div>
      </div>
    </div>
  </div>


   
  <hr>
    	  <% }
 %>

   </form>
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