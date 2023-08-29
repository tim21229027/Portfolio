<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>GSX-S750 ABS</title>
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
      <h1>GSX-S750 ABS</h1>
    </div>
    <div class="imgtxt">
      <div class="slideshow-container">
        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
        <div class="mySlides fade">
          <img class="product" src="home/homemoto904.jpg">
        </div>
        <div class="mySlides fade">
          <img class="product" src="home/homemoto901.jpg">
        </div>
        <div class="mySlides fade">
          <img class="product" src="home/homemoto902.jpg">
        </div>
        <div class="mySlides fade">
          <img class="product" src="home/homemoto903.jpg">
        </div>
        <a class="next" onclick="plusSlides(1)">&#10095;</a>
      </div>
      <div class="txt">
        <div class="sss">
          <div class="good">
            <h2>好騎指數:<img src="home/fire-wheel (3).png"><img src="home/fire-wheel (3).png"><img
                src="home/fire-wheel (3).png"><img src="home/fire-wheel (3).png"><img src="home/fire-wheel (3).png">
            </h2>
          </div>
        </div>
        <h2>排氣量:749c.c</h2>
        <h2>引擎形式:DOHC 4V水冷引擎</h2>
        <h2>付款方式:現金/信用卡付款</h2>
        <h2>計費方式:$600/20% Off</h2>


<%
if( session.getAttribute("email") != null ){

		  
			
		%>
			 <a href="suzuki.jsp"><input type="button" class="but" value="立即租車"></a>
		
	
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
        <h3>可3段式調整的循跡操控系統，透過前後輪的速度、油門位置、離合器位置以及各個檔位的感測器資訊，當偵測到後輪空轉時能夠迅速地降低引擎的輸出馬力，由於馬力能夠更有効率地傳達到地面，因此能夠享受更舒適的騎乘。
          另外，將能防止輪胎鎖死的ABS列為標準配備。
          採用不需持續按壓啟動開關，只要輕輕按壓ECM就會促發啟動開關進而啟動引擎的「SUZUKI Easy Start 智慧啟動系統」，此外，空檔時不需要握住離合器拉桿就能重新發動。
          ※1 循跡操控系統不是一項在所有情況下都能完全抑制後輪打滑（空轉）的發生或是防止摔車的裝置。
          ※2 根據騎乘路況（濕滑路面或是路況不佳等），也有可能發生煞車距離比未配備ABS車款來得長的情況，也無法完全避免因轉彎時煞車造成車輪橫向打滑的情況。</h3>
      </div>
      <div class="ter">
        <h3>特色:</h3>
        <h3>
          GSX‐S750為了追求在一般街道便於操控的騎乘性能，搭載最高輸出馬力83kW〈112PS〉/10,500rpm，最大扭力80Nm〈8.2kgf・m〉/9,000rpm的749cc並列4汽缸引擎，進而帶來不亞於「GSX‐R750」的順暢油門回應與爽快的騎乘感。
          起步前進和低轉速騎乘時，採用只需微幅提升引擎轉速的「Low RPM Assist低轉輔助系統」，提升在經常重複起步前進、停車的操作體驗</h3>
      </div>
    </div>

    <hr>
    <div class="video">
      <iframe width="1000" height="600" src="https://www.youtube.com/embed/7n0CcvrwLZI" frameborder="0"
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
        allowfullscreen></iframe>
    </div>
    <hr>
	<form name="form1" method="post" action="board3.jsp" >
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
		   sql="SELECT * FROM `guestbook3`"; //算出共幾筆留言
           ResultSet rs=con.createStatement().executeQuery(sql);

           //先移到檔尾, getRow()後, 就可知道共有幾筆記錄
           rs.last();
           int total_content=rs.getRow();
           */
		   //使用COUNT()查詢筆數
		   sql="SELECT COUNT(*) FROM `guestbook3`"; //算出共幾筆留言
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
           sql="SELECT * FROM `guestbook3` ORDER BY `GBNO` DESC LIMIT ";
           sql+=start_record+",5";

// current_page... SELECT * FROM `guestbook3` ORDER BY `GBNO` DESC LIMIT
//      current_page=1: SELECT * FROM `guestbook3` ORDER BY `GBNO` DESC LIMIT 0, 5
//      current_page=2: SELECT * FROM `guestbook3` ORDER BY `GBNO` DESC LIMIT 5, 5
//      current_page=3: SELECT * FROM `guestbook3` ORDER BY `GBNO` DESC LIMIT 10, 5
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
        <h6>高配備，騎起來爽度破表!</h6>
      </div>
    </div>
  </div>
<HR>
  <center>
<%
		         		  out.println("共"+total_content+"筆留言<p>");
		
		             //使用超連結方式, 呼叫自己, 使用get方式傳遞參數(變數名稱為page)
				 for(int i=1;i<=page_num;i++) //建立1,2,...頁超連結
			   out.print("<a href='moto3.jsp?page="+i+"'>"+i+"</a>"); //&nbsp;html的空白
			 
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
</b>
</center>

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