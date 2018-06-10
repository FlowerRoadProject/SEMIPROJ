<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% %>
<html>
<head>
 <script src="<%=request.getContextPath()%>/resources/js/jquery-1.12.2.min.js"></script>


<title>꽃길</title>
<style>

@media(min-width:1200px){
	.items{
		height:540px;	
	}
}

@media(min-width:992px) and (max-width:1199px){
	.items{
		height:470px;		
	}
}

@media(max-width:991px){
.items{
		height:600px;
	}
}


img {
	cursor: pointer;
}

  .thumbnail img:HOVER{
  
  	opacity: 0.5;
	filter: alpha(opacity=50);
  	animation-name: opaque;
	animation-duration: 10s;
  }
  
  .tag{
        	position: relative;
        	top: -3em;
        	right: -1em;
        }
        
    .font-title{
       	font-size: 1.2em;
       	color: #4a4a4a;
		padding-left: 0;
		text-overflow: ellipsis;
		white-space: nowrap;
		overflow: hidden;
		display:block;
       }     
        
     .img-fluid{
     	
     	
     	width:100% !important;
     	height:100% !important;
     	background:rgb(255,255,255) !important;
     }
     
      .thumbnail_soldOut{
        	opacity: 0.5;
   			filter: alpha(opacity=50);
        
        }
        
        .soldOut_text{
         position: absolute;
   		 top: 50%;
    	 left: 50%;
    	 transform: translate(-50%, -50%);
        }
        
        .rating_star {
			color: gold;
			font-size: 1em;
		}

		.rating_star_empty {
			color: grey;
			font-size: 1em;
		}  
		
		
		.rating_star_align{
			text-align:right;
			margin-top:9px;
		}
		
		.
        
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
		setMostViewed();
	});

	function setMostViewed(){
		
		$.ajax({
			url : 'selectMostViewed.do',
			type : "get",
			success : function(data) {
	
				var $parsedList = $.parseJSON(data);
				
				
				appendItemstoContainer($parsedList,'mostViewed');
	
			},
			error : function(data) {
	
			}
			
		});
	}

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
				
				
				appendItemstoContainer($parsedList,'topItem');
		
				
			},
			error : function(data) {
	
			}
			
	
		});
	}
	
	function appendItemstoContainer(data,containerID){
		var $item_container = $('#'+containerID);
		
		var $parsedList = data;
		
		for (var i = 0; i < $parsedList.length; ++i) {
			var $item = $('[name=clone-item]').clone(true,true);
			$item.attr("name","clone-item_"+i);
			$item.find('[name=detailLink]').attr("href","<%=request.getContextPath()%>/productDetail.do?productNum=+"+$parsedList[i].productNum);
			if($parsedList[i].productQuantity<=0){
			
			$item.find('[name=imageSource]').attr("src","<%=request.getContextPath()%>/resources/images/product/"+$parsedList[i].image);
			$item.find('[name=imageSource]').addClass("thumbnail_soldOut");
			$item.find('[name=detailLink]').append("<span class='soldOut_text'> <h4><b>곧 준비할게요 :)</b></h4></span>");
			$item.find('[name=productDetail]').remove();
			$item.find('[name=addBasket]').off();
			$item.find('[name=addBasket]').removeClass("col-lg-4");
			$item.find('[name=addBasket]').addClass("col-xs-12");
			$item.find('[name=addBasket]').text("품절");
			}else{
				$item.find('[name=imageSource]').attr("src","<%=request.getContextPath()%>/resources/images/product/"+$parsedList[i].image);
				$item.find('[name=productDetail]').attr("onclick","location.href='<%=request.getContextPath()%>/productDetail.do?productNum=+"+$parsedList[i].productNum+"'");
				$item.find('[name=addBasket]').attr("onclick","addToBasket("+"'"+$parsedList[i].productNum+"'"+")");
			}
			$item.find('[name=productName]').text($parsedList[i].productName);
			$item.find('[name=productPrice]').text($parsedList[i].productPrice);
			$item.find('[name=reviewNum]').text($parsedList[i].reviewCount);
			for(var j=0;j<$parsedList[i].reviewAvg;++j){
				$item.find('.rating_star_align').append("<span class='glyphicon glyphicon-star rating_star'></span>");
			}

			for(var k=0;k<5-$parsedList[i].reviewAvg;++k){
					
				$item.find('.rating_star_align').append("<span class='glyphicon glyphicon-star rating_star_empty'></span>");
			} 
			
			
			
			$item_container.append($item);
		}
		
	}
	
	function addToBasket(productNum){
		
		
		if(!checkLogin()){
			
			 $('#myModal').modal({"show":true}); 
			
			return;
		}
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
		return false;
	<%}else{%>
		return true;
	<%}%>
	}
	
