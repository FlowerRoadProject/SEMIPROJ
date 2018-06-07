<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.fr.jsp.member.model.vo.*"%>

<!DOCTYPE>
<html>
    <head>
        <title>꽃길-정보 수정</title>
        <meta charset="utf-8">
         <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/myInfo.css">
        <script src="<%=request.getContextPath() %>/resources/js/myPage.js"></script>
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
                                <input type="email" id="email" size="6" >@
                                <input type="text" id="com" size="6" />
                        </div> <br><br><br>
    
                        <div class="col-sm-1 col-md-1 col-lg-1"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"><b>주소</b></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2">
                                <input type="text" id="addr" placeholder="내용을 입력해주세요">
                        </div> <br><br><br>
    
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
            <div class="col-sm-5 col-md-5 col-lg-5"></div>
            <div class="col-sm-2 col-md-2 col-lg-2">
                <button id="modify" onclick="modiComplete();"><b>수정완료</b></button>
            </div>
            <div class="col-sm-5 col-md-5 col-lg-5"></div>
        </div>
        
        <script>
        	function modiComplete(){
        		var email = $('#email').val()+"@"+$('#com').val();
        		console.log(email);
        		var addr = $('#addr').val();
        		console.log(addr);
        		var phone = $('#tel1').val()+$('#tel2').val()+$('#tel3').val();
        		console.log(phone);
        		location.href = "<%= request.getContextPath()%>/infoModi.me?email="+email+"&addr="+addr+"&phone="+phone;
        		
        	}
        </script>
        <%@ include file="/views/common/footer.jsp" %>
    </body>
</html>