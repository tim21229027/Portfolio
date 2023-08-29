<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>About Us</title>
  <link rel="stylesheet" href="https://cdnjs.cloudfare.com/ajax/libs/font-awesome/4.2.0/css/font-awesoome.min.css">
</head>
<style>
  @import url(home.css);
  @import url(headfoot.css);
  @import url(about.css);
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

   <div class="about">
     <content class="aboutus">
       <img src="home/aboutmoto5.png" style="width: 100%; height: 100%;">
     </content>
   </div>
   <div class="about-text">
     <h3 class="glowIn">
       我們的期末專案主題是『出租檔車』<br>身為大學生的我們，通常通勤的交通工具不外乎就是騎速克達或搭乘大眾運輸<br>平時很少接觸到打檔車因為買檔車容易養車難，除了後續開銷外，還要記著自己的保養里程，里程到了還要找時間去車行報到<br>於是我們將設計一個檔車出租平台，將保養等事交給我們，讓我們來完成你們的夢想!
       進入本網站首頁，大型豐富的視覺圖像說明我們的<br>重機檔車類型與服務特色；而上方介面分別為商品分類、客服中心、關於我們、會員來呈現，希望透過簡潔大方的視覺設計<br>強化圖像視覺感受，立刻抓住您的眼晴!
       這次我們會選擇做檔車租借是因為現在檔車的騎乘人數逐漸增多<br>也越來越多人嘗試著在接觸檔車，不論是街車或是仿賽。因此我們認為這會是一個好的趨勢<br>所以在品質與專業服務上會比較注重!
     </h3>

     <script>
       "use strict";
       let glowInTexts = document.querySelectorAll(".glowIn");
       glowInTexts.forEach(glowInText => {
         let letters = glowInText.textContent.split("");
         glowInText.textContent = "";
         letters.forEach((letter, i) => {
           let span = document.createElement("span");
           span.textContent = letter;
           span.style.animationDelay = `${i * 0.05}s`;
           glowInText.append(span);
         });
       });
     </script>

   </div>
   <hr>

   <div class="wrapper">
     <div class="section-header">
       <h2>Our Team Member</h2>
     </div>
     <div class="main">
      <div class="team-member">
        <img src="home/chih.img.jpg" alt="">
        <h1>王膺智</h1>
        <h3>前端設計</h3>
        <span>
             <a href="https://www.facebook.com/profile.php?id=100000571521377 " target=" _blank"><i class="fa fa-facebook"></i></a>
             <a href="https://www.instagram.com/yingchih0221/" target="_blank"><i class="fa fa-instagram"></i></a>
             <a href="mailto:allen1010244@gmail.com" target="_blank"><i class="fa fa-envelope"></i></a>
        </span>  
      </div>

      <div class="team-member">
        <img src="home/wei01.jpg" alt="">
        <h1>龔冠瑋</h1>
        <h3>前端設計</h3>
            <span>
              <a href="https://www.facebook.com/profile.php?id=100003480587507" target="_blank"><i class="fa fa-facebook"></i></a>
              <a href="https://www.instagram.com/wei_1019_/" target="_blank"><i class="fa fa-instagram"></i></a>
              <a href="mailto:zxc02514zxc59@gmail.com"><i class="fa fa-envelope"></i></a>
            </span>
      </div>


      <div class="team-member">
        <img src="home/231103.jpg" alt="">
        <h1>曾竑竣</h1>
        <h3>後端製作</h3>
            <span>
              <a href="https://www.facebook.com/profile.php?id=100003388571062" target="_blank"><i class="fa fa-facebook"></i></a>
              <a href="https://www.instagram.com/arad_tseng1230/" target="_blank"><i class="fa fa-instagram"></i></a>
              <a href="mailto:arad20001230@gmail.com" target="_blank"><i class="fa fa-envelope"></i></a>
            </span>
      </div>

      <div class="team-member">
        <img src="home/S__27598852_1.jpg" alt="">
        <h1>楊子瑨</h1>
        <h3>後端製作</h3>
            <span>
              <a href="https://www.facebook.com/profile.php?id=100005336644427" target="_blank"><i class="fa fa-facebook"></i></a>
              <a href="https://www.instagram.com/y_zijin/" target="_blank"><i class="fa fa-instagram"></i></a>
              <a href="mailto:tt33252637@gmail.com"><i class="fa fa-envelope"></i></a>
            </span>
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
   
</body>
</html>