</script>

</head>
<%@include file="/views/common/header.jsp"%>
<body>
	<%@include file="/views/common/loginModal.jsp" %>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<div class="container-fluid">
		<div id="myCarousel" class="carousel slide" data-ride="carousel" style="margin:0px;height:420;mheight:190">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<!-- <li data-target="#myCarousel" data-slide-to="2"></li> -->
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
				<a href="<%=request.getContextPath()%>/productDetail.do?productNum=+P056">
					<img
						src="<%=request.getContextPath()%>/resources/images/mainEventCarousel/geoberaEvent.jpg"
						value="0" class=" img-fluid">
				</a>
				</div>
				
				<div class="item">
				<a href="<%=request.getContextPath()%>/productDetail.do?productNum=+P032">
					<img
						src="<%=request.getContextPath()%>/resources/images/mainEventCarousel/coralRoseEvent.jpg"
						value="1" class=" img-fluid">
				</a>
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

	<br>
	<br>
	 <%@ include file="/views/common/eventMenu.jsp"%>
	
	<div class="container">
	
		
	</div>
	<br>
	<br>

	<!--clone을 위한 아이템들  -->
	<div style="display: none;">
		<div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 " name="clone-item">
			<div class="col-lg-12 thumbnail items ">
				<div class="">
					<a name="detailLink" href=""><img class="" name="imageSource" src="" alt="..."></a> 

					<!-- <span class="label label-primary tag">Primary</span> 
					<span class="label label-success tag">success</span> -->
				</div>
				<div class="col-lg-12   ">
					<h4 class="col-lg-12">
						<br /> <b name="productName" class="font-title text-truncate"></b>
					</h4>
					<h4 name="productPrice" class=" col-lg-12">원</h4>
					<h5 class="col-lg-4  font-gray">리뷰 <span name="reviewNum"></span></h5>
					<div class="col-lg-8  rating_star_align"></div>
					
				<div class="col-lg-12 col-sm-12" style="margin-top:15px;">
			
					<a class="col-lg-4 col-md-5 col-sm-4 col-xs-4  btn btn-default" role="button" name="addBasket">장바구니</a> 
					<a class=" col-lg-7 col-lg-offset-1 col-md-6 col-md-offset-1 col-sm-7 col-sm-offset-1 col-xs-7 col-xs-offset-1 btn btn-primary " role="button" name="productDetail">바로구매</a>
					
				</div>	
				</div>
				
			</div>
		</div>
		
	</div>
	<div class="container">
		<p><b>베스트 셀러</b> &nbsp;&nbsp; &nbsp;현재 가장 많이 팔리는 제품 입니다.</p>
		<hr />
		<div class="col-lg-12" id="topItem">
			
		</div>
		<div class="row" style="text-align:center;">
			<div class="col-xs-12">
				<button id="showMore" class="btn btn-default btn-info" onclick="setTopSelling(2);">더 보기</button>
			</div>
		</div>
	</div>
	<br />
	<br />
	<br />
	<div class="container">
		<hr />
	</div>
	<div class="container">
		<p><b>지금 가장 많이 조회한 상품</b> &nbsp;&nbsp; &nbsp;현재 가장 많이 조회 되는 상품입니다.</p>
		<hr />
		<div class="col-lg-12" id="mostViewed">
			
		</div>
		<div class="row" style="text-align:center;">
			<div class="col-xs-12">
				
			</div>
		</div>
	</div>
	
	
	<%@include file="/views/common/footer.jsp"%>
</body>
</html>