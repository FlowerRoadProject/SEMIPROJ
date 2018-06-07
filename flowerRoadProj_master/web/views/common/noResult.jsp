<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String keyword = request.getParameter("keyword");
    %>
<html>
<head>
<title>상품 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.js"></script>
<style>

.inner-div
{
     margin: auto;
     width: 600px;
     height: 300px;  
     text-align:center;
     vertical-align: middle;
     padding-top:px;
}

.test{
	border:1px solid;
}

.question_mark{
	font-size:2em;
}

.margin_top30{
	margin-top:30px;
}

</style>

<script>
$(function(){
	
	$('#toBack').on("click",function(){
		window.history.back();
		
	});
	
});

	
</script>


</head>
<body>
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<%@include file="../common/header.jsp"%>



<div class="outer-div">
	<div class="inner-div"> 
		<span class="glyphicon glyphicon-question-sign question_mark"></span><h3><b>"<%=keyword %>"</b>에 대한 검색 결과를 찾을 수 없습니다.</h3>
			
			<button id="toBack" class="btn btn-default margin_top30">이전 화면으로</button>
	</div>
	

</div>



<%@include file="../common/footer.jsp"%>
</body>
</html>