<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String category = (String)request.getParameter("category");
%>

<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>테스트페이지</title>

<!-- 부트스트랩 -->
<%-- <link href="<%=request.getContextPath()%>/resources/css/bootstrap.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script> --%>


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



</head>
<body>

<div style="display:none;">
	<div class="visible-lg">lg입니다!</div>
	<div class="visible-md">md입니다!</div>
	<div class="visible-sm">sm입니다!</div>
	<div class="visible-xs">xs입니다!</div>
</div>
	

	<div class="container" id="eventMenu">

		<div class="col-xs-12 ">
			
			<div class="col-xs-6 col-md-4 col-lg-2 icon_hover align_center thumbnail" name="생일">
				<div class="col-xs-12 caption ">
					<h6 class="icon_font ">#생일/축하</h6>
				</div>
				<div>
				<a href="<%=request.getContextPath()%>/productList.do?event=생일">
					<img class=" img-responsive margin_center"
						src="<%=request.getContextPath()%>/resources/images/eventMenu/wedding-cake.png" />
				</a>
				</div>
			</div>
			 
			
			<div class="col-xs-6 col-md-4 col-lg-2 icon_hover align_center thumbnail" name="연인">
				<div class="col-xs-12 caption ">
					<h6 class="icon_font ">#연인/기념일 </h6>
				</div>
				<div>
				<a href="<%=request.getContextPath()%>/productList.do?event=연인">
					<img class=" img-responsive margin_center"
						src="<%=request.getContextPath()%>/resources/images/eventMenu/heart-shape-silhouette.png" />
				</a>
				</div>
			</div>
			
			<div class="col-xs-6 col-md-4 col-lg-2 icon_hover align_center thumbnail" name="부부">
				<div class="col-xs-12 caption ">
					<h6 class="icon_font ">#결혼기념일/부부</h6>
				</div>
				<div>
				<a href="<%=request.getContextPath()%>/productList.do?event=부부">
					<img class=" img-responsive margin_center"
						src="<%=request.getContextPath()%>/resources/images/eventMenu/wedding-rings.png" />
				</a>
				</div>
			</div>
			
			<div class="col-xs-6 col-md-4 col-lg-2 icon_hover align_center thumbnail" name="부모님">
				<div class="col-xs-12 caption ">
					<h6 class="icon_font ">#부모님/생신</h6>
				</div>
				<div>
				<a href="<%=request.getContextPath()%>/productList.do?event=부모님">
					<img class=" img-responsive margin_center"
						src="<%=request.getContextPath()%>/resources/images/eventMenu/family.png" />
				</a>
				</div>
			</div>
			
			<div class="col-xs-6 col-md-4 col-lg-2 icon_hover align_center thumbnail" name="승진">
				<div class="col-xs-12 caption ">
					<h6 class="icon_font ">#승진/개업</h6>
				</div>
				<div>
				<a href="<%=request.getContextPath()%>/productList.do?event=승진">
					<img class=" img-responsive margin_center"
						src="<%=request.getContextPath()%>/resources/images/eventMenu/career.png" />
				</a>
				</div>
			</div>
			
			<div class="col-xs-6 col-md-4 col-lg-2 icon_hover align_center thumbnail" name="근조">
				<div class="col-xs-12 caption ">
					<h6 class="icon_font ">#근조</h6>
				</div>
				<div>
				<a href="<%=request.getContextPath()%>/productList.do?event=근조">
					<img class=" img-responsive margin_center"
						src="<%=request.getContextPath()%>/resources/images/eventMenu/grave.png" />
				</a>
				</div>
			</div>
		
		</div>
	</div>	
		<script>
			$(function(){
				
				var event='<%=category%>';
				
				$("#eventMenu").find('.thumbnail').each(function(){
				
					
					if(event==$(this).attr("name")){
						$(this).css("background","floralwhite");
						return;
					}
				}); 
				
				
			});
		
		</script>
</body>
</html>