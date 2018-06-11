<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.fr.jsp.member.model.vo.*"%>
<%
	Member m = (Member)session.getAttribute("m");
%>
    

<!DOCTYPE>
<html>
    <head>
        <title>꽃길-정보 수정</title>
        <meta charset="utf-8">
         <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/myInfo.css">
        <script src="<%=request.getContextPath() %>/resources/js/myPage.js"></script>
        <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
        <script>
        	var mainPath = '<%=request.getContextPath() %>';
        </script>
            </head>
    <body>
    <%@ include file="/views/common/header.jsp" %>
        
        <!-- 마이페이지 카테고리  -->
        <br><br><br><br><br><br><br><br><br><br>
        <div class="container-fluid">
            <div class="col-sm-1 col-md-1 col-lg-1"></div>
            <div class="category col-sm-2 col-md-2 col-lg-2" 
                style="font-weight:bold; text-decoration: underline;" id="info" onclick="info();">내 정보</div>
            <div class="category col-sm-2 col-md-2 col-lg-2" id="check" onclick="orderChk();">주문 조회</div>
            <div class="category col-sm-2 col-md-2 col-lg-2" id="favarite" onclick="favorite();">관심 상품</div>
            <div class="category col-sm-2 col-md-2 col-lg-2" id="1on1" onclick="oneToOne();">1:1 문의</div>
            <div class="col-sm-3 col-md-3 col-lg-3"></div> 
        </div>
        <br><br><br><br><br>

        <!-- 정보 수정 창 -->
        <div class="container-fluid">
                <div class="col-sm-2 col-md-2 col-lg-2"><h4><i>정보 수정</i></h4></div>
                <div class="col-sm-10 col-md-10 col-lg-10"></div>
        </div>

        <div>
                <div class="info">
                    
                        <br>
                        <div class="col-sm-1 col-md-1 col-lg-1"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"><b>아이디</b></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"><p class="text-muted" style="font-weight:bold;">
                        <%= m.getMemberId() %></p></div>  <br><br><br>
    
                        <div class="col-sm-1 col-md-1 col-lg-1"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"><b>이름</b></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2">
                        <p class="text-muted" style="font-weight:bold;">
                        <%=m.getMemberName() %></p></div><br><br><br>
    
                        <div class="col-sm-1 col-md-1 col-lg-1"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"><b>이메일</b></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2">
                                <input type="email" id="email" >
                        </div> <br><br><br>
    
                        <div class="col-sm-1 col-md-1 col-lg-1"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"><b>우편번호</b></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2">
                                <input type="text" id="zipCode" name="zipCode" size="6">
                        </div>
                        <div class="col-sm-1 col-md-1 col-lg-1" id="ckZip" onclick="addrSearch()">검색</div>
                        <div class="col-sm-4 col-md-4 col-lg-4"></div> <br><br>
                        
                        <div class="col-sm-1 col-md-1 col-lg-1"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"><b>주소</b></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2">
                                <input type="text" id="address1" name="address1">
                        </div><br><br>
                        
                        <div class="col-sm-1 col-md-1 col-lg-1"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"><b>상세주소</b></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2">
                                <input type="text" id="address2" name="address2">
                        </div><br><br><br>
         
    
                        <div class="col-sm-1 col-md-1 col-lg-1"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"><b>전화번호</b></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"><input type="text" name="tel1" id="tel1" maxlength="3" size="3"/> -
                                                                <input type="text" name="tel2" id="tel2" maxlength="4" size="4"/> -
                                                                <input type="text" name="tel3" id="tel3" maxlength="4" size="4"/>
                        </div> <br><br><br>
    
                        <div class="col-sm-1 col-md-1 col-lg-1"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"><b>가입날짜</b></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"><p class="text-muted" style="font-weight:bold;">
                        <%= m.getEnrollDate() %></p></div> <br><br><br>
                    
                </div>
            </div>
        

        <!-- 수정 확인 -->
        <div class="container-fluid">
            <div class="col-sm-4 col-md-4 col-lg-4"></div>
            <div class="col-sm-2 col-md-2 col-lg-2">
                <button class="blueBtn btn btn-primary" id="modify" onclick="modiComplete();"><b>수정하기</b></button>
            </div>
            <div class="col-sm-2 col-md-2 col-lg-2">
                <button class="grayBtn btn" id="cancel" onclick="cancle();"><b>변경 취소</b></button>
           		 </div>
                <div class="col-sm-4 col-md-4 col-lg-4"></div>
        </div>
        
        <script>
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
			}
	        
	        function cancle(){
	    		location.href = "<%= request.getContextPath() %>/views/myPage/myPage_main.jsp"
	    	}
        
        	function modiComplete(){
    	    	var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);//이메일 정규식
    	    	var getPhone = RegExp(/\d{11}/);
        	
        		var email = $('#email').val();
        		var addr = $('#zipCode').val()+"/"+$('#address1').val()+"/"+$('#address2').val();
        		var phone = $('#tel1').val()+$('#tel2').val()+$('#tel3').val();
        		if(!getMail.test($("#email").val())){
		            alert("이메일형식에 맞게 입력해주세요")
		            $("#my_email").val("");
		            $("#my_email").focus();
		        } else if($('#zipCode').val() == ""){
		        	alert("주소를 꼭 입력하세요!");
	                $("#zipCode").focus();
		        } else if ($("#address1").val() == "") {
	                alert("주소를 꼭 입력하세요!");
	                $("#address1").focus();
	            } else if ($("#address2").val() == "") {
	                alert("주소를 꼭 입력하세요!");
	                $("#address2").focus();
	            } else if (!getPhone.test(phone)){
	            	alert("전화번호를 확인해주세요!");
	            	$('#tel1').focus();
	            } else {
	            	var cf = confirm("비밀번호를 변경하시겠습니까??");
        			if(cf == true)
        			location.href = "<%= request.getContextPath()%>/infoModi.me?email="+email+"&addr="+addr+"&phone="+phone; 
	            }
        		
        	}
        	
        </script>
        <%@ include file="/views/common/footer.jsp" %>
    </body>
</html>