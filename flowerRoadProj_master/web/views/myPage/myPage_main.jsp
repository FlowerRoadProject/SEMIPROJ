<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.fr.jsp.member.model.vo.*"%>
<%
	Member m = (Member)session.getAttribute("m");
	String addrArr[] = m.getMemberAddress().split("/");
%>

<!DOCTYPE>
<html>
    <head>
        <title>꽃길-마이페이지</title>
        <meta charset="utf-8">
         <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/myInfo.css">
        <script src="<%=request.getContextPath() %>/resources/js/myPage.js?ver=1"></script>
        <script>
        	var mainPath = '<%=request.getContextPath() %>';
        </script>
    </head>
    <!-- <body onload="testCommand();"> -->
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
        <!-- 내 정보 창 -->
        <div class="container-fluid">
            <div class="col-sm-2 col-md-2 col-lg-2"><h4><i>내 정보</i></h4></div>
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
                    <div class="col-sm-2 col-md-2 col-lg-2"><p class="text-muted" style="font-weight:bold;">
					<%= m.getMemberName() %></p></div> <br><br><br>

                    <div class="col-sm-1 col-md-1 col-lg-1"></div>
                    <div class="col-sm-2 col-md-2 col-lg-2"><b>이메일</b></div>
                    <div class="col-sm-2 col-md-2 col-lg-2"></div>
                    <div class="col-sm-2 col-md-2 col-lg-2"><p class="text-muted" style="font-weight:bold;">
					<%= m.getMemberEmail() %></p></div> <br><br><br>

                    <div class="col-sm-1 col-md-1 col-lg-1"></div>
                    <div class="col-sm-2 col-md-2 col-lg-2"><b>주소</b></div>
                    <div class="col-sm-2 col-md-2 col-lg-2"></div>
                    <div class="col-sm-3 col-md-3 col-lg-3"><p class="text-muted" style="font-weight:bold;">
					<%= addrArr[0]+" "+addrArr[1]+" "+addrArr[2] %></p></div> <br><br><br>
			

                    <div class="col-sm-1 col-md-1 col-lg-1"></div>
                    <div class="col-sm-2 col-md-2 col-lg-2"><b>전화번호</b></div>
                    <div class="col-sm-2 col-md-2 col-lg-2"></div>
                    <div class="col-sm-2 col-md-2 col-lg-2"><p class="text-muted" style="font-weight:bold;">
					<%= m.getMemberPhone() %></p></div> <br><br><br>

                    <div class="col-sm-1 col-md-1 col-lg-1"></div>
                    <div class="col-sm-2 col-md-2 col-lg-2"><b>가입날짜</b></div>
                    <div class="col-sm-2 col-md-2 col-lg-2"></div>
                    <div class="col-sm-2 col-md-2 col-lg-2"><p class="text-muted" style="font-weight:bold;">
                    <%= m.getEnrollDate() %></p></div> <br><br><br>
                
            </div>
        </div>

        <!-- 수정 및 탈퇴 버튼 -->
        <div class="container-fluid">
            <div class="col-sm-1 col-md-1 col-lg-1"></div>
            <div class="col-sm-2 col-md-2 col-lg-2">
                <button id="pwd" onclick="pwd();"><b>비밀번호 변경</b></button>
            </div>
            <div class="col-sm-1 col-md-1 col-lg-1"></div>
            <div class="col-sm-2 col-md-2 col-lg-2">
            <button id="modify" onclick="modify();"><b>정보 수정</b></button>
            </div>
            <div class="col-sm-1 col-md-1 col-lg-1"></div>
            <div class="col-sm-2 col-md-2 col-lg-2">
            <button id="withdrawal" onclick="withdrawal();"><b>회원 탈퇴</b></button>
            </div>
        </div>
        
        
        
        <%@ include file="/views/common/footer.jsp" %>
    </body>
</html>