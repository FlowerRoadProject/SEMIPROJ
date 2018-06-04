<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
 <script src="<%=request.getContextPath()%>/resources/js/jquery-1.12.2.min.js"></script>
<title>메인1</title>
<style>
 .product_img {
      display: block;
      max-width: 100%;
      height: 400px;
    }
    img {
      cursor: pointer;
    } 
    /* carousel 크기조정 */
    .carousel-inner>.item>img,
    .carousel-inner>.item>a>img {
      width: 40%;
      margin: auto;
    }
</style>
<script>
    //즐겨찾기
    $(document).ready(function () {
      $('#favorite').on('click', function (e) {
        var bookmarkURL = window.location.href;
        var bookmarkTitle = document.title;
        var triggerDefault = false;
        if (window.sidebar && window.sidebar.addPanel) {
          // Firefox version < 23 
          window.sidebar.addPanel(bookmarkTitle, bookmarkURL, '');
        } else if ((window.sidebar && (navigator.userAgent.toLowerCase().indexOf('firefox') > -1)) || (window.opera && window.print)) {
          // Firefox version >= 23 and Opera Hotlist 
          var $this = $(this);
          $this.attr('href', bookmarkURL);
          $this.attr('title', bookmarkTitle);
          $this.attr('rel', 'sidebar');
          $this.off(e); triggerDefault = true;
        } else if (window.external && ('AddFavorite' in window.external)) {
          // IE Favorite 
          window.external.AddFavorite(bookmarkURL, bookmarkTitle);
        } else {
          // WebKit - Safari/Chrome 
          alert((navigator.userAgent.toLowerCase().indexOf('mac') != -1 ? 'Cmd' : 'Ctrl') + '+D 키를 눌러 즐겨찾기에 등록하실 수 있습니다.');
        } return triggerDefault;
      });
    });


    // jQuery(document).ready(function () {
    //   var wrap = jQuery(window);
    //   // 페이지로딩, 새로고침
    //   var sct = jQuery(this).scrollTop();
    //   console.log("scroll = " + sct);
    //   if (sct > 140) {
    //     jQuery("#contents_left").addClass("remoteOrigin");
    //     jQuery("#contents_left").addClass("fixed");
    //   } else {
    //     jQuery("#contents_left").removeClass("fixed");
    //     jQuery("#contents_left").addClass("remoteOrigin");
    //   }
    //   // scroll 반응
    //   wrap.on("scroll", function (e) {
    //     var sct = jQuery(this).scrollTop();
    //     console.log("scroll = " + sct);
    //     if (sct > 140) {
    //       jQuery("#contents_left").addClass("fixed");
    //       jQuery("#contents_left").addClass("remoteOrigin");
    //     } else {
    //       jQuery("#contents_left").removeClass("fixed");
    //       jQuery("#contents_left").addClass("remoteOrigin");
    //     }
    //   });
    // });
    // $(document).scroll(function () {
    //   var con = $("#remoCon");
    //   var position = $(window).scrollTop();
    //   if (position > 250) { con.fadeIn(500); }
    //   else if (position < 250) { con.fadeOut(500); }
    // });
    // $("#remoCon").click(function () {
    //   $("html, body").animate({ scrollTop: 0 }, 1000);
    // });

    $(function () {
      $('.image_Carousel').click(function () {//carousel이미지 이벤트
        alert($(this) .attr('src'));//이미지값 src 받아와서 이미지에 따라 해당 링크를 달아줌
      });

      $('.anniversary_Img').click(function () {//기념일 이미지 클릭에대한 이벤트
        alert($(this).attr('src'));
      })

      $('.btn_recommend').click(function () {//추천순 버튼 이벤트
        alert('추천순');
      });

      $('.btn_popularity').click(function () {//추천순 버튼 이벤트
        alert('인기순');
      });

      $('.btn_price').click(function () {//추천순 버튼 이벤트
        alert('가격순');
      });

    });
  </script>
