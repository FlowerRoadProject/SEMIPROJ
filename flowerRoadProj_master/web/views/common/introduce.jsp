<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@media ( max-width : 992px) {
	.container-fluid {
		width: 969px;
	}	
	
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
.intro{
	margin-bottom: 1.5em;
}
.thumbnail img{
	height: 30em;
	width: 20em;
}
</style>


</head>
<body>
<%@include file="/views/common/header.jsp" %>

	<br /><br /><br /><br /><br />
	<div class="col-lg-8 col-lg-offset-2 container-fluid">	
		<div class="col-lg-10 title">회사소개</div>
	<br>	
	<div class="col-lg-12 location container-fluid">
		Introduce
		<img src="<%=request.getContextPath()%>/resources/images/footerMenu/fullFlower.jpg" alt="" style="height: 7em; width:23.5em;"/>
	</div>
	</div>
	
	
	
	<div class="col-lg-8 col-lg-offset-2 container-fluid test intro">
		
		
	</div>
	
	
	



<%@include file="/views/common/footer.jsp" %>
</body>
</html>