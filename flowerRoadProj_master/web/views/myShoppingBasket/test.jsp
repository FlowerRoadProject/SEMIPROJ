<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <script src="../../resources/js/jquery-1.12.2.min.js"></script>
</head>
<body>
	<form action="<%=request.getContextPath() %>/select.bk" method="post">
		<button id="start" type="submit">시작한다</button>
		<input type="hidden" name="member_num" value="M001"/>
	</form>
	<div><%=request.getAttribute("msg") %></div>
</body>
</html>