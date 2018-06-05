
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.* , com.fr.jsp.board.model.vo.*,com.fr.jsp.product.model.vo.* ,com.fr.jsp.common.PageInfo , com.fr.jsp.myShoppingBasket.model.vo.*"%>

<%
	ArrayList<ReviewBoard> reviewList = (ArrayList<ReviewBoard>) request.getAttribute("reviewList");
	ArrayList<ProductSimple> relatedCategoryProduct = (ArrayList<ProductSimple>)request.getAttribute("relatedCategoryProduct");
	ArrayList<ProductSimple> optionProduct = (ArrayList<ProductSimple>)request.getAttribute("optionProduct");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ProductDetail p = (ProductDetail)request.getAttribute("product");
	
%>
<!DOCTYPE html>

<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>상품 페이지</title>

<!-- 부트스트랩 -->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.js"></script>



<style>
/*xs 사이즈 이하면 컨테이너 사이즈 고정*/
@media ( max-width :769px) {
	.container {
		width: 700px;
	}
}

@
-moz-document url-prefix () {fieldset {
	display: table-cell;
}

}

/*select 텍스트 중앙 정렬*/
select {
	text-align-last: center;
}

option {
	margin-top: 15px;
}

.popover * {
	text-align: center;
}

/*선택 옵션 스타일*/
.selected_option {
	height: 24px;
	font-size: 18px;
	color: #4a4a4a;
	padding-left: 0;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
	margin-bottom: 25px;
}

.rating_star {
	color: gold;
	font-size: 1.2em;
}

.rating_star_empty {
	color: grey;
	font-size: 1.2em;
}

.review_divider {
	border-color: grey;
}

.text_center{
	text-align:center;
}

.margin_top{
	margin-top:15px;
}

body{
  position: relative;
  margin-top : 70px;
}

.test{
	border:1px solid;
}

</style>

