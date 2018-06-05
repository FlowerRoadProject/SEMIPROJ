<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<!-- Meta, title, CSS, favicons, etc. -->
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<title>Walk Together Along the Flower Road </title>
		<!-- admin_JS -->
		<%@ include file="common/admin_JS.jsp" %>
		<!-- admin_CSS -->
		<%@ include file="common/admin_CSS.jsp" %>
	</head>
	<body>
		<!-- admin_LOADING -->
		<%@ include file="common/admin_LOADING.jsp" %>
		
		<input type="text" name="adminNum" id="adminNum"/>
		<input type="button" value="퀴즈풀기" id="adminQuiz"/>
		<a href="<%=request.getContextPath() %>/main.admin" id="admin_Main"></a>
		
		<script>
		$('#adminQuiz').on({
			'click':function(){
				var answerPw = window.prompt('제일 존경하는 인물은?');
				$.ajax({
					url: "<%=request.getContextPath() %>/secondPwCheck.admin",
					type: "post",
					data: {
						adminNum: $('#adminNum').val(),
						answerPw: answerPw
					},
					success: function(data){
						if(($.trim(data.secondPw))==answerPw){
							alert(data.memberName+" 관리자님 어서오세요.");
							admin_Main.click();
						}else{ 
							alert("누구냐 넌..");
						}
					},
					error: function(data){
						alert("전달 실패!!");
					}
				})
			}
		});
			
		</script>
	</body>
</html>