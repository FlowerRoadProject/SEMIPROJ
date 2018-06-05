<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<script
	src="<%=request.getContextPath()%>/resources/js/jquery-1.12.2.min.js"></script>
<title>꽃길</title>
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
.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 40%;
	margin: auto;
}

 .items{
        width:auto;
        height: 540px;
       }
</style>
<script>
	//즐겨찾기
	$(document).ready(
			function() {
				$('#favorite').on(
						'click',
						function(e) {
							var bookmarkURL = window.location.href;
							var bookmarkTitle = document.title;
							var triggerDefault = false;
							if (window.sidebar && window.sidebar.addPanel) {
								// Firefox version < 23 
								window.sidebar.addPanel(bookmarkTitle,
										bookmarkURL, '');
							} else if ((window.sidebar && (navigator.userAgent
									.toLowerCase().indexOf('firefox') > -1))
									|| (window.opera && window.print)) {
								// Firefox version >= 23 and Opera Hotlist 
								var $this = $(this);
								$this.attr('href', bookmarkURL);
								$this.attr('title', bookmarkTitle);
								$this.attr('rel', 'sidebar');
								$this.off(e);
								triggerDefault = true;
							} else if (window.external
									&& ('AddFavorite' in window.external)) {
								// IE Favorite 
								window.external.AddFavorite(bookmarkURL,
										bookmarkTitle);
							} else {
								// WebKit - Safari/Chrome 
								alert((navigator.userAgent.toLowerCase()
										.indexOf('mac') != -1 ? 'Cmd' : 'Ctrl')
										+ '+D 키를 눌러 즐겨찾기에 등록하실 수 있습니다.');
							}
							return triggerDefault;
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

	$(function() {
		$('.image_Carousel').click(function() {//carousel이미지 이벤트
			alert($(this).attr('src'));//이미지값 src 받아와서 이미지에 따라 해당 링크를 달아줌
		});

		$('.anniversary_Img').click(function() {//기념일 이미지 클릭에대한 이벤트
			alert($(this).attr('src'));
		})
		
		setTopSelling(1);
	});

	

	function setTopSelling(index){
		
		if(index>=2)
			$('#showMore').css("display","none");
		
		$.ajax({
			url : 'getTopSelling.do',
			data : {
				idx : index
			},
			type : "get",
			success : function(data) {
	
				var $parsedList = $.parseJSON(data);
				
				
				var $item_container = $('#item-container');
				
				
				for (var i = 0; i < $parsedList.length; ++i) {
					var $item = $('[name=clone-item]').clone(true,true);
					$item.attr("name","clone-item_"+i);
					$item.find('[name=detailLink]').attr("href","<%=request.getContextPath()%>/productDetail.do?productNum=+"+$parsedList[i].productNum);
					$item.find('[name=imageSource]').attr("src","<%=request.getContextPath()%>/resources/images/product/"+$parsedList[i].image);
					$item.find('[name=productName]').text($parsedList[i].productName);
					$item.find('[name=productPrice]').text($parsedList[i].productPrice);
					$item.find('[name=reviewNum]').text($parsedList[i].reviewCount);
					
					$item.find('[name=productDetail]').attr("onclick","location.href='<%=request.getContextPath()%>/productDetail.do?productNum=+"+$parsedList[i].productNum+"'");
					$item.find('[name=addBasket]').attr("onclick","addToBasket("+"'"+$parsedList[i].productNum+"'"+")");
					
					
					$item_container.append($item);
					
				}
				
			},
			error : function(data) {
	
			}
			
	
		});
	}
	
	function addToBasket(productNum){
		
		if(!checkLogin())
			return;
		
			$.ajax({
				url:"addBasket.do",
				data:{pno:productNum},
				success:function(data){
					
					if(data>0)
						alert("장바구니에 성공적으로 추가!!");
					
				},error:function(data){
					alert("장바구니에 추가 실패!!");
				}
			
			});
		
		}


	function checkLogin(){
	
	<%if(request.getSession(false).getAttribute("memberNum")==null){%>
		alert("로그인 해주세요");
		 return false;
	<%}else{%>
		return true;
	<%}%>
	}
	
</script>
</head>
<body>
	<%@include file="/views/common/header.jsp"%>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
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
					<img
						src="<%=request.getContextPath()%>/resources/images/main/flower1.PNG"
						value="1" class="image_Carousel" alt="Los Angeles">
				</div>

				<div class="item">
					<img
						src="<%=request.getContextPath()%>/resources/images/main/flower2.PNG"
						value="2" class="image_Carousel" alt="Chicago">
				</div>

				<div class="item">
					<img
						src="<%=request.getContextPath()%>/resources/images/main/flower3.PNG"
						value="3" class="image_Carousel" alt="New york">
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
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
	<%@ include file="/views/common/eventMenu.jsp"%>
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

	<!--clone을 위한 아이템들  -->
	<div style="display: none;">
		<div class="col-xs-6 col-sm-6 col-md-4 col-lg-4" name="clone-item">
			<div class="col-lg-12 thumbnail items ">
				<a name="detailLink" href=""> <img name="imageSource" src="" alt="...">
				</a> <span class="label label-primary tag">Primary</span> <span
					class="label label-success tag">success</span>
				<div class="col-lg-12 caption">
					<h4 class="col-lg-12 ">
						<br /> <b name="productName" class="font-title text-truncate"></b>
					</h4>
					<h4 name="productPrice" class=" col-lg-12 ">원</h4>
					<h5 class="col-lg-12 font-gray">
						리뷰 <span name="reviewNum"></span>
					</h5>
					<div class="col-lg-12 ">

						<a class="col-lg-4 btn btn-default" role="button"
							 name="addBasket">장바구니</a> 
						<a name="productDetail"
							class="col-lg-7 col-lg-offset-1 btn btn-primary" role="button">바로구매</a>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	<div class="container">
		<div class="col-lg-12" id="item-container">
			
		</div>
		<div style="text-align:center;">
			<button id="showMore" class="btn btn-default btn-info" onclick="setTopSelling(2);">더 보기</button>
		</div>
	</div>
	<%@include file="/views/common/footer.jsp"%>
</body>
</html>