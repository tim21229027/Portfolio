<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Yamaha YZF-R3</title>
  <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<style>
  @import url(headfoot.css);
  @import url(moto1.css);
  @import url(star.css);
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

  <div class="content">
    <div class="kind">
      <h1>Yamaha YZF-R3</h1>
    </div>
    <div class="imgtxt">
      <div class="slideshow-container">
        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
        <div class="mySlides fade">
          <img class="product" src="home/homemoto13.png">
        </div>
        <div class="mySlides fade">
          <img class="product" src="home/homemoto1301.jpg">
        </div>
        <div class="mySlides fade">
          <img class="product" src="home/homemoto1302.jpg">
        </div>
        <div class="mySlides fade">
          <img class="product" src="home/homemoto1303.jpg">
        </div>
        <div class="mySlides fade">
          <img class="product" src="home/homemoto1304.jpg">
        </div>
        <div class="mySlides fade">
          <img class="product" src="home/homemoto1305.jpg">
        </div>
        <a class="next" onclick="plusSlides(1)">&#10095;</a>
      </div>
      <div class="txt">
        <div class="sss">
          <div class="good">
            <h2>好騎指數:<img src="home/fire-wheel (3).png"><img src="home/fire-wheel (3).png"><img
                src="home/fire-wheel (3).png"></h2>
          </div>

        </div>
        <h2>排氣量:321c.c</h2>
        <h2>引擎形式:水冷四行程並列雙缸 DOHC 4V</h2>
        <h2>付款方式:現金/信用卡付款</h2>
        <h2>計費方式:$400/20% Off
        </h2>


<%
if( session.getAttribute("email") != null ){

		  
			
		%>
			 <a href="yamaha.jsp"><input type="button" class="but" value="立即租車"></a>
		
	
	<%
}	
else{
	
%>
        <a href="login.html"><input type="button" class="but
        " value="登入訂購"></a>
    
	<% } %>
      </div>
    </div>
    <div class="chara">
      <div class="pei">
        <h3>配備:</h3>
        <h3>M行導風口與LED頭燈/321cc 並列雙缸水冷引擎/輕量鑽石型鋼管車架/多功能液晶儀表板/37mm 倒立式前叉/競技感三角騎姿/ABS/輕量輪框和超級跑胎</h3>
      </div>
      <div class="ter">
        <h3>特色:</h3>
        <h3>R系列源自多年賽場淬煉的 Yamaha YZR-M1 工廠賽車，承襲冠軍榮耀。

          與生俱來的R DNA競速血統，挾帶一系列引領自MotoGP的技術精髓，

          以外型性能皆備的馳騁體驗，率你見證Yamaha半世紀以來始終如一的挑戰精神。</h3>
      </div>
    </div>

    <hr>
    <div class="video">
      <iframe width="1000" height="600" src="https://www.youtube.com/embed/YqRPLLy4LV4" frameborder="0"
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
        allowfullscreen></iframe>
    </div>
    <hr>
  <form name="form1" method="post" action="board7.jsp" >
    <div class="content2">
      <div class="comment">

             <% 

	if( session.getAttribute("email") != null ){
		out.print("<img class='man' src='comment/commemt.png'>");
		    out.print("<div class='jjj'><h6>"+ session.getAttribute("email")+"</h6><div class='rating'><input type='radio' id='star5' name='rating' value='5' hidden /><label for='star5'></label><input type='radio' id='star4' name='rating' value='4' hidden /><label for='star4'></label><input type='radio' id='star3' name='rating' value='3' hidden /><label for='star3'></label><input type='radio' id='star2' name='rating' value='2' hidden /><label for='star2'></label><input type='radio' id='star1' name='rating' value='1' hidden /><label for='star1'></label></div>'<input class='comm' type='text' placeholder='留言' name='content'></div></div>");
			out.print("");
			out.print("      <div class='commenbutton'><input class='cancel' type='Reset' value='取消'><input class='combtn' type='submit' value='留言'></div></div></div>");
			
			

	}else{
	
%>


      </div>
      <div class='commenbutton'>
        <a href="login.html"><input class='combtn' type='button' value='留言請先登入'></a></div>
    </div>
  </div>
	<% } %>
