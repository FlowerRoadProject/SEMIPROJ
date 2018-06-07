<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.fr.jsp.member.model.vo.*"%>

<!DOCTYPE>
<html>
    <head>
        <title>꽃길-주문 조회</title>
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
        <!-- 회원 탈퇴 창 -->
        <div class="container-fluid">
                <div class="col-sm-2 col-md-2 col-lg-2"><h4><i>회원 탈퇴</i></h4></div>
                <div class="col-sm-10 col-md-10 col-lg-10"></div>
        </div>
        <div class="container-fluid">
            <div>
            <div class="info container">
                <div class="col-sm-2 col-md-2 col-lg-2"></div>
                <div class="col-sm-8 col-md-8 col-lg-8" id="withdrawDiv">
                    <b style="font-size: 13pt;">그동안 저희 사이트를 이용해주셔서 감사합니다</b> <br><br>
                    <p class="text-muted" style="font-weight:bold;">더욱더 개선하여 좋은 서비스와 품질로 보답하겠습니다. <br>
                        사이트 탈퇴하셔도 언제나 고객님이 원하실 때 재가입 하실 수 있습니다. <br>
                        회원 탈퇴시 회원님의 <mark style="color:red;">개인 정보는 모두 삭제됩니다.</mark> <br>
                        회원님의 <mark style="color:red;">적립금이 남아있는 경우에도 모두 삭제</mark>되며 탈퇴 후
                        재가입 하셔도 적립금이 복원되지 않습니다. 
                    </p>
                    <div class="why">탈퇴 사유</div>
                    <div><textarea name="why" id="why" cols="80" rows="8"
                        placeholder="반영해주신 의견을 적극 반영하여 더 나은 사이트가 되도록 노력하겠습니다."></textarea></div>
                </div>
                <div class="col-sm-2 col-md-2 col-lg-2"></div>
            </div>
        </div>
        <!-- 수정 및 탈퇴 버튼 -->
        <div class="container-fluid">
            <div class="col-sm-2 col-md-2 col-lg-2"></div>
            <div class="col-sm-2 col-md-2 col-lg-2"></div>
            <div class="col-sm-2 col-md-2 col-lg-2">
                <button class="redBtn" id="finalWithdraw" onclick="finalWithdraw()"><b>탈퇴 하기</b></button>
            </div>
            
            <div class="col-sm-2 col-md-2 col-lg-2">
                <button class="grayBtn" id="cancel" onclick="cancle();"><b>탈퇴 취소</b></button>
            </div>
            <div class="col-sm-4 col-md-4 col-lg-4"></div>
        </div>
        
        <script>
        	function finalWithdraw(){
        		location.href = "<%= request.getContextPath() %>/delMember.me";
        	}
        </script>
        <%@ include file="/views/common/footer.jsp" %>
    </body>
</html>