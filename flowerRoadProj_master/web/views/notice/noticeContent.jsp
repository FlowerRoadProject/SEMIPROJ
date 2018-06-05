<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.fr.jsp.board.model.vo.*"%>
<%
	NoticeBoard notice = (NoticeBoard)request.getAttribute("notice");
	
%>
    
    
<!DOCTYPE html>
<html>
<head>

<script	src="<%=request.getContextPath()%>/resources/js/jquery-1.12.2.min.js"></script>
<style>
@media ( max-width : 767px) {
	.container {
		width: 750px;
	}
}
.test-border{
	border: 1px solid black;
}
.nTitle{
	height: 3em;
	background: lightgray;
	border-top: 2px solid gray;
	padding: 0.8em;
	font-size: 1.3em;
	font-weight: bold;
	text-align: center;
}
.subRow{
	height: 2em;
	border-bottom: 1px solid lightgray;
	padding-top: 0.25em;
}
.content{
	padding-top: 2.1em;
	padding-bottom: 2.1em;
}

</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/views/common/header.jsp" %>
	<br />	<br />	<br />	<br />	<br />	<br />	<br />	<br />	<br />	<br />	<br />	<br />
	<div class="container">
		<div class="col-lg-12 nTitle">
			<%=notice.getbTitle() %>
		</div>
		<div class="col-lg-12 subRow">
			<div class="col-lg-3">등록일: <%=notice.getSubmitDate() %></div>
			<div class="col-lg-3 col-lg-offset-6" style="text-align: right">조회수: <%=notice.getViewNum() %></div>			
		</div>
		<div class="col-lg-10 col-lg-offset-1 content">
			<%=notice.getbContent() %>
		</div>
		<hr class="col-lg-12"/>
		<div class="col-lg-10">&nbsp;</div>
		<%-- <%if(memberNum.substring(0, 1).equals("A")){ %> --%>
		<div class="col-lg-1">
			<form action="<%=request.getContextPath()%>/sendUpdate.no" method="get">
				<button class="btn btn-primary" type="submit">수정하기</button>
				<input type="hidden" name="bNum" id ="bNum" value="<%=notice.getbNum() %>" />		
			</form>
		</div>
		<%-- <%} %> --%>
		<div class="col-lg-1">
			<form action="<%=request.getContextPath()%>/showNotice.no" method="get">
			<button class="btn btn-default" id="toList">목록으로</button>
			
			</form>
		</div>
	</div>
	
	<script>
		
		$(function(){
			<%-- console.log("멤버는? : "+"<%=memberNum%>");
			console.log("서브스트링은? : "+"<%=memberNum.substring(0, 1)%>"); --%>
			console.log("bNum은..?: "+ $('#bNum').val());
		})
		
	</script>
	



	<%@include file="/views/common/footer.jsp" %>
</body>
</html>