<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
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

sql="select * from suzuki";
ResultSet rs=con.createStatement().executeQuery(sql);
%>


  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>結帳流程</title>
</head>
<script>
   function changeTimelyFlag(){
     var date1 = GetXFormFieldValueById('fd_arrival_date');    /*到達日期id*/
     var date2 = GetXFormFieldValueById('fd_current_date');    /*當前日期id*/
var dateStartMillons = new Date(date2).getTime();
var dateEndMillons = new Date(date1).getTime();
var difDays = (dateEndMillons - dateStartMillons) / (24 * 60 * 60 * 1000);
//計算出兩個日期的差值。
     if(difDays>=7){
       SetXFormFieldValueById('fd_timely_yes_no', "是");
     }
     else
       SetXFormFieldValueById('fd_timely_yes_no', "否");
   }
/*到達日期變化事件*/
AttachXFormValueChangeEventById('fd_arrival_date', changeTimelyFlag ); 
/*到貨日期*/
AttachXFormValueChangeEventById('fd_delivery_date', changeTimelyFlag ); 
</script>
<style>
  @import url("pay.css");

  @import url('https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Lobster&display=swap');
</style>

<body>
  <header>
    <div>
      <div class="option">
        <div>
          <a href="index.jsp"> <img class="logo" src="home/logo.png"></a>
        </div>
        <div class="box1">
          <div class="seen">
            <span class="icon"><i class="fa fa-search">
                <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
              </i></span>
            <input type="search" id="search" placeholder="Search">
          </div>
        </div>
        <div class="drop">
          <ul class="dropdown">
            <p>商品分類</p>
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
  <div class="people">
&nbsp;
  </div>
  <div class="title">
    <h1>結帳流程</h1>
  </div>
    
  <form name="information" method="Post" action="payadd3.jsp">
  <div class="main">
    <div class="content">
      <div class="first">
        <div class="firstin">
          <div class="img1">
<%
String  suzuki[] = request.getParameterValues("suzuki_Id");
        int y=0;
        int x=suzuki.length;

        String iddc="";
       String suzukiString[]=request.getParameterValues("suzuki_Id");
	         double tota3=0;
        int g=suzuki.length;
        int left;
        String idd;
       String leftString;

        
        while(rs.next())
        {  
  		  if(suzuki[y].equals(rs.getString(1)))
           {     
            suzukiString[y] =rs.getString(2);
            tota3=tota3+rs.getInt(6)*0.8;
            leftString = rs.getString(7);
            left = Integer.parseInt(leftString);
            left = left - 1;
            leftString = String.valueOf(left);
			iddc = rs.getString(1);
            idd = rs.getString(1);
            sql="update suzuki set stock='"+leftString+"'WHERE suzuki_id="+idd;
           con.createStatement().execute(sql);
                        
            if(y+1<x)y++;
           }
          
        }
         out.println("<h1>"+suzukiString[y]+"</h1>");
		 session.setAttribute("suzukiname",suzukiString[y]);
		 session.setAttribute("suzukiph",iddc);
		           session.setAttribute("total3",tota3);
		 %>
		 <img class="payimg" src="home/s<%=session.getAttribute("suzukiph")%>.jpg">
		 <%
		 
%>      
          </div>

          <div class="paytxt">
		             <div>
              <h2>姓名*:</h2><input name="buyer3" class="name" type="text"required="required">
            </div>
            <div class="sex">
              <h2>性別*:</h2>
			  
         		<input name="sex3" value="man" type="radio"required="required">
								<h2>男</h2>
				<input name="sex3" value="lady" type="radio"required="required">
				<h2>女</h2>
			
			
            </div>
            <div>
              <h2>身分證字號*:</h2><input name="code3" class="code" type="text"required="required">
            </div>
            <div class="payway">
              <h2>付款方式*:</h2>
		
              <input name="pway3" value="bTwo" type="radio"required="required">
              <h2>現金</h2>
              <input name="pway3" value="bOne" type="radio"required="required">
              <h2>信用卡</h2>
            </div>
            <div class="bS01 box bBW" style="display:block;">
			              <h2>卡號:<input class="credit" type="text"name="card">-<input class="credit" type="text"name="card2">-<input class="credit"
                  type="text"name="card3">-<input class="credit" type="text"name="card4"></h2>
              <h2>有效期限MM/YY:<input class="day" type="text" placeholder="01/25"name="card5">背面後三碼:<input class="day" type="text"
                  placeholder="123"name="card6"></h2>

              我們的線上付款方式有以下機制: <br>
              一.信用卡(限<font color="#FF0000">NT300元</font>以上): Visa、 Master、JCB、U卡、America Express
              <br>


              二.銀行晶片卡線上轉帳(限NT200~20,000以內) 線上交易成功後, 我們將立即為你處理出貨的動作,謝謝。
			    
			  </div>

            <div class="bS02 box bBW">以現金支付，租車前再到實體店面支付就可以了哦。
            </div>

            <div>
              <h2>租用日期*:</h2><input class="start" type="date" name="date2"required="required">
            </div>
            <div>
              <h2>結束日期*:</h2><input class="end" type="date" name="date1"required="required">
            </div>
			

			<h2>
  <%
      out.println("總金額:$"+tota3+"元");
     %>     
  </h2>
          <h4><font color="red">*此價格為折扣後價格</font></h4>
            <input class="paybtn" type="submit" value="結帳">
            <h2>注意事項: 領車當天請攜帶本人駕照哦!</h2>
          </div>
            </form>
        </div>
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
  <script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
  <script type="text/javascript">
    $(document).ready(function () {
      $('input[type="radio"]').click(function () {
        if ($(this).attr("value") == "bOne") {
          $(".box").hide();
          $(".bS01").show();
        }
        if ($(this).attr("value") == "bTwo") {
          $(".box").hide();
          $(".bS02").show();
        }

      });
    });
  </script>
</body>

</html>