<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>테스트페이지</title>

<!-- 부트스트랩 -->
<link href="<%=request.getContextPath()%>/resources/css/bootstrap.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>


<style>
/*xs 사이즈 이하면 컨테이너 사이즈 고정*/
@media ( max-width :769px) {
	.container {
		width: 730px;
	}
}

.test {
	border: 1px solid;
}

.img_size {
	width: auto;
	height: auto;
}

.icon_outer {
	
	border: 1px solid beige;
}

.align_center {
	text-align: center;
}

.icon_font {
	color: grey;
	font-weight: bold;
	font-size: 1.1em;
}

.margin_center {
	margin-left: auto;
	margin-right: auto;
}


.icon_hover{
	
	transition: background-color 0.4s ease-in-out;
	
}

.icon_hover:hover{
	background: floralwhite;
	
}

</style>


<script>
	$(function(){
		
		console.log(test);
		
		test();
	});

</script>


</head>
<body>

<div style="display:none;">
	<div class="visible-lg">lg입니다!</div>
	<div class="visible-md">md입니다!</div>
	<div class="visible-sm">sm입니다!</div>
	<div class="visible-xs">xs입니다!</div>
</div>
	
	<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  Launch demo modal
</button>
	
	
	<%@ include file="../common/loginModal.jsp" %>


	
</body>
</html>