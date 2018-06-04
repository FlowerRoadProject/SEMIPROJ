<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.fr.jsp.member.model.vo.*"%>
<%
	ArrayList<MemberBoard> list = (ArrayList<MemberBoard>)request.getAttribute("mblist");
	
%>
<!DOCTYPE>
<html>
    <head>
        <title>꽃길-1:1 게시판</title>
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

        <br><br><br><br><br>

        <!-- 1:1 게시판 창 -->
        <div class="container-fluid">
                <div class="col-sm-4 col-md-4 col-lg-4"><h4><i>1:1 게시판</i> 
                    <small>: [<%= m.getMemberName() %>]님이 쇼핑몰에 문의하신 1:1 고객상담 내역입니다.</small></h4></div>
                <div class="col-sm-8 col-md-8 col-lg-8"></div>
        </div>
        <div>
                <div class="info">
                       
                        <table class="table table-hover">
                            <tr style="background-color: lightgray;">
                                <th>번호</th>
                                <th>제목</th>
                                <th>날짜</th>
                                <th>답변상황</th>
                            </tr>
                            <% int i = list.size(); 
                            for(MemberBoard mb : list) { %>
                            <tr>
                                <td><%= i-- %></td>
                                <td><%= mb.getBoardTitle() %></td>
                                <td><%= mb.getSubmitDate() %></td>
                                <td><%= mb.getReplyStatus() %></td>
                            </tr>
                            <% } %>
                        </table>
                    
                </div>
        </div>
        

        <!-- 버튼 -->
        <div class="container-fluid">
                
                <div class="col-sm-2 col-md-2 col-lg-2">
                    <button class="grayBtn" style="width:100px; height:30px; margin-top:20px;">
                        전체 삭제</button>
                </div>
                <div class="col-sm-3 col-md-3 col-lg-3"></div>
                <div class="col-sm-2 col-md-2 col-lg-2">
                        <button id="question" onclick="question();"><b>문의하기</b></button>
                </div>
                <div class="col-sm-5 col-md-5 col-lg-5"></div>
        </div>
	<%@ include file="/views/common/footer.jsp" %>
    </body>
</html>