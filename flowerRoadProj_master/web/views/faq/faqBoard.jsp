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
@media (max-width: 1200px){ 
       .container{
          width: 767px;
       }
       .container-fluid{
          width: 767px;
       }
} 
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
	text-align: center;
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
	</div>
	<div class="col-xs-8 col-sm-8 col-md-10 col-lg-8 col-xs-offset-1 col-sm-offset-1 col-md-offset-1 col-lg-offset-2 location container-fluid">
		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-2">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">&nbsp;</div>
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">&nbsp;</div>
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">&nbsp;</div>
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="loc">FAQ</div>
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">&nbsp;</div>
		</div>			
		<img src="<%=request.getContextPath()%>/resources/images/footerMenu/fullFlower.jpg" 
		alt="" class="col-xs-9 col-sm-9 col-md-9 col-lg-10" style="height: 7em;"/>
	</div>
	
	
	
		<div class="col-xs-10 col-sm-10 col-md-10 col-lg-8 col-sm-offset-1 col-md-offset-1 col-lg-offset-2 buttons bottom-margin container-fluid">
			<div class="col-xs-1 col-sm-1 col-lg-2 col-md-1">&nbsp;</div>
			<button class="col-xs-2 col-sm-2 col-md-2 col-lg-2 btn btn-primary">전체보기</button>
			<button class="col-xs-2 col-sm-2 col-md-2 col-lg-2 btn btn-success">주문</button>
			<button class="col-xs-2 col-sm-2 col-md-2 col-lg-2 btn btn-success">결제</button>
			<button class="col-xs-2 col-sm-2 col-md-2 col-lg-2 btn btn-success">배송</button>
			<br><br>
			<div class="col-xs-1 col-sm-1 col-lg-2 col-md-1">&nbsp;</div>
			<button class="col-xs-2 col-sm-2 col-md-2 col-lg-2 btn btn-success">쿠폰</button>
			<button class="col-xs-2 col-sm-2 col-md-2 col-lg-2 btn btn-success">교환/환불</button>
			<button class="col-xs-2 col-sm-2 col-md-2 col-lg-2 btn btn-success">회원</button>
			<button class="col-xs-2 col-sm-2 col-md-2 col-lg-2 btn btn-success">상품</button>
		</div>
		

		<!-- 여기는 게시판이 들어갈 곳이다 -->

		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-10 col-lg-offset-1 container-fluid" id="boardTop">
			<span class="col-xs-1 col-sm-1 col-md-1 col-lg-1">번호</span>
			<span class="col-xs-2 col-sm-2 col-md-2 col-lg-1">분류</span>
			<span class="col-xs-9 col-sm-9 col-md-9 col-lg-10">제목</span>
		</div>
		<%for (int i = 0; i < list.size(); i++) {%>
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-10 col-lg-offset-1 boardList container-fluid">
			<span class="col-xs-1 col-sm-1 col-md-1 col-lg-1"><%=list.get(i).getbNum()%></span>
			<span class="category col-xs-2 col-sm-2 col-md-2 col-lg-1">[<%=list.get(i).getContentCategory()%>]</span>
			<span class="col-xs-9 col-sm-9 col-md-9 col-lg-10"><%=list.get(i).getbTitle()%></span>
		</div>
		
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-10 col-lg-offset-1 boardContent container-fluid">
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
			$(this).next('.boardContent').slideToggle(600, function(){
			});
			
			$(this).toggleClass('highlight');
		});

		$('.buttons .btn').click(function() {
			console.log($(this).text());
			$('.boardContent').css('display','none');
			$('.boardList').removeClass('highlight');
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
			$('.buttons .btn').removeClass('btn-primary').addClass('btn-success');			
			$(this).addClass('btn-primary');
			$(this).removeClass('btn-success');
			
			
		});
	
	</script>

<div class="col-xs-12 col-sm-12 col-lg-12 col-lg-12">
<br />
</div>

<hr class="col-xs-12 col-sm-12 col-lg-12 col-lg-12"/>

<div class="col-xs-12 col-sm-12 col-lg-12 col-lg-12">
<br />
</div>


	<%@include file="/views/common/footer.jsp"%>
</body>
</html>