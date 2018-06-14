<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String memberId = (String) request.getAttribute("memberId");
	String memberPwd = (String) request.getAttribute("memberPwd");
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>아이디/비밀번호 찾기</title>
<style>
#container {
	width: 300px;
	height: 300px;
}

#login {
	margin: auto;
	padding: auto;
	width: 100%;
	text-align: center;
}

#all {
	border: 1px solid black
}
/*id_비밀번호 찾기*/
#wrap {
	text-align: center;
}

.content {
	width: 50%;
	overflow: hidden;
	margin: auto;
	padding: 10px;
}

.align-center {
	text-align: center;
}

.id_pw_srh {
	width: 100%;
	overflow: hidden;
	list-style: none;
}

.id_pw_srh li {
	float: left;
	width: 100%;
}

.id_pw_srh li .srh_box {
	padding: 23px 41px 34px;
	font-family: 'Malgun Gothic', '맑은 고딕';
	border: 1px solid black;
	border-top: none;
}

.id_pw_srh li .srh_box .srh_top {
	text-align: center;
	font-size: 25px
}

.id_pw_srh li .srh_box .info {
	margin-top: 24px;
	padding-top: 20px;
	border-top: 1px dashed #d2d2d2;
}

.id_pw_srh li .srh_box .info label {
	display: inline-block;
	width: 83px;
	margin-right: 12px;
	vertical-align: middle;
	font-weight: 900;
	font-size: 13px;
	color: #333333
}

.id_pw_srh li .srh_box .info p {
	margin-bottom: 30px;
}

.id_pw_srh li .srh_box .info p input {
	width: 167px;
	height: 21px;
	border: 1px solid #d4d6d6
}

#header {
	width: 100%;
}

#if {
	width: 50%;
	height: 100px;
	font-size: 50px;
	font-family: 'Malgun Gothic', '맑은 고딕';
	border: 1px solid black;
}

#wf {
	width: 50%;
	height: 100px;
	font-size: 50px;
	font-family: 'Malgun Gothic', '맑은 고딕';
	border: 1px solid black;
}
</style>


<!-- <script>
       
<script>
        $(‘#id ’).on('click', function() {
            $(‘#ID값 .클래스값’).css('display', 'block');
            $(‘#ID값 .크래스값’).css('display', 'none');
        });
        $(#SHOW GROUP’).on('click', function() {
            $('#ID값 .크래스값').css('display', 'none');
            $('#ID값 .크래스값').css('display', 'block');
        });

    </script>
    </script> -->



<script>
	function idFind() {
		$('#pwSearch').hide();
		$('#idSearch').show();
		$('#if').css('border-bottom', 'none');
		$('#wf').css('border-bottom', '1px solid black');
		$('#if').css('border-right', 'none');
		$('#wf').css('border-left', '1px solid black');
	}
	function pwFind() {
		$('#idSearch').hide();
		$('#pwSearch').show();
		$('#wf').css('border-bottom', 'none');
		$('#if').css('border-bottom', '1px solid black');
		$('#wf').css('border-left', 'none');
		$('#if').css('border-right', '1px solid black');
	}

	function chk_idform() {
		if (joinForm.me_id.value == "") {
			alert("값을 입력해 주세요.");
			joinForm.me_id.focus();
			return false;
		}

		else if (joinForm.me_name.value == "") {
			alert("값을 입력해 주세요.");
			joinForm.me_name.focus();
			return false;
		} else if (joinForm.userName.value == "") {
			joinForm.userName.focus();
			return false;
		}

		else
			return true;

	}
</script>
</head>


<body>
	<%@include file="/views/common/header.jsp"%>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div id="wrap">

		<div class="content">

			<div class="agree" style="margin: auto;">
				<ul class="id_pw_srh">
					<table id="header">
						<tr>
							<td id="if" class="btn" onclick="idFind()"
								style="cursor: pointer">아이디 찾기</td>

							<td id="wf" class="btn" onclick="pwFind()"
								style="cursor: pointer">비밀번호 찾기</td>
						</tr>
					</table>
					<li>
						<div class="srh_box or" id="idSearch">
							<div class="srh_top">
								내정보에 등록한 정보로<br> 아이디를 찾을 수 있습니다.
							</div>
							<div class="info">
								<form name="id_form" method="post"
									action="<%=request.getContextPath()%>/idSearch.me">
									<input type="hidden" name="s_type" value="id">
									<fieldset style="box-sizing: content-box;">
										<p>
											<label for="id_name">이름</label><input type="text"
												name="me_name" id="id_name" required="required"
												title="이름 입력">
										</p>
										<p>
											<label for="id_mobile">휴대폰번호</label> <select name="me_hp1">
												<option value="">선택</option>
												<option value="010">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="018">018</option>
												<option value="019">019</option>
											</select> - <input type="text" name="me_hp2" id="id_mobile1"
												title="휴대폰번호 입력" required="required" style="width: 44px;">
											- <input type="text" name="me_hp3" id="id_mobile2"
												required="required" title="휴대폰번호 입력" style="width: 43px;">
										</p>
										<p>
											<label for="id_mail">가입시 이메일</label> <input type="text"
												name="me_email" id="id_mail1" required="required"
												title="가입시 이메일 입력">
										</p>
										<button type="submit" class="btn-lg btn-warning"
											style="width: 145px; margin: 26px auto 0; padding: 7px 0;">찾기</button>
									</fieldset>
								</form>
							</div>
						</div>

					</li>
					<li>
						<div class="srh_box br" id="pwSearch">
							<div class="srh_top">
								내정보에 등록한 정보로<br> 비밀번호를 재설정할 수 있습니다.
							</div>
							<div class="info">
								<form name="pw_form" method="post"
									action="<%=request.getContextPath()%>/pwSearch.me">
									<input type="hidden" name="s_type" value="pw">
									<fieldset>
										<p>
											<label for="pw_name">ID</label> <input type="text"
												name="me_id" id="pw_id" required="required" title="아이디 입력">
										</p>
										<p>
											<label for="pw_phone">이름</label> <input type="text"
												name="me_name" id="pw_name" required="required"
												title="이름 입력">
										</p>
										<p>
											<label for="pw_mail">가입시 이메일</label> <input type="text"
												name="me_email" id="pw_mail2" required="required"
												title="가입시 이메일 입력">
										</p>
										<button type="submit" class="btn-lg  btn-warning"
											style="width: 145px; margin: 26px auto 0; padding: 7px 0;">찾기</button>
									</fieldset>
								</form>
							</div>
						</div>
						<div>
							<p>
								<label> <%if(memberId != null){
		                        	if(memberId.equals("해당 정보가 틀렸습니다")){%> <%-- <%=memberId %> --%>
									<script>
		                        	alert('해당 정보가 틀렸습니다.');
		                        	</script> <% }else{%> <script>
		                        	alert('회원 아이디는 <%=memberId %>입니다.');
		                        	</script> <%}
		                        }%> <%if(memberPwd != null){
		                        if(memberPwd.equals("비밀번호찾기 정보가 틀렸습니다")){ %> <%-- <%=memberPwd %>. --%>
									<script>
		                        	alert('비밀번호찾기 정보가 틀렸습니다.');
		                        	</script> <%} }%>

								</label>
					</li>
			</div>
			</ul>
		</div>
	</div>
	</div>

	<%@include file="/views/common/footer.jsp"%>
	<script>
		$(function() {
			$('#pwSearch').hide();
		});
	</script>
</body>

</html>