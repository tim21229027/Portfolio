<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>
<style>
  @import url(home.css);
  @import url(headfoot.css);
  @import url('https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Lobster&display=swap');
  @import url(member.css);
</style>
<body>
<div class="root">
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
		  		 <h4> <% 

	if( session.getAttribute("email") != null ){
			out.print("<ul class='dropdown'><p>立即訂購</p><li><a href='honda.jsp'>Honda</a></li><li><a href='yamaha.jsp'>Yamaha</a></li><li><a href='suzuki.jsp'>Suzuki</a></li></ul>");
		    out.print("<ul class='dropdown'><p>會員中心</p><li><a href='member.jsp'>個人資料</a></li><li><a href='member2.jsp'>訂單查詢</a></li><li><a href='member3.jsp'>更改密碼</a></li></ul>");
			out.print("<ul class='dropdown'>" + session.getAttribute("email")+"</ul>");
			out.print("[<a href='outUser.jsp'>登出</a>]");
			
			

	}else{
	
%>
</h4>
          <a href="login.html">
		          <p>註冊/登入</p>
          </a>
		  
        </div>
      </div>
    </div>
	<% } %>
  </header>


  <div class="member-form1">
    <form class="form">
      <h1>訂單查詢</h1>
      <div class="form-group">
        <label for="exampleInputEmail1">Email:</label>
         <input type="email" class="form-control"   id="exampleInputEmail1" aria-describedby="emailHelp" required>
       </div>
      <div class="form-group">
         <label for="exampleInputPassword1">訂單編號:</label>
         <input type="text" class="form-control" id="exampleInputPassword1" required>
       </div>
       <button type="submit" class="btn btn-primary">確定</button>
     </form>
    </div>

  <div class="member-form2">
  <aside class="aside">
    <p><a href="member.jsp"><span>個人資料</span></a></p>
    <p><a href="member2.jsp"><span>訂單查詢</span></a></p>
    <p><a href="member3.jsp"><span>更改密碼</span></a></p>
  </aside>
  </div>



  <footer>
    <div class="foot">
      <h5>Copyright: RentUMoto 好騎一直騎</h5>
      <h5>服務時間:周一至周日 A.M 8:00~P.M 6:00</h5>
      <h5>電話:(03)38123456</h5>
      <h5>地址:32023 桃園市中壢區中北路2OO號</h5>
      <h5>E-mail:rentumoto@gmail.com</h5>
    </div>

  </footer>
  </div>

</body>
</html>