</head>
<body>
<%@include file = "/views/common/header.jsp" %>
<br /><br /><br /><br /><br /><br />
<div class="container-fluid">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>

      <!-- Wrapper for slides -->
      <div class="carousel-inner">
        <div class="item active">
          <img src="<%=request.getContextPath()%>/resources/images/main/flower1.PNG" value="1" class="image_Carousel" alt="Los Angeles">
        </div>

        <div class="item">
          <img src="<%=request.getContextPath()%>/resources/images/main/flower2.PNG" value="2" class="image_Carousel" alt="Chicago">
        </div>

        <div class="item">
          <img src="<%=request.getContextPath()%>/resources/images/main/flower3.PNG" value="3" class="image_Carousel" alt="New york">
        </div>
      </div>

      <!-- Left and right controls -->
      <a class="left carousel-control" href="#myCarousel" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </div>
  <br>

<%--   <div class="container-fluid">
    <div class="col-sm-1 col-md-1 col-lg-1"></div>
    <div class="col-sm-2 col-md-2 col-lg-2">
      <img src="<%=request.getContextPath()%>/resources/images/main/1.PNG" class="img-responsive anniversary_Img">
    </div>
    <div class="col-sm-2 col-md-2 col-lg-2">
      <img src="<%=request.getContextPath()%>/resources/images/main/2.PNG" class="img-responsive anniversary_Img">
    </div>
    <div class="col-sm-2 col-md-2 col-lg-2">
      <img src="<%=request.getContextPath()%>/resources/images/main/3.PNG" class="img-responsive anniversary_Img">
    </div>
    <div class="col-sm-2 col-md-2 col-lg-2">
      <img src="<%=request.getContextPath()%>/resources/images/main/4.PNG" class="img-responsive anniversary_Img">
    </div>
    <div class="col-sm-2 col-md-2 col-lg-2">
      <img src="<%=request.getContextPath()%>/resources/images/main/5.PNG" class="img-responsive anniversary_Img">
    </div>
    <div class="col-sm-1 col-md-1 col-lg-1"></div>
  </div> --%>
  <br>
  <br>
  <%@ include file ="/views/common/eventMenu.jsp" %>
  <div class="container-fluid">
    <div class="col-sm-1 col-md-1 col-lg-1"></div>
    <div class="col-sm-1 col-md-1 col-lg-1">
      <button type="button" class="btn btn_recommend">추천순</button>
    </div>
    <div class="col-sm-1 col-md-1 col-lg-1">
      <button type="button" class="btn btn_popularity">인기순</button>
    </div>
    <div class="col-sm-1 col-md-1 col-lg-1">
      <button type="button" class="btn btn_price">가격순</button>
    </div>
    <div class="col-sm-8 col-md-8 col-lg-8"></div>
  </div>
  <br>
  <br>
  <div class="container-fluid">
    <div class="col-sm-1 col-md-1 col-lg-1"></div>
    <div class="col-sm-3 col-md-3 col-lg-3">
      <img src="<%=request.getContextPath()%>/resources/images/main/images.jpg" alt="flower" class="img-responsive product_img">
      <p class="text-info">졸업기념</p>
      <p class="text-info">핑크장미</p>
      <p class="text-info">39800원</p>
    </div>
    <div class="col-sm-3 col-md-3 col-lg-3">
      <img src="<%=request.getContextPath()%>/resources/images/main/images (1).jpg" alt="flower" class="img-responsive product_img">
      <p class="text-info">졸업기념</p>
      <p class="text-info">핑크장미</p>
      <p class="text-info">39800원</p>
    </div>
    <div class="col-sm-3 col-md-3 col-lg-3">
      <img src="<%=request.getContextPath()%>/resources/images/main/1000_shop1_747280.jpg" alt="flower" class="img-responsive product_img">
      <p class="text-info">졸업기념</p>
      <p class="text-info">핑크장미</p>
      <p class="text-info">39800원</p>
    </div>
    <div class="col-sm-2 col-md-2 col-lg-2"></div>
  </div>
<%@include file = "/views/common/footer.jsp" %>
</body>
</html>