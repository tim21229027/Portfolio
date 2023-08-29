<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>常見Q&A</title>
</head>
<style>
  @import url("qa.css");
  @import url("headfoot.css");
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
  <div class="bg">
    <img class="img" src="home/homemoto3.jpg">
  </div>


  <div class="title">
    <h1>常見問題Q&A</h1>
  </div>
  <div class="content">
    <div class="qa">
      <div class="ee">
        <button class="accordion">Q:實體店面位置是?</button>
        <div class="panel">
          <h1>A:中原大學 </h1>
        </div><button class="accordion">Q:租車前需要注意甚麼嗎?</button>
        <div class="panel">
          <h1>A:訂好車後，領車時請攜帶駕照來領車哦!</h1>
        </div><button class="accordion">Q:租車後需要把油加滿再還車嗎?</button>
        <div class="panel">
          <h1>A:沒錯哦!領車時，店員會將該車須加甚麼油先做告知哦!</h1>
        </div><button class="accordion">Q:車子有損壞該怎麼辦?</button>
        <div class="panel">
          <h1>A:如在出租後發生損壞，會通知保險公司進行賠償評估哦!</h1>
        </div><button class="accordion">Q:車子故障怎麼辦?</button>
        <div class="panel">
          <h1>A:在車子出租前，好騎一直騎會先測試車況給顧客看，顧客也可以拍照保護自己的權益哦!</h1>
        </div><button class="accordion">Q:中途車子有故障怎麼辦?</button>
        <div class="panel">
          <h1>A:如出借中途有發生非人為的故障的話，可以撥打我們的緊急電話:03-38123456</h1>
        </div>
        <button class="accordion">Q:車子真的太優質了，想再租怎麼辦?</button>
        <div class="panel">
          <h1>A:有借有還再借不難，隨時都可以利用我們的線上網站進行預約訂車哦!</h1>
        </div>

        <button class="accordion">Q:Q&A沒有可以回答我的問題的答案，該怎麼辦呢?</button>
        <div class="panel">
          <h1>
            A:可以撥打我們的電話:03-38123456，或者是在下方用E-mail告知我們哦!
          </h1>
        </div>
      </div>
    </div>
  </div>


  <div class="content2">
    <div class="mail">
      <h1>聯絡我們</h1>
    </div>
    <div class="eee">
      <div class="address">
        <h2>E-mail:</h2><input class="eme" type="text">
      </div>

      <div class="comment">
        <h2>您的意見:</h2>
        <div class="comment1">
          <input class="comm" type="text">
        </div>
      </div>
      <div class="jjj">
        <div class="commenbutton">
          <input class="cancel" type="button" value="取消">
          <a href="mailto:rentumoto@gmail.com"> <input class="combtn" type="button" value="寄信"></a></div>
      </div>
    </div>
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
  <script>
    var acc = document.getElementsByClassName("accordion");
    var i;

    for (i = 0; i < acc.length; i++) {
      acc[i].addEventListener("click", function () {
        this.classList.toggle("active");
        var
          panel = this.nextElementSibling;
        if (panel.style.display === "block") {
          panel.style.display = "none";
        } else {
          panel.style.display = "block";
        }
      });
    }
  </script>
</body>

</html>