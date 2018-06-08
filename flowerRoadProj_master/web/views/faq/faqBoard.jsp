<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.fr.jsp.board.model.vo.FaqBoard"%>

<%
	ArrayList<FaqBoard> list = (ArrayList<FaqBoard>) request.getAttribute("list");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ게시판</title>
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css"> --%>
<script	src="<%=request.getContextPath()%>/resources/js/jquery-1.12.2.min.js"></script>
<%-- <script	src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> --%>

<!-- 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
@media ( max-width : 992px) {
	.container-fluid {
		width: 969px;
	}	
	
}

.test-border {
	border: 1px solid black;
}

.buttons button {
	margin-right: 1.85em;
}

.bottom-margin {
	margin-bottom: 1.5em;
}

#boardTop {
	text-align: center;
	border-top: 2px solid gray;
	background: lightgray;
	height: 2.3em;
	margin-bottom: 0.6em;
	padding: 0.3em;
}

.boardList {
	height: 2.3em;
	padding: 0.3em;
}

.boardList span:first-child, .boardList span:nth-child(2) {
	text-align: center;
	font-size: 0.9em;
}

.boardList span:last-child {
	text-indent: 2em;
}

.boardContent {
	height: auto;
	padding: 1em;
	background: #fffacd;
	display: none;
}

.highlight {
	font-size: 1.5em;
	font-weight: bold;
	background-color: red;
	height: auto;
	
}
.title{
	font-size: 4em;
	font-weight: bold;
}
.location{
	margin: 1em;
	background: black;
	color:white;
	font-size: 3em;
	height: 7em;	
}
</style>



</head>

