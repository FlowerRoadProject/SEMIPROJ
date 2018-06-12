<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fr.jsp.member.model.vo.*"%>
<%
	Member m = (Member)session.getAttribute("m");
	MemberBoard mb = (MemberBoard)request.getAttribute("mb");
%>
<!DOCTYPE>
<html>
    <head>
        <title>꽃길-1:1 문의</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/myInfo.css">
        <script src="<%=request.getContextPath() %>/resources/js/myPage.js"></script>
        <script>
        	var mainPath = '<%=request.getContextPath() %>';
        </script>
        <style>
        	
        </style>
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
        
		<div class="container-fluid">
                <div class="col-sm-4 col-md-4 col-lg-4"><h4><i>1:1 게시판</i> 
                    <small>: 홍길동님이 쇼핑몰에 문의하신 1:1 고객상담 내역입니다.</small></h4></div>
                <div class="col-sm-8 col-md-8 col-lg-8"></div>
        </div>

        <!-- 1:1 문의 보기 -->
        <div class="container-fluid">
            <div>
            <div class="info container">
                <div class="col-sm-2 col-md-2 col-lg-2"></div>
                <div class="col-sm-8 col-md-8 col-lg-8">
                        <form class="form-horizontal">
                            <br><br>
                                <div class="form-group form-group-sm">
                                  <label class="col-sm-2 control-label" for="formGroupInputLarge">제목</label>
                                  <div class="col-sm-10">
                                    <input class="form-control" type="text" id="nameBoard" value="<%= mb.getBoardTitle() %>" disabled>
                                  </div>
                                </div>
                                <div class="form-group form-group-sm">
                                  <label class="col-sm-2 control-label" for="formGroupInputSmall">작성자</label>
                                  <div class="col-sm-10">
                                    <input class="form-control" type="text" id="mailBoard" value="<%= m.getMemberName() %>" disabled>
                                  </div>
                                </div>
                                <div class="form-group form-group-sm">
                                  <label class="col-sm-2 control-label" for="formGroupInputSmall">작성일</label>
                                  <div class="col-sm-10">
                                    <input class="form-control" type="text" id="phoneBoard" value="<%= mb.getSubmitDate() %>" disabled>
                                  </div>
                                </div>
                                <div class="form-group form-group-sm">
                                  <label class="col-sm-2 control-label" for="formGroupInputSmall">내용</label>
                                  <div class="col-sm-10">
                                    <textarea class="content text-left text-capitalize" id="QContent" cols="83" rows="10" disabled><%= mb.getBoardContent() %></textarea>
                                  </div>
                                </div>
                                <% if(mb.getReplyContent() != null) { %>
                                >>>>
                                <div class="form-group form-group-sm">
                                  <label class="col-sm-2 control-label" for="formGroupInputSmall">답변내용</label>
                                  <div class="col-sm-10">
                                    <textarea class="content text-left text-capitalize" id="RContent" cols="83" rows="10" disabled><%= mb.getReplyContent() %></textarea>
                                  </div>
                                 <% } %>
                                </div>
                              </form>
                </div>
                <div class="col-sm-2 col-md-2 col-lg-2"></div>
            </div>
        </div>
        <!-- 수정 및 탈퇴 버튼 -->
        <div class="container-fluid">
            <div class="col-sm-2 col-md-2 col-lg-2"></div>
            <div class="col-sm-1 col-md-1 col-lg-1"></div>
            <div class="col-sm-2 col-md-2 col-lg-2"></div>
            <div class="col-sm-3 col-md-3 col-lg-3">
            <button class="grayBtn btn" onclick="viewBoard();"><b>목록 보기</b></button></div>
            <div class="col-sm-2 col-md-2 col-lg-2"></div>
            <div class="col-sm-4 col-md-4 col-lg-4"></div>
        </div>
        
        
        <%@ include file="/views/common/footer.jsp" %>
    </body>
</html>