</form>
  <hr>
  <div class="like">
    <h2>評論區</h2>
  </div>
  <hr>
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
           sql="USE `motorcycle`";
           con.createStatement().execute(sql);
//Step 4: 執行 SQL 指令, 若要操作記錄集, 需使用executeQuery, 才能傳回ResultSet	
           /*使用getRow()查詢筆數
		   sql="SELECT * FROM `guestbook7`"; //算出共幾筆留言
           ResultSet rs=con.createStatement().executeQuery(sql);

           //先移到檔尾, getRow()後, 就可知道共有幾筆記錄
           rs.last();
           int total_content=rs.getRow();
           */
		   //使用COUNT()查詢筆數
		   sql="SELECT COUNT(*) FROM `guestbook7`"; //算出共幾筆留言
           ResultSet rs=con.createStatement().executeQuery(sql);

           //移到第一筆，使用rs.getString() 就可知道共有幾筆記錄，型別為字串，須轉成整數
           rs.next();
		   int total_content=Integer.parseInt(rs.getString(1));
		   
		   
		   
		  
		              
           //每頁顯示5筆, 算出共幾頁
           int page_num=(int)Math.ceil((double)total_content/5.0); //無條件進位
           
		    									
			      
							 						 
						 
						
						

                     //讀取page變數
           String page_string = request.getParameter("page");
           if (page_string == null) 
               page_string = "0";          
           int current_page=Integer.valueOf(page_string);
           if(current_page==0) //若未指定page, 令current_page為1
	          current_page=1;
	       //計算開始記錄位置   
//Step 5: 顯示結果 
           int start_record=(current_page-1)*5;
           //遞減排序, 讓最新的資料排在最前面
           sql="SELECT * FROM `guestbook7` ORDER BY `GBNO` DESC LIMIT ";
           sql+=start_record+",5";

// current_page... SELECT * FROM `guestbook7` ORDER BY `GBNO` DESC LIMIT
//      current_page=1: SELECT * FROM `guestbook7` ORDER BY `GBNO` DESC LIMIT 0, 5
//      current_page=2: SELECT * FROM `guestbook7` ORDER BY `GBNO` DESC LIMIT 5, 5
//      current_page=3: SELECT * FROM `guestbook7` ORDER BY `GBNO` DESC LIMIT 10, 5
           rs=con.createStatement().executeQuery(sql);
//  逐筆顯示, 直到沒有資料(最多還是5筆)
           while(rs.next())
                {  %>
<div class="content3">
    <div class="comment1">

      <img class="man" src="comment/commemt.png">
      <div class="bbb">
        <h6> <%out.println(rs.getString(2)+"<br>");%></h6>
        <h6>  <% out.println("留言內容:"+rs.getString(3)+"<br>");
                 out.println("留言時間:"+rs.getString(4));%></h6>
      </div>
    </div>
  </div>
		  <HR>		
              
				 
			 
			 
 
			<%	 
          }

  
%>
</font>
  <div class="content3">
    <div class="comment1">
      <img class="man" src="comment/wei.png">
      <div class="bbb">
        <h6>Wei1019</h6>
        <h6>像賽車一樣的競速感，超刺激!</h6>
      </div>
    </div>
  </div>
<HR>
  <center>
<%
		         		  out.println("共"+total_content+"筆留言<p>");
		
		             //使用超連結方式, 呼叫自己, 使用get方式傳遞參數(變數名稱為page)
				 for(int i=1;i<=page_num;i++) //建立1,2,...頁超連結
			   out.print("<a href='moto7.jsp?page="+i+"'>"+i+"</a>"); //&nbsp;html的空白
			 
           out.println("<p>");
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
    var slideIndex = 1;
    showSlides(slideIndex);

    function plusSlides(n) {
      showSlides(slideIndex += n);
    }

    function currentSlide(n) {
      showSlides(slideIndex = n);
    }

    function showSlides(n) {
      var i;
      var slides = document.getElementsByClassName("mySlides");
      var dots = document.getElementsByClassName("dot");
      if (n > slides.length) {
        slideIndex = 1
      }
      if (n < 1) {
        slideIndex = slides.length
      }
      for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
      }
      for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
      }
      slides[slideIndex - 1].style.display = "block";
      dots[slideIndex - 1].className += " active";
    }
  </script>
</body>

</html>