<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String keyword = request.getParameter("keyword");
    %>
<html>
<head>
<title>상품 목록</title>

<style>
.outer-div
{
     padding: 30px;
}
.inner-div
{
     margin: auto;
     width: 300px;
     height: 300px;  
     text-align:center;
     vertical-align: middle;
     padding-top:150px;
}

.test{
	border:1px solid;
}

</style>

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
		<b>"<%=keyword %>" </b>에 대한 검색 결과를 찾을 수 없습니다.
	</div>
</div>



<%@include file="../common/footer.jsp"%>
</body>
</html>