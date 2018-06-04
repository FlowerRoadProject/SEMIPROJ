<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
    <head>
        <title>꽃길-1:1 문의</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/myInfo.css">
        <script src="<%=request.getContextPath() %>/resources/js/myPage.js"></script>
        
    </head>
    <body>
        <%@ include file="/views/common/header.jsp" %>
        <!-- 마이페이지 카테고리  -->
        <br><br><br><br><br><br><br><br><br><br>
        <div class="container-fluid">
            <div class="col-sm-1 col-md-1 col-lg-1"></div>
            <div class="category col-sm-2 col-md-2 col-lg-2" id="info" onclick="info();">내 정보</div>
            <div class="category col-sm-2 col-md-2 col-lg-2" id="check" onclick="orderChk();">주문 조회</div>
            <div class="category col-sm-2 col-md-2 col-lg-2" id="favarite" onclick="favorite();">관심 상품</div>
            <div class="category col-sm-2 col-md-2 col-lg-2" 
                style="font-weight:bold; text-decoration: underline;" id="1on1" onclick="oneToOne();">1:1 문의</div>
            <div class="col-sm-3 col-md-3 col-lg-3"></div> 
        </div>

        <br><br><br><br><br><br><br>

        <!-- 1:1 문의
        <div class="container-fluid">
        <div class="col-sm-6 col-md-6 col-lg-6"></div>
        <div class="col-sm-1 col-md-1 col-lg-1"><h2>1:1 문의</h2></div>
        <div class="col-sm-5 col-md-5 col-lg-5"></div>
        </div>
        <br><br><br> -->

        <!-- 1:1 문의하기 -->
        <div class="container-fluid">
            <div>
            <div class="info container">
                <div class="col-sm-2 col-md-2 col-lg-2"></div>
                <div class="col-sm-8 col-md-8 col-lg-8" id="questionBoard">
                        <form class="form-horizontal">
                            <br><br>
                                <div class="form-group form-group-sm">
                                  <label class="col-sm-2 control-label" for="formGroupInputLarge">이름</label>
                                  <div class="col-sm-10">
                                    <input class="form-control" type="text" id="nameBoard" value="홍길동" disabled>
                                  </div>
                                </div>
                                <div class="form-group form-group-sm">
                                  <label class="col-sm-2 control-label" for="formGroupInputSmall">이메일</label>
                                  <div class="col-sm-10">
                                    <input class="form-control" type="text" id="mailBoard" value="na@email.com">
                                  </div>
                                </div>
                                <div class="form-group form-group-sm">
                                  <label class="col-sm-2 control-label" for="formGroupInputSmall">핸드폰</label>
                                  <div class="col-sm-10">
                                    <input class="form-control" type="text" id="phoneBoard" value="010-2222-3333">
                                  </div>
                                </div>
                                <div class="form-group form-group-sm">
                                  <label class="col-sm-2 control-label" for="formGroupInputSmall">제목</label>
                                  <div class="col-sm-10">
                                    <input class="form-control" type="text" id="titleBoard">
                                  </div>
                                </div>
                                <div class="form-group form-group-sm">
                                  <label class="col-sm-2 control-label" for="formGroupInputSmall">내용</label>
                                  <div class="col-sm-10">
                                    <textarea id="contentBoard" cols="83" rows="10"></textarea>
                                  </div>
                                </div>
                              </form>
                </div>
                <div class="col-sm-2 col-md-2 col-lg-2"></div>
            </div>
        </div>
        <!-- 수정 및 탈퇴 버튼 -->
        <div class="container-fluid">
            <div class="col-sm-2 col-md-2 col-lg-2"></div>
            <div class="col-sm-2 col-md-2 col-lg-2"></div>
            <div class="col-sm-2 col-md-2 col-lg-2">
                <button onclick="send()">문의하기</button>
            </div>
            
            <div class="col-sm-2 col-md-2 col-lg-2">
                <button class="grayBtn" onclick="viewBoard();"><b>목록 보기</b></button>
            </div>
            <div class="col-sm-4 col-md-4 col-lg-4"></div>
        </div>
        <%@ include file="/views/common/footer.jsp" %>
    </body>
</html>