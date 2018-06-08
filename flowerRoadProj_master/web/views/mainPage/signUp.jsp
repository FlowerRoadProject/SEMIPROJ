<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <title>회원가입</title>

    <style>
        .M_box {
            width: 30%;
            margin: auto;
            padding: auto;
        }

        .td1 {
            width: 130px;
            height: 50px;
        }

        .td2 {
            width: 350px;
            align-content: center;
            margin-left: auto;
            margin-right: auto;
        }

        .td3 {
            width: 130px;
            text-align: center;
        }

    </style>
    <%@include file="/views/common/header.jsp" %>
     <script>
     $(document).ready(function() {
    	 var msg = "<%=msg%>";
    	 if(msg != "null"){
    	 	alert(msg);	
    	 }
    	 });
    </script>    
</head>

<body>

    <br><br><br><br><br><br><br><br>
    <!-- <p class="txt_notice">정보를 정확히 입력해주셔야 아이디나 비밀번호 분실 시 찾으실 수 있습니다. </p> -->
    
    <div class="M_box">
        <div class="srh_top">
            <h2>회원 가입</h2>
        </div>
        <!--  -->
       <form id="f" action="<%=request.getContextPath()%>/mInsert.me" method="post" >
        <table>
            <tr>
                <td class="td1"><label for="inputId" class="control-label">아이디</label></td>
                <td class="td2"><input type="text" class="form-control" name="my_id" id="my_id" placeholder="아이디"></td>
                <td class="td3">
                    <a class="btn btn-default" role="button" id="idCheck">아이디 중복</a></td>
            </tr>
            <tr>
                <td class="td1"><label for="inputPassword" class="control-label">비밀번호</label></td>
                <td class="td2" colspan="2"><input type="password" class="form-control" name="my_pwd" id="my_pwd" placeholder="비밀번호"></td>
            </tr>
            <tr>
                <td class="td1"><label for="inputPasswordCheck" class="control-label">비밀번호 확인</label></td>
                <td class="td2" colspan="2"><input type="password" class="form-control" name="my_pwd1" id="my_pwd1" placeholder="비밀번호 확인"></td>
            </tr>
            <tr>
                <td class="td1"><label for="inputName" class="control-label">이름</label></td>
                <td class="td2" colspan="2"><input type="text" class="form-control" name="my_name" id="my_name" placeholder="이름"></td>
            </tr>
            <tr>
                <td class="td1"><label for="gender" class="control-label">성별</label></td>
                <td class="td2" colspan="2">
                    <div class="col-lg-6 col-mg-6 col-sm-6"><input type="radio" id="man" name="my_gender" value="M">
                        <lable for="male">남성</lable>
                    </div>
                    <div class="col-lg-6 col-mg-6 col-sm-6"><input type="radio" id="woman" name="my_gender" value="F">
                        <lable for="female">여성</lable>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="td1"><label for="inputBirthday" class="control-label">생일</label></td>
                <td class="td2" colspan="2"><input type="date" class="form-control" name="my_birth" id="my_birth" placeholder="생일"></td>
            </tr>
           
			<tr>
                <td class="td1"><label for="inputEmail" class="control-label">이메일</label></td>
                <td class="td2"><input type="email" class="form-control" name="my_email" id="my_email" placeholder="이메일"></td>
                <td class="td3"><a class="btn btn-default" role="button" id="emailbtn">이메일인증번호 전송</a></td>
            </tr>
            <tr>
                <td class="td1"><label for="inputEmailCheck" class="control-label">이메일 인증번호 확인</label></td>
                <td class="td2"><input type="text" class="form-control" id="emailCheck" placeholder="인증번호 6자리"></td>
                <td class="td3"><a class="btn btn-default" role="button" id="confirmEmail">인증번호
				확인</a></td>
            </tr>
            <tr>
                <td class="td1"><label for="address" class="control-label">우편번호</label></td>
                <td class="td2"><input type="text" class="form-control" id="zipCode" name="zipCode"></td>
                <td class="td3"><a class="btn btn-default" id="ckZip" onclick="addrSearch();">검색</a></td>
            </tr>
            <tr>
                <td class="td1"><label for="address1" class="control-label">주소</label></td>
                <td class="td2" colspan="2"><input type="text" id="address1" class="form-control" name="address1"></td>
            </tr>
            <tr>
                <td class="td1"><label for="address1" class="control-label">상세주소</label></td>
                <td class="td2" colspan="2"><input type="text" id="address2" class="form-control" name="address2"></td>
            </tr>

            <tr>
                <td class="td1"><label for="inputNumber" class="control-label">휴대폰번호</label></td>
                <td class="td2" colspan="2"><input type="text" class="form-control" name="my_phone" id="my_phone" placeholder="휴대폰번호"></td>
               
            </tr>
            <tr colspan="3">
                <td class="td1"></td>
                <td class="td3"><label for="inputAgree" class="control-label">약관 동의</label>
                    <input id="agree" type="checkbox" name="my_agree">
                    <label><a href="/agreement">이용약관</a>에 동의합니다.</label></td>
                <td></td>
            </tr>
            <tr>
                <td class="td1"></td>
                <td class="td3"><button type="submit" id="btn_join" class="btn btn-primary" >회원가입</button></td>
                <td></td>
            </tr>
            
        </table>
        </form>
    </div>
    <%@include file = "/views/common/footer.jsp" %>
    <script>		
    $(document).ready(function() {
		 
    	var idCheck=false;
    	var emailNum="";
    	var emailCheck=false;
    	
    	$('#my_id').on('input',function(e){
    		if(idCheck)
    			alert('아이디 중복확인후 아이디를 바꾸시면 안됩니다.. 다시 중복확인해주세요');
    		 idCheck=false;
     		//console.log(idCheck);
    		});
    	
    	$('#emailbtn').click(function(){
    		var email=$('#my_email').val();
    		if($('#my_email').val()==""){
    			alert('이메일값을 입력해주세요');
    		}else{
    		$.ajax({
				url : "<%=request.getContextPath()%>/emailSend.me?email="+email,
				data : { email : $('#my_email').val()},
				type : "GET",
				success : function(data){
						alert("이메일로 인증번호를 보냈습니다.");
						emailNum=($.trim(data));
						console.log($.trim(data));
				},error : function(){
					alert("데이터 전달 실패");
				}
			});
    		}
    	});
    	$("#confirmEmail").click(function(){
    		console.log($('#emailCheck').val());
    		if($('#emailCheck').val()==""){
    			alert('인증번호 값을 입력해주세요');
    		}else if($('#emailCheck').val()==emailNum){
    			alert('인증성공!');
    			emailCheck=true;
    		}else{
    			alert('인증 실패!');
    			emailCheck=false;
    		}
    	});
    		
	    $("#btn_join").click(function() {
	    	var getName= RegExp(/^[가-힣]+$/);//이름 정규식
	    	var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);//이메일 정규식
	    	var getPhone = RegExp(/\d{11}/);
	      
	            if ($("#my_id").val() == "") {
	                alert("아이디를 꼭 입력하세요!");
	                $("#my_id").focus();
	            }else if ($("#my_id").val().length<4 || $("#my_id").val().length>12) {
	                alert("아이디를 4~12자까지 입력해주세요.")
	                $("#my_id").focus();
	                $("#my_id").select();
	           }else if ($("#my_pwd").val() == "") {
	                alert("비밀번호를 꼭 입력하세요!");
	                $("#my_pwd").focus();
	            }else if ($("#my_pwd").val().length<4 || $("#my_pwd").val().length>12) {
	            	alert("비밀번호를 4~12자로 입력해주세요!");
	                $("#my_pwd").focus();
	            }else if ($("#my_pwd1").val() == "") {
	                alert("비밀번호확인 을 꼭 입력하세요!");
	                $("#my_pwd1").focus();
	            } else if ($("#my_pwd").val() != $("#my_pwd1").val()) {
	                alert("비밀번호와 비밀번호 확인이 일치하지않습니다.");
	                $("#my_pwd").val("");
	                $("#my_pwd1").val("");
	                $("#my_pwd").focus();
	            } else if ($("#my_name").val() == "") {
	                alert("이름을 꼭 입력하세요!");
	                $("#my_name").focus();
	            }else if(!getName.test($("#my_name").val())){
		               alert("이름형식에 맞게 입력해주세요");
		               $("#my_name").val("");
		               $("#my_name").focus();
		        }else if(!getMail.test($("#my_email").val())){
		            alert("이메일형식에 맞게 입력해주세요")
		            $("#my_email").val("");
		            $("#my_email").focus();
		        }else if ($("#address1").val() == "") {
	                alert("주소를 꼭 입력하세요!");
	                $("#address1").focus();
	            } else if ($("#address2").val() == "") {
	                alert("주소를 꼭 입력하세요!");
	                $("#address2").focus();
	            } else if ($("#address3").val() == "") {
	                alert("주소를 꼭 입력하세요!");
	                $("#address3").focus();
	            } else if ($("#man").is(':checked') == false && $("#woman").is(':checked') == false) {
	                alert("남자또는 여자를  꼭 선택하세요!");
	            } else if ($("#my_add").val() == "") {
	                alert("이메일을 꼭 입력하세요!");
	                $("#my_add").focus();
	            }else if (!getPhone.test($("#my_phone").val())){
	            	alert("-가 없는 11자리 핸드폰 번호를 입력해주세요");
	            }else if(!idCheck){
	            	alert('아이디 중복확인을 해주세요');
	            	$("#my_id").val("");
		            $("#my_id").focus();
	            }else if(!emailCheck){
	            	alert('이메일 인증확인을 해주세요');
		            $("#inputNumberCheck").focus();
	            }else {
	                $('#f').submit();
	            }
	            event.preventDefault();
	        });
	 
	 
			    
	    
	    $('#idCheck').on('click',function(){
			$.ajax({
				url : "<%=request.getContextPath()%>/checkId.me",
				data : { my_id : $('#my_id').val()},
				type : "GET",
				success : function(data){
					if(data=="아이디가 중복되었습니다."){
						alert(data);
						idCheck=false;
					}else if(data=="아이디가 중복되지 않았습니다."){
						alert(data);
						idCheck=true;
					}else if(data=="아이디를 입력해주세요"){
						alert(data);
						idCheck=false;
					}else{
						alert('뭔가 잘못됨');
					}
				},error : function(){
					alert("데이터 전달 실패");
				}
			});
		});

    });
			    function addrSearch() {
					new daum.Postcode({
						oncomplete : function(data) {
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
							if (data.userSelectedType === 'R') {
								//법정동명이 있을 경우 추가한다.
								if (data.bname !== '') {
									extraAddr += data.bname;
								}
								// 건물명이 있을 경우 추가한다.
								if (data.buildingName !== '') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName : data.buildingName);
								}
								// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
								fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')'
										: '');
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
	
</body>

</html>