<body>
	<%@include file="/views/common/header.jsp"%>
	<!-- 1:1 게시판 창 -->	
	<br />	<br />	<br />	<br />	<br />
	
	<div class="col-lg-8 col-lg-offset-2 container-fluid">	
		<div class="col-lg-10 title">FAQ</div>
	<br />	
	<div class="col-lg-12 location container-fluid">
		&nbsp;&nbsp;&nbsp;&nbsp;FAQ&nbsp;&nbsp;&nbsp;&nbsp;
		<img src="<%=request.getContextPath()%>/resources/images/footerMenu/fullFlower.jpg" alt="" style="height: 7em; width:23.5em;"/>
	</div>
	</div>
	
	<div class="container-fluid">
	
		<div class="col-xs-10 col-sm-10 col-md-10 col-lg-6 col-sm-offset-1 col-md-offset-1 col-lg-offset-3 buttons bottom-margin">
			<div class="col-xs-1 col-sm-1 col-lg-2 col-md-1">&nbsp</div>
			<button class="col-xs-2 col-sm-2 col-md-2 col-lg-2 btn btn-primary">전체보기</button>
			<button class="col-xs-2 col-sm-2 col-md-2 col-lg-2 btn btn-success">주문</button>
			<button class="col-xs-2 col-sm-2 col-md-2 col-lg-2 btn btn-success">결제</button>
			<button class="col-xs-2 col-sm-2 col-md-2 col-lg-2 btn btn-success">배송</button>
			<br><br>
			<div class="col-xs-1 col-sm-1 col-lg-2 col-md-1">&nbsp</div>
			<button class="col-xs-2 col-sm-2 col-md-2 col-lg-2 btn btn-success">쿠폰</button>
			<button class="col-xs-2 col-sm-2 col-md-2 col-lg-2 btn btn-success">교환/환불</button>
			<button class="col-xs-2 col-sm-2 col-md-2 col-lg-2 btn btn-success">회원</button>
			<button class="col-xs-2 col-sm-2 col-md-2 col-lg-2 btn btn-success">상품</button>
		</div>

		<!-- 여기는 게시판이 들어갈 곳이다 -->

		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-8 col-lg-offset-2" id="boardTop">
			<span class="col-xs-1 col-sm-1 col-md-1 col-lg-1">번호</span>
			<span class="col-xs-2 col-sm-2 col-md-2 col-lg-1">분류</span>
			<span class="col-xs-9 col-sm-9 col-md-9 col-lg-10">제목</span>
		</div>
		<%for (int i = 0; i < list.size(); i++) {%>
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-8 col-lg-offset-2 boardList">
			<span class="col-xs-1 col-sm-1 col-md-1 col-lg-1"><%=list.get(i).getbNum()%></span>
			<span class="category col-xs-2 col-sm-2 col-md-2 col-lg-1">[<%=list.get(i).getContentCategory()%>]</span>
			<span class="col-xs-9 col-sm-9 col-md-9 col-lg-10"><%=list.get(i).getbTitle()%></span>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-8 col-lg-offset-2 boardContent">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<i class="fa fa-question-circle" style="font-size: 20px; color: red"></i>&nbsp;<%=list.get(i).getbTitle()%>
				</div>

				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<hr class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="background: lightgray">
				</div>

				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<i class="fa fa-smile-o" style="font-size: 20px; color: black"></i>&nbsp;<%=list.get(i).getbContent()%>
				</div>
			</div>
		</div>
		<%}%>
	
	
	</div>

	<script>
		// 목록에 마우스 올려놓으면 색깔 바뀌게 하는 함수
		$('.boardList').hover(function() {
			$(this).css('cursor', 'pointer');
			$(this).css({
				background : 'lightblue'
			});
		}, function() {
			$(this).css({
				background : 'white'
			});
		});

		//목록을 클릭하면 내용이 보이게 하는 함수
		$('.boardList').click(function() {
			$(this).next('.boardContent').slideToggle(600, function() {
			});

			$(this).toggleClass('highlight');
		});

		$('.buttons .btn').click(function() {
			console.log($(this).text());	
			if($(this).text() == '전체보기'){
				$('.boardList').css('display', 'inline-block');
			}else{		
			
			for (var i = 0; i < $('.boardList').length; i++) {						
				if ($('.boardList').eq(i).children('.category').text() == "["+$(this).text()+"]") {
					$('.boardList').eq(i).css('display','inline-block');
				} else {
					$('.boardList').eq(i).css('display', 'none');
				}						
			}
			}
		});

		/* //전체보기 버튼
		$('.buttons .btn:first-child').click(function(){
			$('.boardList').css('display','inline-block');
		});
		
		//주문버튼
		$('.buttons .btn:nth-child(2)').click(function(){
			for(var i = 0; i<$('.boardList').length; i++){
				console.log($('.boardList').eq(i).children('.category').text());
				if($('.boardList').eq(i).children('.category').text()=='[주문]'){
					console.log('난 주문이다');
				}else{
					$('.boardList').eq(i).css('display','none');
				}
			}
			
		});
		
		//결제버튼
		$('.buttons .btn:nth-child(3)').click(function(){
			for(var i = 0; i<$('.boardList').length; i++){
				console.log($('.boardList').eq(i).children('.category').text());
				if($('.boardList').eq(i).children('.category').text()=='[결제]'){
					console.log('난 결제다');
				}else{
					$('.boardList').eq(i).css('display','none');
				}
			}
			
		});
		
		//배송버튼
		$('.buttons .btn:nth-child(4)').click(function(){
			for(var i = 0; i<$('.boardList').length; i++){
				console.log($('.boardList').eq(i).children('.category').text());
				if($('.boardList').eq(i).children('.category').text()=='[배송]'){
					console.log('난 배송이다');
				}else{
					$('.boardList').eq(i).css('display','none');
				}
			}
		});
		
		//쿠폰버튼
		$('.buttons .btn:nth-child(5)').click(function(){
			
		});
		
		//교환/환불버튼
		$('.buttons .btn:nth-child(6)').click(function(){
			
		});
		
		//회원버튼
		$('.buttons .btn:nth-child(7)').click(function(){
			
		});
		
		//상품버튼
		$('.buttons .btn:nth-child(8)').click(function(){
			
		}); */
	</script>






	<%@include file="/views/common/footer.jsp"%>
</body>
</html>