<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.fr.jsp.member.model.vo.*"%>
<%
	Member m = (Member)session.getAttribute("m");
	ArrayList<MemberBoard> list = (ArrayList<MemberBoard>)request.getAttribute("mblist");
%>
<!DOCTYPE>
<html>
    <head>
        <title>꽃길-1:1 게시판</title>
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
                <% if(list.size() != 0) { %>
                        <table class="table table-hover" id="listArea">
                            <tr style="background-color: lightgray;">
                                <th>번호</th>
                                <th>제목</th>
                                <th>날짜</th>
                                <th>답변유무</th>
                                <th></th>
                            </tr>
                            <% int i = list.size(); 
                            for(int j = 0; j < list.size(); j++) { %>
                            <tr>
                                <td><%= i-- %></td>
                                <td><%= list.get(j).getBoardTitle() %></td>
                                <td><%= list.get(j).getSubmitDate() %></td>
                                <td><%= list.get(j).getReplyStatus() %></td>
                                <td><input type="hidden" class="bN" name="bN" value="<%=list.get(j).getBoardNum()%>">
                                </input></td>
                            </tr>
                            <% } %>
                        </table>
                   <% } else { %>
                   		<div class="container-fluid">
                     		<div class="col-sm-1 col-md-1 col-lg-1"></div>
                     		<div class="col-sm-8 col-md-8 col-lg-8 noneFavorite">== 문의하신 내용이 없습니다. ==</div>
                     		<div class="col-sm-3 col-md-3 col-lg-3"></div>
                     	</div>
                   <% } %>
                </div>
        </div>
        

        <!-- 버튼 -->
        <div class="container-fluid">
                
                <div class="col-sm-2 col-md-2 col-lg-2">
                </div>
                <div class="col-sm-3 col-md-3 col-lg-3"></div>
                <div class="col-sm-2 col-md-2 col-lg-2">
                        <button class="blueBtn btn btn-primary" id="question" onclick="question();"><b>문의하기</b></button>
                </div>
                <div class="col-sm-5 col-md-5 col-lg-5"></div>
        </div>
        
        <script>
	        $(function(){
	    		$('#listArea td').mouseenter(function(){
	    			$(this).parent().css({
	    				"cursor" : "pointer"
	    			});
	    		}).click(function(){
	    			var bNum = $(this).siblings().children('.bN').val();
	    			location.href="<%=request.getContextPath()%>/oneView.me?bNum="+bNum;
	    			
	    		});
	    	});
        </script>
	<%@ include file="/views/common/footer.jsp" %>
    </body>
</html>