<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%
	String msg = (String)request.getAttribute("msg");

	if(msg==null){
		msg="잘못된 접근입니다.";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 발생!</title>
<style>
@media (max-width: 767px){ 
    .container{
       width: 750px;
    }
}
.frame{
background-image: url("<%=request.getContextPath()%>/resources/images/errorPage/wallpaper2.jpg");
background-repeat: no-repeat;
background-size: 100% 100%;
height: 55em;

}

#surprised{
	height: 20em;
	width: 20em;
	
}
.headMsg{
	font-size: 3em;
	
}
.detailMsg{
	font-size:1.8em;
	color: red;
}
.commonMsg{
	font-size: 1.5em;
}
.bottom-margin{
	margin-bottom: 1.5em;
}
.test-border{
	border: 1px solid black;		
}
.top-margin{
	margin-top: 2.1em;
}
#toMain{
	background:#98DFD8;
	border: none;
	color: black;
	width: 10em;
}
#toQuest{
	background:#AB95D4;
	border: none;
	color: black;
	width: 10em;
}


</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	
	<div class="container-fluid frame">	
	
		<div class="col-lg-9 col-lg-offset-2">
		<div class="col-lg-12 headMsg top-margin bottom-margin" align="right">
		죄송합니다<br> 요청하신 페이지를 찾을 수 없습니다
		</div>	
		<%-- <div class="col-lg-12 bottom-margin" align="right">
		<img src="<%=request.getContextPath()%>/resources/images/errorPage/surprised.png" alt="놀라는표정" id="surprised"/>
		</div> --%>
		<div class="col-lg-12 commonMsg bottom-margin" align="right">
		<span class="detailMsg"><%=msg %></span><br /><br />
		같은 문제가 반복적으로 발생할 경우 1:1문의를 통해 관리자에게 문의해주세요		
		</div>
		
		<div class="col-lg-12 text-center" style="margin-top:15em;">
			<button class="btn btn-primary btn-lg" id="toMain">메인으로</button>
			<button class="btn btn-success btn-lg" id="toQuest">1:1문의</button>
		</div>		
		</div>
	</div>
	<script>
	$('#toMain').on('click',function(){
		location.href="<%=request.getContextPath()%>/main.jsp";
	});
	$('#toQuest').on('click',function(){
		location.href="<%=request.getContextPath()%>/oneBoard.me";
	});
		<%-- location.href="<%=request.getContextPath()%>/" --%>
	
	</script>	
	
	
	
	<%@ include file="footer.jsp" %>
</body>
</html>