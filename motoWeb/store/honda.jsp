<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
int left;
String leftString;
sql="select * from honda";
ResultSet rs=con.createStatement().executeQuery(sql);
 session.setAttribute("honda_Id",request.getParameter("honda_Id"));

%>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Honda</title>
</head>
<style>
  @import url(kind.css);
  @import url(headfoot.css);
  @import url('https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Lobster&display=swap');
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
            <span class="icon"><i class="fa fa-search">
                <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
              </i></span>
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
          <a href="login.html">
		          <p>註冊/登入</p>
          </a>
		  
        </div>
      </div>
    </div>
	<% } %>
	</form>

  </header>


  <div class="content1">
    <div class="yamaha">
      <img class="yayaya" src="home/honda.png">
    </div>
    <div class="title">
      <a href="index.jsp">
        <h2>首頁:</h2>
      </a>
      <h2>Honda</h2>
    </div>
  </div>
  <hr>
  <form method="post" action="pay.jsp">  
    <%
 while(rs.next()){%>
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
          <h1>庫存量:<%=rs.getString(7)%>輛</h1>
		  <h2>
<%

leftString = rs.getString(7);
left = Integer.parseInt(leftString);
if( left == 0){
out.println("<b>&emsp;&emsp;&emsp;無庫存</b>");}
else{out.print("&emsp;<input type='radio' name='honda_Id' value='");%><%=rs.getString(1)%><%out.print("'><b>訂購選取</b>");}%>
</h2>
       

        </div>
      </div>
    </div>
  </div>
  <hr>
    	  <% }
 %>
 
 <center><input class='btn' type='submit' value='立即訂車' name="motos"></center>
 </form>
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