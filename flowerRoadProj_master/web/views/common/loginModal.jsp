<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String url = (String)request.getAttribute("javax.servlet.forward.request_uri");
	if(url!=null){
		String query = (String)request.getAttribute("javax.servlet.forward.query_string");
		if(query==null)
			request.getSession().setAttribute("lastUrl",url);
		else
			request.getSession().setAttribute("lastUrl",url+"?"+query);
	}

%>

<html>
<head>
<title>로그인 모달</title>

</head>
<body>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><span class="glyphicon glyphicon-exclamation-sign"></span>로그인이 필요합니다.</h4>
      </div>
      	<div class="modal-body" >
      		<img src="<%=request.getContextPath()%>/resources/images/login.gif" alt="" style=' max-width: 100%; '/>
      	</div>
      
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" id="toLogin">로그인하기</button>
      </div>
    </div>
  </div>
</div>

</body>
<script>
	$('#toLogin').on('click',function(){
		
		location.href='<%=request.getContextPath()%>/views/mainPage/login.jsp';
	});

</script>

</html>