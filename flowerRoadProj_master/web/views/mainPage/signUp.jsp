<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
	#ckZip, #joinBtn {
		background:yellowgreen;
	}
</style>
</head>
<body>
<%@include file = "/views/common/header.jsp" %>
<br /><br /><br /><br /><br /><br />
<form class="form-horizontal" style="text-align:center;">
                <!--<p class="txt_notice">정보를 정확히 입력해주셔야 아이디나 비밀번호 분실 시 찾으실 수 있습니다. </p>
-->
                <div class="form-group">
                    <label for="Id" class="col-sm-2 control-label">아이디</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="userId" name="userId" placeholder="아이디" required="required">
                    </div>
                </div>
                <div class="form-group" class="col-sm-3 col-md-3 col-lg-3">
                    <label for="Password" class="col-sm-2 control-label">비밀번호</label>
                    <div class="col-sm-6">
                        <input type="password" class="form-control" id="userPwd"  name="userPwd" required="required" placeholder="비밀번호">
                        <p class="help-block">숫자, 특수문자 포함 8자 이상</p>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="PasswordCheck" class="col-sm-2 control-label">비밀번호 확인</label>
                    <div class="col-sm-6">
                        <input type="password" class="form-control" id="userPwd2" name="userPwd2" placeholder="비밀번호 확인">
                        <p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
                    </div>
                </div>

                <div class="form-group">
                    <label for="Name" class="col-sm-2 control-label">이름</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" maxlength="5" name="userName" required="required" placeholder="이름">
                    </div>
                </div>
                <div class="form-group">
                <label for="gender" class="col-sm-2 control-label">성별</label>
                <div class="col-sm-2">
               			 <input type="radio" name="gender" value="M">남성 &nbsp;
						<input type="radio" name="gender" value="F">여성 &nbsp;
				</div>
                </div>
                <div class="form-group">
                    <label for="inputBirthday" class="col-sm-2 control-label">생일</label>
                    <div class="col-sm-6">
                        <input type="date" class="form-control" id="inputBirthday" placeholder="생일">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label">이메일</label>
                    <div class="col-sm-6">
                        <input type="email" class="form-control" id="inputEmail" placeholder="이메일">
                    </div>
                </div>
                <div class="form-group">
					<label for="address" class="col-sm-2 control-label">우편번호</label>
					
	                <div class="col-sm-4">
						<input type="text" id="zipCode" name="zipCode" style="width: 100%; height:100%">
					</div>
					<div class="col-sm-1">
						<div id="ckZip" onclick="addrSearch();">검색</div>
					</div>
				</div>
				<div class="form-group">
					<label for="address1" class="col-sm-2 control-label">주소</label>
					<div class="col-sm-6">
					<input type="text" id="address1" class="form-control" name="address1">
					</div>
				</div>
				<div class="form-group">
					<label for="address1" class="col-sm-2 control-label">상세주소</label>
					<div class="col-sm-6">
					<input type="text" id="address2" class="form-control" name="address2">
					</div>
				</div>
                <div class="form-group">
                    <label for="inputNumber" class="col-sm-2 control-label">휴대폰번호</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="inputNumber" placeholder="휴대폰번호">
                        <p class="help-block">- 없이 적어주세요.</p>
                    </div>
                    <div class="col-sm-2">
                        <a class="btn btn-default" href="#" role="button" id="certBtn">인증번호 전송</a>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputNumberCheck" class="col-sm-2 control-label">인증번호 확인</label>

                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="inputNumberCheck" placeholder="인증번호 6자리">
                        <p class="help-block">전송된 인증번호를 입력해주세요.</p>
                    </div>
                    <div class="col-sm-2">
                        <a class="btn btn-default" href="#" role="button" id="confirmBtn">인증번호 확인</a>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputAgree" class="col-sm-2 control-label">약관 동의</label>
                    <div class="col-sm-6 checkbox">
                        <label>
        <input id="agree" type="checkbox"> <a href="/agreement"> 이용약관</a>에 동의합니다.
    </label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label"></label>
                    <div class="col-sm-6">
                        <button type="submit" class="btn btn-primary" href="./login.html">회원가입</button>
                    </div>
                </div>
            </form>
            
            <script>
            function addrSearch() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var fullAddr = ''; // 최종 주소 변수
		                var extraAddr = ''; // 조합형 주소 변수

		                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    fullAddr = data.roadAddress;

		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    fullAddr = data.jibunAddress;
		                }

		                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
		                if(data.userSelectedType === 'R'){
		                    //법정동명이 있을 경우 추가한다.
		                    if(data.bname !== ''){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있을 경우 추가한다.
		                    if(data.buildingName !== ''){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
		                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
		                }

		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                $('#zipCode').val(data.zonecode); //5자리 새우편번호 사용
		                
		                $('#address1').val(fullAddr);

		                // 커서를 상세주소 필드로 이동한다.
		                $('#address2').focus();
		            }
		        }).open();
		    };
            </script>
<%@include file = "/views/common/footer.jsp" %>
</body>
</html>