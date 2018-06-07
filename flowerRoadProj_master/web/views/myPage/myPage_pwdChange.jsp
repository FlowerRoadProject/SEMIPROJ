<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.fr.jsp.member.model.vo.*"%>

<!DOCTYPE>
<html>
    <head>
        <title>꽃길-비밀번호 변경</title>
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
        <!-- 비밀번호 변경 창 -->
        <div class="container-fluid">
                <div class="col-sm-2 col-md-2 col-lg-2"><h4><i>비밀번호 변경</i></h4></div>
                <div class="col-sm-10 col-md-10 col-lg-10"></div>
        </div>
        <div>
                <div class="info">
                    
                        <br>
                        <div class="col-sm-1 col-md-1 col-lg-1"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"><b>이름</b></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"><p class="text-muted" style="font-weight:bold;">
                        <%= m.getMemberName() %></p></div>  <br><br><br>
    
                        <div class="col-sm-1 col-md-1 col-lg-1"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"><b>아이디</b></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"><p class="text-muted" style="font-weight:bold;">
						<%= m.getMemberId() %></p></div> <br><br><br>
    
                        <div class="col-sm-1 col-md-1 col-lg-1"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"><b>비밀번호</b></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"><input type="password" id="userPwd" name="userPwd" onchange="isSame()" placeholder="내용을 입력해주세요"></div> <br><br><br>
                     
    
                        <div class="col-sm-1 col-md-1 col-lg-1"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"><b>비밀번호 확인</b></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"><input type="password" id="userPwd2" name="userPwd2" onchange="isSame()" placeholder="내용을 입력해주세요"></div>
                        <div class="col-sm-3 col-md-3 col-lg-3"><span id="msg"></span></div>  <br><br><br>
                    
                </div>
        </div>
        

        <!-- 변경 확인 -->
        <div class="container-fluid">
                <div class="col-sm-5 col-md-5 col-lg-5"></div>
                <div class="col-sm-2 col-md-2 col-lg-2">
                    <button id="pwd" onclick="pwd();"><b>비밀번호 변경</b></button>
                </div>
                <div class="col-sm-5 col-md-5 col-lg-5"></div>
        </div>
        <script>
        	function isSame(){
        		var pwd = $('#userPwd').val();
        		var pwdChk = $('#userPwd2').val();
        		
        		if(pwd == pwdChk){
        			$('#msg').css("color","green").text("비밀번호가 일치합니다.");
        		} else {
        			$('#msg').css("color","red").text("비밀번호가 일치하지 않습니다.");
        		}
        	}
        	
        	function pwd(){
        		var pwd = $('#userPwd').val();
        		
        		location.href = "<%=request.getContextPath()%>/pwdChange.me?pwd="+pwd;
        	}
        </script>
        <%@ include file="/views/common/footer.jsp" %>
    </body>
    
</html>