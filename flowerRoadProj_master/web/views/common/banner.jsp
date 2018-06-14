<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
@font-face{ 
	font-family:"flower"; 
	src: url('<%=request.getContextPath()%>/resources/fonts/admin/SangSangFlowerRoad.otf') format('opentype');
}

.ban{
	display: none;
}


@media (min-width: 1650px){

.banner{
	display: inline-block;
	border: 1px solid black;
	position: absolute;		
	right: 10em;
	top: 72em;
	background: #f7a8c7;	
	background-image: url('<%=request.getContextPath()%>/resources/images/background1.jpg');
	background-size: cover;
	width: 10em;
	height: 30em;
			
}
.banner-title{	
	font-size: 3.7em;
	margin-left: 31%; 
	margin-top: 40%;
	width: 1em;
	text-align: center;
	font-family: flower;
	color: white;
	font-weight: bold;
	text-shadow: -10px 5px 30px black;
	
	
}
.banner-content{
	font-family: flower;
	color: white;
	background: black;
	text-align: center;
	margin-top: 115%;
	font-size: 1.5em; 
	
}

}	
</style>
</head>
<div class="ban banner img-responsive">
	<div class="banner-title">
		꽃길	
	</div>
	<div class="banner-content">
		<div>사랑하는사람과</div>
		<div>함께하세요</div>
	</div>
</div>
</html>