<script>


	//로드할 때 실행되야 하는 함수들 모음
	$(function() {


		//상품 이름 가격 세팅
		product_price = <%=p.getProductPrice()%>;
		product_name = '<%=p.getProductName()%>';
		
		
		
		$('#product_name').text(product_name);
		$('#product_price').text(product_price + "원");

		//옵션 상품을 셀렉트에 넣기
		<%for(int i=0;i<optionProduct.size();++i){%>
		
		//상품번호,이름,가격,타입이름을 ,로 이어 붙여 option의 value에 넣어줌
		var $temp = $("<option value='<%=optionProduct.get(i).getProductNum()%>,<%=optionProduct.get(i).getProductName()%>,<%=optionProduct.get(i).getProductPrice()%>,<%=optionProduct.get(i).getProductTypeName()%>,<%=optionProduct.get(i).getImage()%>'><%=optionProduct.get(i).getProductName()%></option>");
		$('#option_product').append($temp);
		 
		
		<%}%>
		//캐러셀 적용
		$('#imageCarousel').carousel();

		if ($('#optionDiv').children().length == 0) {
		//처음 시작시 옵션상품이 아무것도 선택 안되어 있으므로 안됐다고 표시해주는 함수 실행
			showNoOptionProductInfo();
		}

		//상세정보 팝오버 함수와 템플릿 수정
		$('#product_info')
				.popover(
						{
							template : '<div class="popover" style="width:400px"><div class="arrow"></div><div class="popover-inner"><h3 class="popover-title"></h3><div class="popover-content"><p></p></div></div></div>'
						});

		$('#share').popover(
						{
							template : '<div class="popover" style="width:400px"><div class="arrow"></div><div class="popover-inner"><div class="popover-content"><p></p></div></div></div>'
						});
		
		$('#share').attr("data-content" , $('#share_buttons').html());
							
						
		
		
		
		//팝오버에 들어가는 내용들 설정
		var product_type = '<%=p.getProductCategoryName()%>';
		var product_origin = '<%=p.getProductOriginName()%>';
		var shipping_fee = "지역별상이";
		$('#product_info')
				.attr(
						"data-content",
						"<table class='table table-striped table-bordered table-condensed'><tbody><tr><th class='active'>상품타입</th><td>"
								+ product_type
								+ "</td><th class='active'>원산지</th><td>"
								+ product_origin
								+ "</td></tr><tr><th class='active'>제조원</th><td>꽃길</td><th class='active'>배송비</th><td>"
								+ shipping_fee
								+ "</td></tr><tr><th class='active'>기타</th><td colspan='3'>일부지역에 한하여 배송비가 추가될 수 있습니다.</td></tr></tbody></table>");
		
		
		//리뷰 세팅하기
		setReviewList();
		
		//찜 리스트에 들어가 있으면 버튼 초기상태 변경
		checkInFavList('<%=p.getProductNum()%>');
		
		
		//stick navbar setting
		 $navbar = $("#mNavbar");
	  
	 	 AdjustHeader(); // Incase the user loads the page from halfway down (or something);
	  	$(window).scroll(function() {
	      AdjustHeader();
	  	});
	  	
	  	//스크롤 스파이 세팅
	  	$('body').scrollspy({ target: '#mNavbar' })

	});

	
	//스티키 NAVBAR
  	 function AdjustHeader(){
  		 console.log($(window).scrollTop());
 	    if ($(window).scrollTop() > 600) {
 	      if (!$navbar.hasClass("navbar-fixed-top")) {
 	        $navbar.addClass("navbar-fixed-top");
 	        $navbar.css("top","135px");
 	      }
 	    } else {
 	      $navbar.removeClass("navbar-fixed-top");
 	     $navbar.css("top","0px");
 	    }
 	  }

	
	/*옵션을 셀렉트로 선택했을때 붙이기*/
	function onChangeOption() {

		if ($('#option_product option:selected').val() == "none")
			return;

		var shoudAdd = true;

		var $selectOptionValue =$('#option_product option:selected').val().split(",")
		
		
		
		
		$('#optionDiv div[name*=selected_option_row_]').each(function(){
			
		if(!shoudAdd)
			return;
		
		var $currRow = $(this).attr("name").split(",");
		
		
		
		 
		if($currRow[1]==$selectOptionValue[0]){
			
			shoudAdd=false;
			
			if($selectOptionValue[3]=="카드"||$selectOptionValue[3]=="메시지태그"){
				
				if($currRow[4]==$selectOptionValue[3])
				{
					shoudAdd=false;
					showTypeDuplicationWarning($currRow[4]);
					return;
				}
			}else
				showDuplicationWarning();
		}else{
			
			if($selectOptionValue[3]=="카드"||$selectOptionValue[3]=="메시지태그"){
			
				if($currRow[4]==$selectOptionValue[3])
				{
					shoudAdd=false;
					showTypeDuplicationWarning($currRow[4]);
					return;
				}
			}
		}
			 
		});
		
	
		if (shoudAdd) {
			$('#optionDiv').append(set_selected_option_row());
			$('#infoMessage').hide();
			calcTotalPrice();
			setTotalPrice();
		}
		$('#option_product').val("none");
		
	}

	/*선택된 옵션 상품 붙이는거 만드는 함수*/
	function set_selected_option_row() {

		var $temp = $('[name=selected_option_row]').clone(true, true);

		$temp.attr("name","selected_option_row_,"+$('#option_product option:selected').val()); //붙이는 div에 상품의 정보들 세팅
		
		$temp.children("[name=selected_name]").text($temp.attr("name").split(",")[2]);//안에 상품이름 세팅
			
		$temp.children("[name=selected_price]").text($temp.attr("name").split(",")[3]);//안에 가격 세팅
		
		return $temp;
	}

	/*중복선택 오류 메시지 창 나타내는 함수*/
	function showDuplicationWarning() {
		$('#infoMessage').removeClass('alert-info');
		$('#infoMessage').addClass('alert alert-warning').text(
				"옵션상품은 개당 1개씩만 선택 가능합니다.").show().fadeOut(3000);
	}

	/*옵션 상품을 선택 안했을때 메시지 나타내는 함수*/
	function showNoOptionProductInfo() {
		$('#infoMessage').removeClass('alert-warning');
		$('#infoMessage').addClass('alert alert-info').text("선택된 상품이 없습니다.").show();
	}
	
	//카드 , 혹은 메시지카드 타입을 중복 선택한 경우
	function showTypeDuplicationWarning(data) {
		$('#infoMessage').removeClass('alert-info');
		$('#infoMessage').addClass('alert alert-warning').text(
				data+"종류는 하나만 선택 가능합니다.").show().fadeOut(3000);
	}

	/*총 가격 계산*/
	function calcTotalPrice() {

		var totalPrice = 0;
		$("#optionDiv div[name=selected_price]").each(function(i, element) {
			totalPrice += parseInt($(element).text());
		});
		return product_price + totalPrice;
	}

	/*상품가격과 총 가격을 표시*/
	function setTotalPrice() {

		if ($("#optionDiv div[name='total_Price']").length == 0) {

			appendProductTotalPrice();
		} else {

			$("#optionDiv [name*=total]").remove();

			appendProductTotalPrice();
		}
	}
	
	//상품 가격이랑 총 가격 붙이는 함수
	function appendProductTotalPrice() {
		$('#optionDiv')
				.append(
						$("<div class='offset-sm-1 col-7 col-sm-7 selected_option' name='total_product_name'>"
								+ product_name + "</div>"));
		$('#optionDiv')
				.append(
						$("<div class='col-4 col-sm-3 selected_option' name='total_Price'>"
								+ product_price + "원" + "</div>"));

		$('#optionDiv')
				.append(
						$("<div class='offset-sm-1 col-7 col-sm-7 selected_option' name='total_PriceName'>총 가격</div>"));
		$('#optionDiv')
				.append(
						$("<div class='col-4 col-sm-3 selected_option' name='total_product_price'>"
								+ calcTotalPrice() + "원" + "</div>"));
	}

	/*옵션 상품 취소*/
	function clickOptionCancle(obj) {
		$(obj).parents("[name*=selected_option_row]").remove();

		calcTotalPrice();
		setTotalPrice();

		if ($('#optionDiv').children("[name*=selected_option_row]").length == 0) {
			$("#optionDiv [name*=total]").each(function() {
				$(this).remove();
			});
			showNoOptionProductInfo();
		}
	}
	
	/*리뷰 작성 취소시 폼 입력 초기화*/
	function review_cancle() {

		$("[name=title]").val("");
		$("[name=content]").val("");
		$("#reviewCollapse").collapse('hide');
		

	}

	/*리뷰 등록*/

	function submit_review() {
		
		
		if(!checkLogin())
			return;
		
		
		if($('[name=title]').val().length<=0){
			alert("제목을 입력해 주세요.");
		}else if($('[name=content]').val().length<=0){
			alert("내용을 입력해 주세요.");
		}
		
		$.ajax({
			url:"insertReview.do",
			data:{product_num:$('[name=product_num]').val(),
				  member_num:$('[name=member_num]').val(),
				  title:$('[name=title]').val(),
				  content:$('[name=content]').val(),
				  rating:$('[name=rating]:checked').val()
				  },
			type:"get",
			success:function(data){
			if(data>0){
				
				setReviewList();
				$("[name=title]").val("");
				$("[name=content]").val("");
				$("#reviewCollapse").collapse('hide');
			}
			
		},error:function(data){
			
			alert("리뷰등록을 실패했습니다.");
		}
		});
	}
	
	/*댓글창 페이지네이션 만들기 */
	function createPagination(pi){
		
		$('#pagination').css("display","block");
		
		
		$('ul[class=pagination]').append("<li name='toFirst' onclick='setReviewList("+(pi.startPage)+")'><a>&laquo;</a></li>")
		$('ul[class=pagination]').append("<li name='prev' onclick='setReviewList("+(pi.currPage-1)+")'><a>&lt;</a></li>");
		
		for(var i = pi.startPage ; i<=pi.endPage; ++i){
			
			if(i==pi.currPage){
				$('ul[class=pagination]').append("<li name='pageNumber' class='active'><a onclick='setReviewList("+i+")'>"+i+"</a></li>");
			}else{
				$('ul[class=pagination]').append("<li name='pageNumber' ><a  onclick='setReviewList("+i+")'>"+i+"</a></li>");
			}
	
		}
		$('ul[class=pagination]').append("<li name='next' onclick='setReviewList("+(pi.currPage+1)+")'><a>&gt;</a></li>")
		$('ul[class=pagination]').append("<li name='toLast' onclick='setReviewList("+(pi.endPage)+")'><a>&raquo;</a></li>");
		

	}
	
	/*댓글 페이지 번호 누르면 업데이트 하는거  */
	function updatePagination(pi){
		
		var $number =  $('li[name=pageNumber]');
		
		
		console.log($number);
		
		for(var i = 0 ; i<$number.length;++i){
			
			if(parseInt($number.eq(i).children('a').text())==pi.currPage)
				$number.eq(i).addClass("active");
			else
				$number.eq(i).removeClass("active");
		}
			
		
	}
	
	/*리뷰 리스트 표시  */
	function setReviewList(toPage){
		
		if(toPage<=0)
			toPage=1;
		
		$.ajax({
			url:"selectReviewList.do",
			data:{pno:'<%=p.getProductNum()%>',
				currPage:toPage
				},
			type:"get",
			success:function(data){
	
				var  pi= data.pi;
				
				var list = data.list;
			
				$('#reviewBoard').children().remove();
				
				if(list.length==0){
					$('#reviewBoard').append("<span class='lead'>이 상품의 리뷰가 존재하지 않습니다.</span>")
					
					return;
				}
				
				
				if($('#pagination').css("display")=="none")
					createPagination(pi);
				else
					updatePagination(pi);
				
				for(var i in list){
				
				var $reviewDiv = $('<div>');	
					
						
				for(var j=0;j<list[i].rating;++j){
					
					$reviewDiv.append("<span class='glyphicon glyphicon-star rating_star'></span>");
					}
				
				for(var k=0;k<5-list[i].rating;++k){
						
					$reviewDiv.append("<span class='glyphicon glyphicon-star rating_star_empty'></span>");
					} 
				
				
				$reviewDiv.append("<h4>"+list[i].submitDate+"</h4>");
				$reviewDiv.append("<h3>"+list[i].bTitle+"</h3>");
				$reviewDiv.append("<h4>"+list[i].bContent+"</h4>");
				$reviewDiv.append("<br />");
				$reviewDiv.append("<hr class='review_divider' />");
				$('#reviewBoard').append($reviewDiv);
				}

			},error:function(data){
				$('#reviewBoard').append("<span class='lead'>리뷰를 불러올 수 없습니다.</span>");
				
			}
			
		});
		
	}
	
	
	
	//찜 목록에 추가 / 삭제
	function addToFavorite(productNum){
		
		
		
		$.ajax({
			url:"addFavorite.do",
			data:{pno:productNum},
			type:"get",
			success:function(data){
			
				alert(data);
				checkInFavList(productNum);
				
			},error:function(data){
				console.log("에러네 띠용....");
			}
			
		});
	}
	
	//찜목록에 있는지 확인
	function checkInFavList(productNum){
		$.ajax({
			url:"checkFavList.do",
			data:{pno:productNum},
			type:"get",
			success:function(data){
				if(data>0)
					$('#addFavBtn').css("color","red");
				else
					$('#addFavBtn').css("color","black");
				
			},error:function(data){
				console.log("에러네 띠용....");
			}
			
		});
		
		
	}
	
	//장바구니에 추가
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
	
	
	
		//결제 눌렀을때 서브밋 해주기
		function purchase(){
			
			
			if(!checkLogin())
				return;
			
			var $optionList =  $('#optionDiv div[name*=selected_option_row_]');
			
	        
			$('[name=sub_product_num]').attr("value",'<%=p.getProductNum()%>'+',');
			$('[name=sub_product_price]').attr("value",'<%=p.getProductPrice() %>'+',');
			$('[name=sub_product_name]').attr("value",'<%=p.getProductName()%>'+',');
			$('[name=sub_product_image]').attr("value",'<%=p.getImages().get(0)%>'+',');
			
			console.log($optionList.length);
			
			
			for(var i=0;i<$optionList.length;++i){
				
				$('[name=sub_product_num]').attr("value",$('[name=sub_product_num]').attr("value")+$optionList.eq(i).attr("name").split(",")[1]+",");
				$('[name=sub_product_price]').attr("value",$('[name=sub_product_price]').attr("value")+$optionList.eq(i).attr("name").split(",")[3]+",");
				$('[name=sub_product_name]').attr("value",$('[name=sub_product_name]').attr("value")+$optionList.eq(i).attr("name").split(",")[2]+",");
				$('[name=sub_product_image]').attr("value",$('[name=sub_product_image]').attr("value")+$optionList.eq(i).attr("name").split(",")[5]+",");
				
			}
			
			$('#purchase').submit();
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

<body data-spy="scroll" data-target="#mNavbar" data-offset="400">
	<br id="page_start"/>
	<%@include file="../common/header.jsp"%>
	
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<!--상품 사진과 옵션 선택-->
	<div class="container ">

		<div class="row">

			<div class="col-md-6 col-sm-6 col-xs-12 col-lg-6">
				<img
					src="<%=request.getContextPath()%>/resources/images/product/<%=p.getImages().get(0)%>"
					class="img-responsive thumbnail center-block" id="product_image">
					
			
				<div class="row ">
					<div class="btn-group col-md-6 col-sm-6 col-xs-6 col-lg-6">
						<button class="btn btn-default btn-sm glyphicon glyphicon-heart"
							id="addFavBtn" onclick="addToFavorite('<%=p.getProductNum()%>');"></button>
						
						<a id="share" class="btn btn-default btn-sm glyphicon glyphicon-share" tabindex="0"
							role="button" style="color: black"  data-toggle="popover" data-html="true" data-trigger="click"title="공유" data-placement="top"></a>
						
						<a id="product_info"  tabindex="0"
							class="btn btn-sm btn-default glyphicon glyphicon-question-sign"
							role="button" data-toggle="popover" data-trigger="hover"
							title="상세 정보" data-html="true"></a>
					</div>

				</div>
			</div>


			<div class="col-xs-12 col-md-6 col-sm-6 col-lg-6 thumbnail">
				<div class="caption">
					<h3 id="product_name" class="thumbnail-label "></h3>
					<h4 id="product_price" class="thumbnail-label"></h4>
				</div>

				<div class="col-xs-12">
					<div >
						<label for="option_product" class="control-label">옵션상품</label> 
					<%if(!p.getProductCategoryName().equals("디저트")&&
        					!p.getProductCategoryName().equals("메시지태그")&&
        					!p.getProductCategoryName().equals("카드")&&
        					!p.getProductCategoryName().equals("화환")) {%>
						<select
							name="option_product" id="option_product"
							class="form-control input-lg" onchange="onChangeOption();">
							<option value="none">---옵션 상품을 선택해 주세요---</option>
						</select>
					
					<div >
						<div class="col-xs-12 margin_top" id="optionDiv"></div>
					</div>

					<div class=" row text-center margin_top">
						<div class="col-xs-offset-1 alert col-xs-10" id="infoMessage">
							</div>
					</div>
					<%} %>
					<hr>

					<div class="form-group col-xs-12">

						
						
						<%if(!p.getProductCategoryName().equals("디저트")&&
        									!p.getProductCategoryName().equals("메시지태그")&&
        									!p.getProductCategoryName().equals("카드")) {%>
        				<label for="to_basket" class="control-label sr-only">장바구니</label>
						<button class="btn btn-lg btn-default col-xs-offset-1 col-xs-4"
							id="to_basket" onclick="addToBasket('<%=p.getProductNum()%>')">장바구니</button>
						<label for="to_purchase" class="control-label sr-only">구매하기</label>
						
						
						<form id="purchase" action="<%=request.getContextPath()%>/payment.bk" method="post">
							<input type="hidden" value="" name="sub_product_num"/>
							<input type="hidden" value="" name="sub_product_price"/>
							<input type="hidden" value="" name="sub_product_name"/>
							<input type="hidden" value="" name="sub_product_image"/>
							<button class="btn btn-primary btn-lg col-xs-offset-1 col-xs-6"
							 type="button" id="to_purchase" onclick="purchase();">구매하기</button>
						</form>
						<%} else {%>
							<label for="to_basket" class="control-label sr-only">장바구니</label>
							<button class="btn btn-lg btn-default col-xs-offset-2 col-xs-8"
							id="to_basket" onclick="addToBasket('<%=p.getProductNum()%>')">장바구니</button>
						<%} %>
						
						</div>
					</div>

				</div>

			</div>
		</div>
	</div>
	
	<div class="container">
		<hr class="review_divider" id="content_start">
	</div>

	
	<div class="container">
	  <nav class="navbar navbar-default" id="mNavbar">
	    <div class="container">
	      <div class="navbar-header ">
	        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1" aria-expanded="false" id="toggle">
	          <span class="sr-only">Toggle navigation</span>
	          <span class="icon-bar"></span>
	          <span class="icon-bar"></span>
	          <span class="icon-bar"></span>
	        </button>
	      </div>
	
	      <div class="collapse navbar-collapse" id="navbar-collapse-1">
	        <ul class="nav navbar-nav navbar-right ">
	          <li class="active"><a href="#page_start" >상품구매</a></li>
	          <li><a href="#content_start">상품 설명</a></li>
	          <li><a href="#review_start">리뷰</a></li>
	        </ul>
	      </div>
	    </div>
	  </nav>
	</div>


	<%
		for (int i = 1; i < p.getImages().size(); ++i) {
	%>
	<!--상품 설명-->
	<div class="container">
		<div class="row">
			<div style="text-align: center;">

				<img class="image-responsive img-thumbnail"
					src="<%=request.getContextPath()%>/resources/images/product/<%=p.getImages().get(i)%>"
					alt="" class=" col-10 col-sm-10 " style="float: none;">
			</div>

		</div>
	</div>

	<!--상품 사진-->
	<div class="container">
		<%
			if (p.getImageDesc().get(i) != null) {
		%>
		<pre class="text-left" style="line-height: 2em;"><%=p.getImageDesc().get(i)%></pre>
		<%
			}
		%>
	</div>

	<%
		}
	%>

	<div class="container" style="margin-top: 10px">
		<hr class="review_divider">
	</div>

	<!--배송 관련 글 -->
	<div class="container">
		<div class="row">
			<div class="col-xs col-lg col-md col-sm">
				<h4>
					<b>배송알림 메시지</b>
				</h4>
				배송상태가 변경된 경우 알림톡(카카오톡)을 통해 알려드립니다. <br> 카카오톡이 설치되어 있지 않은 고객님께는
				SMS로 메시지가 발송됩니다. <br> 해외번호를 사용하시는 고객님께는 이메일로 알림을 드립니다. <br>
				<br>
				<h4>
					<b>배송 가능 시간</b>
				</h4>
				월-토 am11시 - pm 7:30 <br> <br>
				<h4>
					<b>배송비 안내</b>
				</h4>
				서울 전 지역 무료 1만원 추가지역 : 구리 / 하남 / 성남 / 과천 / 의왕 / 군포 / 안양 / 광명 / 부천 <br>
				2만원 추가 지역 : 김포 / 고양 / 파주 / 양주 / 광주 / 용인 / 남양주 / 오산 / 화성 / 안산 / 시흥 /
				인천 / 수원 / 의정부 <br> <br> 불명확한 주소를 기재하여 수령인께 전달이 안되었을 경우,
				당사에서 책임을 지지 않습니다. <br> 정확한 주소와 연락처를 기재해 주시기 바랍니다. <br> <br>
				<h4>
					<b>결제 안내</b>
				</h4>
				<hr id="review_start" style="visibility: hidden;">
				가상계좌 입금이 확인되지 않으면 취소될 수 있습니다. <br> 주문 취소/변경 (콜센터 02-512-8180) <br>
				<br>
				<h4>
					<b>교환 및 환불 안내</b>
				</h4>
				꽃은 식물이기 때문에 배송된 이후에는 변심 및 훼손에 의한 환불이 불가한 점 양해 부탁드립니다. <br> 배송된
				상품의 신선도나 구성품 누락시 원모먼트의 책임인 경우 새로운 구성으로 교환해 드립니다. <br> 교환 및 환불
				문의 (콜센터 02-512-8180)<br>

			</div>
		</div>

	</div>
	<div class="container" style="margin-top: 10px">
		<hr class="review_divider">
	</div>


	<!--리뷰 게시판 -->
	<div class="container">
		<div class="row">
			<div class="col-xs-12" id="reviewBoard">

			</div>
		</div>
	</div>



	<!--페이지 네이션  -->
	<div class="container" id="pagination" style="display:none;">
		<div class="col-lg-5 col-lg-offset-5">
			<ul class="pagination">
				
	
			</ul>

		</div>

	</div>

	<!--리뷰 폼-->
	<div class="container">

		<div class="row">
			<a class="btn btn-primary btn-lg col-xs-3" data-toggle="collapse"
				href="#reviewCollapse" id="reviewBtn">리뷰 남기기</a>


			<div class="collapse col-xs-10 col-md-10 col-sm-10 col-lg-10"
				id="reviewCollapse">
				<form class="form-horizontal">

					<div class="form-group">
						<label for="title" class="control-label" style="font-size: 1.3em">제목<span
							style="color: red">*</span></label> <input class="form-control input-lg"
							type="text" name="title" placeholder="" maxlength="50">
					</div>


					<div class="form-group">
						<label for="review" class="control-label" style="font-size: 1.3em">내용<span
							style="color: red">*</span></label>
						<textArea class="form-control input-lg" type="text" name="content"
							placeholder="100자 이내로 입력해 주세요" maxlength="100"></textArea>
						<input type="hidden" name="member_num" value='<%=request.getSession().getAttribute("memberNum") %>' /> <input
							type="hidden" name="product_num" value="<%=p.getProductNum()%>" />
					</div>

					<div class="form-group">
						<label for="" class="control-label" style="font-size: 1.3em">평가<span
							style="color: red">*</span></label><br> <label class="radio-inline"><input
							type="radio" name="rating" value="1"> 1</label> <label
							class="radio-inline"><input type="radio" name="rating"
							value="2"> 2</label> <label class="radio-inline"><input
							type="radio" name="rating" value="3" checked> 3</label> <label
							class="radio-inline"><input type="radio" name="rating"
							value="4"> 4</label> <label class="radio-inline"><input
							type="radio" name="rating" value="5"> 5</label>

					</div>

					<div class="form-group">
						<button class="btn btn-primary" type="button" onclick="submit_review();">등록</button>
						<button class="btn btn-warning" type="button"
							onclick="review_cancle();">취소</button>
					</div>


				</form>
			</div>

		</div>

	</div>

	<div class="container" style="margin-top: 10px">
		<hr style="width: 90%; height: 2px;">
	</div>



	<!--관련 상품 캐러셀-->

	<div class="container">
		<div>
			<h3>이 카테고리의 다른 상품</h3>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<div id="imageCarousel" class="carousel slide" data-pause="hover"
					data-interval="5000">
					<ol class="carousel-indicators">
					
					<%for(int i=0;i<(int)(relatedCategoryProduct.size()/3);++i){%>
						<%if(i==0){ %>
						<li data-target="#imageCarousel" data-slide-to="0" class="active"></li>
						<%}else{ %>
						<li data-target="#imageCarousel" data-slide-to="<%=i%>"></li>
						<%} %>
						
					
					<%} %>
					</ol>

					<div class="carousel-inner">
					
					<%for(int i=0;i<(int)((relatedCategoryProduct.size()/3)+0.7);++i){ %>
						
						
						<%if(i==0) {%>
							<div class="item active">
						<%}else {%>
							<div class="item">
						<%} %>
						
							<div class="row">
								<%for(int j=i*3;j<(i*3+3<=relatedCategoryProduct.size()? i*3+3:relatedCategoryProduct.size());++j){ %>
									<div class="col-xs-4">
										<a href="<%=request.getContextPath()%>/productDetail.do?productNum=<%=relatedCategoryProduct.get(j).getProductNum() %>">
										<img src="<%=request.getContextPath()%>/resources/images/product/<%=relatedCategoryProduct.get(j).getImage() %>"
											class="img-responsive thumbnail"  alt="">
										</a>
										<div class="carousel-caption">
											<h3><%=relatedCategoryProduct.get(j).getProductName() %></h3>
											<p><%=relatedCategoryProduct.get(j).getProductPrice() %>원</p>
										</div>
									</div>
								<%} %>

							</div>
						</div>
					
					
					<%} %>
					
					</div>
					<a href="#imageCarousel" class="carousel-control left"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left"></span>
					</a> <a href="#imageCarousel" class="carousel-control right"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right"></span>
					</a>
				</div>
			</div>
		</div>
	</div>



	<!--clone용 html 태그들 (보이지는 않음)-->
	<div class="container" style="display: none">
		<div class="row">
			<div name="selected_option_row">
				<div class="offset-sm-1 col-7 col-sm-7  selected_option"
					name='selected_name'></div>
				<div class='col-4 col-sm-3 selected_option' name='selected_price'></div>
				<div class='col-1 col-sm-1'>
					<span class='btn btn-default btn-xs glyphicon glyphicon-remove'
						onclick='clickOptionCancle(this);'></span>
				</div>
			</div>
		</div>
		
		 <div id="share_buttons">
           <a href="#" onclick="javascript:window.open('https://twitter.com/intent/tweet?text=[%EA%B3%B5%EC%9C%A0]%20' +encodeURIComponent(document.URL)+'%20-%20'+encodeURIComponent(document.title), 'twittersharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;"
             target="_blank">
             <img style="width:40px; height: 40px" src="<%=request.getContextPath()%>/resources/images/twitter.png" alt="Share on Twitter"></a>
           <a href="#" onclick="javascript:window.open('https://www.facebook.com/sharer/sharer.php?u=' +encodeURIComponent(document.URL)+'&t='+encodeURIComponent(document.title), 'facebooksharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;"
             target="_blank">
             <img style="width:40px; height: 40px" src="<%=request.getContextPath()%>/resources/images/facebook.png" alt="Share on Facebook"></a>
           <a href="#" onclick="javascript:window.open('https://plus.google.com/share?url=' +encodeURIComponent(document.URL), 'googleplussharedialog','menubar=no,toolbar=no,resizable=yes, scrollbars=yes,height=350,width=600');return false;"
             target="_blank">
             <img style="width:40px; height: 40px" src="<%=request.getContextPath()%>/resources/images/googlePlus.png" alt="Share on Google+"></a>
           <a href="#" onclick="javascript:window.open('https://story.kakao.com/s/share?url=' +encodeURIComponent(document.URL), 'kakaostorysharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes, height=400,width=600');return false;"
             target="_blank">
             <img style="width:40px; height: 40px" src="<%=request.getContextPath()%>/resources/images/kakaoStory.jpg" alt="Share on kakaostory"></a>
           <a href="#" onclick="javascript:window.open('http://share.naver.com/web/shareView.nhn?url=' +encodeURIComponent(document.URL)+'&title='+encodeURIComponent(document.title), 'naversharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;"
             target="_blank">
             <img style="width:40px; height: 40px" src="<%=request.getContextPath()%>/resources/images/naver.jpg" alt="Share on Naver"></a>
         </div>
		
	</div>


	<%@include file="../common/footer.jsp"%>


</body>

</html>
