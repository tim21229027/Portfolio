<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>RentUMoto好騎一直騎</title>
</head>
<style>
  @import url(search.css);
  @import url(headfoot.css);
  @import url('https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Lobster&display=swap');
</style>

<body>
  <header>
    <div>
      <div class="option">
        <div>
          <a href="home.jsp"> <img class="logo" src="home/logo.png"></a>
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
          <a href="login.html">
            <p>註冊/登入</p>
          </a>

        </div>
      </div>
    </div>
  </header>
  <div class="people">
    <h4>造訪人數</h4>
  </div>
  <div class="content">
    <div class="txtt">
      <h3>您搜尋的內容是:</h3>
      <h3></h3>
    </div>
    <div class="kinds">
      <a href="#">
        <h2>Yamaha(3)</h2>
      </a>
      <a href="#">
        <h2>Suzuki(3)</h2>
      </a>
      <a href="#">
        <h2>Honda(3)</h2>
      </a>
    </div>

    <div class="search">
      <div class="sss">
        <div class="img">
          <img class="pro" src="home/homemoto1.jpg">
        </div>
        <div class="txt">
          <a href="moto4.jsp">
            <h1>Honda CB650R</h1>
          </a>

          <h4>好騎指數<img src="home/fire-wheel (3).png"><img src="home/fire-wheel (3).png"><img
              src="home/fire-wheel (3).png"><img src="home/fire-wheel (3).png"></h4>
          <h4>引擎形式:水冷並列4汽缸，16汽門，DOHC</h4>
          <h4>付款方式:現金/信用卡付款</h4>
          <h4>計費方式:$600/First Day;20% Off The Next Day
          </h4>

        </div>
        <div class="pay">
          <h1>庫存量:輛</h1>
          <input class="btn" type="button" value="立即訂車">
        </div>
      </div>
    </div>
  </div>
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