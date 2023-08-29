<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
  <title>RentUMoto好騎一直騎</title>
</head>
<style>
  @import url(home.css);
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
            <li><a href="about.jsp">我們的小故事</a><li>
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
<%

if(application.getAttribute("count")==null){
application.setAttribute("count", "1");
}else{
//將得到的物件轉換成 字串 形式
String strCount = application.getAttribute("count").toString();
//將字串轉換成 整形
int intCount = Integer.parseInt(strCount);
//讓其進行自加1運算
if (session.isNew())
{
intCount++;
}
//再將自加後的變數設定給application
application.setAttribute("count", Integer.toString(intCount));
}
%>

  <div class="people">
    <h4>訪客人數:<%=application.getAttribute("count") %></h4>
  </div>
  <div class="ccc">
    <div class="slider">
      <div class="slides">

        <input type="radio" name="radio-btn" id="radio1">
        <input type="radio" name="radio-btn" id="radio2">
        <input type="radio" name="radio-btn" id="radio3">
        <input type="radio" name="radio-btn" id="radio4">

        <div class="slide first">
          <img src="home/sale.png" alt="" style="width: 100%; height: 100%;">
        </div>
        <div class="slide">
          <img src="home/sale3.jpg" alt="" style="width: 100%; height: 100%;">
        </div>
        <div class="slide">
          <img src="home/sale1.png" alt="" style="width: 100%; height: 100%;">
        </div>
        <div class="slide">
          <img src="home/sale2.png" alt="" style="width: 100%; height: 100%;">
        </div>
        <div class="navigation-auto">
          <div class="auto-btn1"></div>
          <div class="auto-btn2"></div>
          <div class="auto-btn3"></div>
          <div class="auto-btn4"></div>
        </div>

        <div class="navigation-manual">
          <label for="radio1" class="manual-btn"></label>
          <label for="radio2" class="manual-btn"></label>
          <label for="radio3" class="manual-btn"></label>
          <label for="radio4" class="manual-btn"></label>
        </div>

      </div>
    </div>
  </div>
  <div class="hot">
    <img class="fire" src="home/fire.gif"><img class="fire" src="home/fire.gif"><img class="fire"
      src="home/fire.gif"><img class="fire" src="home/fire.gif">
    <h1>熱門商品</h1><img class="fire" src="home/fire.gif"><img class="fire" src="home/fire.gif"><img class="fire"
      src="home/fire.gif"><img class="fire" src="home/fire.gif">
  </div>
  <div class="homecontent">
    <div class="contentline1">
      <div class="l11">

        <a href="moto8.jsp" target="_blank"><img class="line1" src="home/homemoto14.png"></a>
        <h1>Yamaha MT03</h1>
        <h1>好騎評價:<img src="home/fire-wheel (3).png"><img src="home/fire-wheel (3).png"><img
            src="home/fire-wheel (3).png"><img src="home/fire-wheel (3).png"><img src="home/fire-wheel (3).png"></h1>
        <h1>排氣量:321c.c</h1>
        <h1>租金:$300/20% Off</h1>

        <a href="moto8.jsp"><input type="button" class="but1" value="查看商品"></a>
      </div>
      <div class="l12">
        <a href="moto4.jsp" target="_blank"><img class="line1" src="home/homemoto10.png"></a>
        <h1>Honda CB650R</h1>
        <h1>好騎評價:<img src="home/fire-wheel (3).png"><img src="home/fire-wheel (3).png"><img
            src="home/fire-wheel (3).png"><img src="home/fire-wheel (3).png"></h1>
        <h1>排氣量:649c.c</h1>
        <h1>租金:$600/20% Off</h1>
        <a href="moto4.jsp"><input type="button" class="but1" value="查看商品"></a>
      </div>
      <div class="l13">
        <a href="moto3.jsp" target="_blank"><img class="line1" src="home/homemoto9.jpg"></a>
        <h1>Suzuki GSX-S750</h1>
        <h1>好騎評價:<img src="home/fire-wheel (3).png"><img src="home/fire-wheel (3).png"><img
            src="home/fire-wheel (3).png"><img src="home/fire-wheel (3).png"><img src="home/fire-wheel (3).png">
        </h1>
        <h1>排氣量:749c.c</h1>
        <h1>租金:$600/20% Off </h1>
        <a href="moto3.jsp"><input type="button" class="but1" value="查看商品"></a>
      </div>
    </div>
  </div>
  <div class="hot">
    <img class="fire" src="home/fire.gif"><img class="fire" src="home/fire.gif"><img class="fire"
      src="home/fire.gif"><img class="fire" src="home/fire.gif"><img class="fire" src="home/fire.gif">
    <img class="fire" src="home/fire.gif"><img class="fire" src="home/fire.gif"><img class="fire" src="home/fire.gif">
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
  <script type="text/javascript">
    var counter = 1;
    setInterval(function () {
      document.getElementById('radio' + counter).checked = true;
      counter++;
      if (counter > 4) {
        counter = 1;
      }
    }, 2500);
  </script>
</body>


</html>