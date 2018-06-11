<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.fr.jsp.product.model.vo.*,
								com.fr.jsp.common.*, com.fr.jsp.member.model.vo.*" %>
<%
	Member m = (Member)session.getAttribute("m");
	ArrayList<ProductFavorite> list = (ArrayList<ProductFavorite>)request.getAttribute("pflist");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>
<!DOCTYPE>
<html>
    <head>
        <title>꽃길-관심 상품</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
         <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/myInfo.css">
        <script src="<%=request.getContextPath() %>/resources/js/myPage.js"></script>
        <!-- // jQuery 기본 js파일 -->
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
		<!-- // jQuery UI 라이브러리 js파일 -->
		<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
		<script>
        	var mainPath = '<%=request.getContextPath() %>';
        </script>
        <style>
        .noneFavorite {
			color: black;
			font-size: 40px;
			text-align: center;
			width: 400px;
			height: 200px;
			margin: 100px;
		}
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
            <div class="category col-sm-2 col-md-2 col-lg-2" 
                style="font-weight:bold; text-decoration: underline;" id="favarite" onclick="favorite();">관심 상품</div>
            <div class="category col-sm-2 col-md-2 col-lg-2" id="1on1" onclick="oneToOne();">1:1 문의</div>
            <div class="col-sm-3 col-md-3 col-lg-3"></div> 
        </div>

        <br><br><br><br><br>

        <!-- 관심 상품 창 -->
        <div class="container-fluid">
                <div class="col-sm-4 col-md-4 col-lg-4"><h4><i>관심 상품</i> 
                    <small>: [<%= m.getMemberName() %>]님의 관심상품 보관함 내역입니다.</small></h4></div>
                <div class="col-sm-8 col-md-8 col-lg-8"></div>
        </div>
        <div>
                <div class="info">
                       <% if(list.size() != 0) { %>
                        <table class="table table-hover">
                            <tr style="background-color: lightgray;">
                                <th>번호</th>
                                <th>사진</th>
                                <th>상품명</th>
                                <th>가격</th>
                                <th>재고상황</th>
                                <th>장바구니</th>
                                <th></th>
                            </tr>
                            <% int i = list.size(); 
                            for(int j = 0; j < list.size(); j++) {  %>
                            <tr>
                                <td><%= i-- %></td>
                                <td><img src="<%=request.getContextPath()%>/resources/images/product/<%= list.get(j).getImage() %>" width="60px;" height="60px;"></td>
                                <td><%= list.get(j).getProductName() %></td>
                                <td><%= list.get(j).getProductPrice() %>원</td>
                                <td><%= list.get(j).getProductQuantityState() %></td>
                                <td><input type="button" value="장바구니" class="goBasket"><br>
                                <input type="button" value="삭제하기" class="delFavorite"></td>
                                <td><input type="hidden" class="pN" name="pN" value="<%=list.get(j).getProductNum()%>"></input></td>
                            </tr>
                            <% } %>
                        </table>
                     	<% } else { %>
                     	<div class="container-fluid">
                     		<div class="col-sm-1 col-md-1 col-lg-1"></div>
                     		<div class="col-sm-8 col-md-8 col-lg-8 noneFavorite">== 현재 등록되어 있는 관심상품이 없습니다. ==</div>
                     		<div class="col-sm-3 col-md-3 col-lg-3"></div>
                     	</div>
                     	<% } %>
                </div>
        </div>
        

        <!-- 버튼 -->
        <div class="container-fluid">
                <% if(list.size() != 0) { %>
                <div class="col-sm-2 col-md-2 col-lg-2">
                <button style="width:100px; height:30px; margin-top:20px;"
                class="blueBtn btn btn-primary" onclick="allDel()">전체 삭제</button>
                </div>
                <div class="col-sm-3 col-md-3 col-lg-3"></div>
                <div class="col-sm-2 col-md-2 col-lg-2">
                        <nav style="color:midnightblue;">
                                <ul class="pagination">
				<!-- 한페이지 씩 앞으로 이동 -->
				<%if(pi.getCurrPage() <=1){ %>
					<li><span disabled>«</span></li>
				<% } else { %>
					<li><a href="<%=request.getContextPath() %>/favorite.me?currentPage=<%=pi.getCurrPage()-1%>"><span aria-hidden="true">«</span><span
							class="sr-only">Previous</span></a></li>
				<% } %>
				<!-- 각 페이지 별 리스트 작성 -->
				<%for(int j = pi.getStartPage(); j<=pi.getEndPage(); j++){ %>
					<% if(j== pi.getCurrPage()){ %>
					<li><span disabled><%=j%></span></li>
					<%} else { %>
					<li><a href="<%=request.getContextPath() %>/favorite.me?currentPage=<%=j%>"><%=j %></a></li>
					<%} %>
				<%} %>
				
				<!--한페이지씩 뒤로 이동 -->
				<%if(pi.getCurrPage()>=pi.getMaxPage()){ %>
				<li><span disabled>»</span></li>
				<% }else{ %>
				<li><a href="<%=request.getContextPath() %>/favorite.me?currentPage=<%=pi.getCurrPage()+1%>"><span aria-hidden="true">»</span><span
						class="sr-only">Next</span></a></li>
				<% } %>
				</ul>
                              </nav>
                </div>
                <div class="col-sm-5 col-md-5 col-lg-5"></div>
                <% } %>
        </div>
        <script>
        	$('.goBasket').on('click',function(){
        		var product_num = $(this).parent().siblings().children('.pN').val();
        		alert("장바구니에 추가되었습니다.");
        		
        		$.ajax({
        			url: "addBasket.do",
        			type: "GET",
        			data: {
        				pNum: product_num				
        			},   				
        			success: function(){
        				console.log('update성공');
        			},error: function(){
        				console.log('update실패');
        			}
        		});
        		
        		<%-- location.href="<%=request.getContextPath() %>/addBasket.do?pno="+$(this).parent().siblings().children('.pN').val(); --%>
        	});
        	
        	$('.delFavorite').on('click',function(){
        		var pno = $(this).parent().siblings().children('.pN').val();
        		alert("해당 상품이 관심상품에서 삭제 되었습니다.")
        		location.href="<%=request.getContextPath() %>/favoriteDel.me?pno="+pno;
        	});
        	
        	
        	function allDel(){
        		location.href="<%=request.getContextPath() %>/favoriteAllDel.me";
        	}
        </script>
	<%@ include file="/views/common/footer.jsp" %>
    </body>
</html>