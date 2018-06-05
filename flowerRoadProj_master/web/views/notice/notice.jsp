<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.fr.jsp.board.model.vo.*"%>
<% 
	ArrayList<NoticeBoard> list = (ArrayList<NoticeBoard>)request.getAttribute("list");
	PagingTool paging = (PagingTool)request.getAttribute("page");
	
	
	int current = paging.getCurrentPage();
	int end = paging.getEndPage();
	int limit = paging.getLimit();
	int count = paging.getListCount();
	int max = paging.getMaxPage();
	int start = paging.getStartPage();
	
	System.out.println(start);
%>  
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css"> --%>
<script	src="<%=request.getContextPath()%>/resources/js/jquery-1.12.2.min.js"></script>
<%-- <script	src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> --%>
<style>
	@media ( max-width : 767px) {
	.container-fluid {
		width: 750px;
	}
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
.boardList span{
	font-size: 0.9em;
	vertical-align:middle;
}

.boardList span:first-child, .boardList span:nth-child(3), .boardList span:nth-child(4){
	text-align: center;	
}

.boardList span:nth-child(2) {
	text-indent: 2em;
}
</style>


</head>
<body>	
	<%@include file="/views/common/header.jsp" %>
	<br />	<br />	<br />	<br />	<br />	<br />	<br />	<br />	<br />	<br />	<br />	<br />
	<div class="visible-md">
		md
	</div>
	<div class="visible-sm">
		sm
	</div>
	
	
	
	<div class="container-fluid">
		<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xs-offset-1 col-sm-offset-1 col-md-offset-1 col-lg-offset-1" id="boardTop">
			<span class="col-xs-2 col-sm-2 col-md-1 col-lg-1">번호</span> 			
			<span class="col-xs-6 col-sm-6 col-md-6 col-lg-6">제목</span>
			<span class="col-xs-2 col-sm-2 col-md-2 col-lg-2">등록일</span>
			<span class="col-xs-2 col-sm-2 col-md-2 col-lg-2">조회수</span>
			
		</div>
		
		<%-- <input type="hidden" name="memberNum" value="<%=m%>"/> --%>
		
		<%for(int i = 0; i< list.size();i++){ %>		
		<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xs-offset-1 col-sm-offset-1 col-md-offset-1 col-lg-offset-1 boardList">					
			<span class="col-xs-2 col-sm-2 col-md-1 col-lg-1 bNum"><%=list.get(i).getbNum() %></span>			
			<span class="col-xs-6 col-sm-6 col-md-6 col-lg-6"><%=list.get(i).getbTitle() %></span>
			<span class="col-xs-2 col-sm-2 col-md-2 col-lg-2"><%=list.get(i).getSubmitDate() %></span>
			<span class="col-xs-2 col-sm-2 col-md-2 col-lg-2"><%=list.get(i).getViewNum() %></span>			
		</div>		
		<%} %>
		
	</div>
	
	
	
	<!-- 페이지네이션 -->
	<div class="container">
		<div class="col-lg-12" align="center">
			<ul class="pagination">
				
    			<!-- << 버튼 -->
    			<%if(current == 1){ %>
    			<li><span aria-hidden="true">&laquo;</span></li>
    			<%}else{ %>
    			<li><a href="<%=request.getContextPath()%>/showNotice.no?current=1" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
    			<%} %>
    			
    			<!-- 숫자버튼 -->
    			<%for(int i = start; i<=end; i++){ %>
    				<%if(current == i){ %>
    			<li class="active"><a href=""><%=i %><span class="sr-only">(current)</span></a></li>
    				<%}else{ %>
    			<li><a href="<%=request.getContextPath()%>/showNotice.no?current=<%=i%>"><%=i%> <span class="sr-only">(current)</span></a></li>
    				<%} %>
    			<%} %>
    			 
    			<%if(current == max){%>				
 				<li><span aria-hidden="true">&raquo;</span></li>
 				<%}else{ %>
 				<li><a href="<%=request.getContextPath()%>/showNotice.no?current=<%=max %>" aria-label="Previous"><span aria-hidden="true">&raquo;</span></a></li>
 				<%} %>
 			</ul>
 		</div>
	</div>
	
		
	
	<script>
		$('.boardList').hover(function(){
			$(this).css({
				background:'skyblue',
				cursor: 'pointer'
				});			
		},function(){
			$(this).css('background','white');
		});
		
		$('.boardList').click(function(){
			var number = $(this).children('.bNum').text();		
			$('#bNum').val(number);
			location.href="<%=request.getContextPath()%>/noticeContent.no?bNum="+number;
			
		});
		
	</script>
	
	
		
	
	
	
	

	<%@include file="/views/common/footer.jsp" %>
</body>
</html>