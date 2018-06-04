<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.fr.jsp.product.model.vo.*"%>
<%
	ArrayList<ProductFavorite> list = (ArrayList<ProductFavorite>)request.getAttribute("pflist");
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
                    <small>: 회원님의 관심상품 보관함 내역입니다.</small></h4></div>
                <div class="col-sm-8 col-md-8 col-lg-8"></div>
        </div>
        <div>
                <div class="info">
                       
                        <table class="table table-hover">
                            <tr style="background-color: lightgray;">
                                <th>번호</th>
                                <th>사진</th>
                                <th>상품명</th>
                                <th>가격</th>
                                <th>재고상황</th>
                                <th>장바구니</th>
                            </tr>
                            <% int i = list.size(); 
                            for(ProductFavorite pf : list) { %>
                            <tr>
                                <td><%= i-- %></td>
                                <td><img src="<%=request.getContextPath()%>/resources/images/product/<%= pf.getImage() %>" width="60px;" height="60px;"></td>
                                <td><%=pf.getProductName() %></td>
                                <td><%=pf.getProductCost() %>원</td>
                                <td><%=pf.getProductQuantityState() %></td>
                                <td><input type="submit" value="장바구니"><br><input type="button" value="삭제하기"></td>
                            </tr>
                            <% } %>
                        </table>
                    
                </div>
        </div>
        

        <!-- 버튼 -->
        <div class="container-fluid">
                
                <div class="col-sm-2 col-md-2 col-lg-2">
                <button style="width:100px; height:30px; margin-top:20px;">
                        전체 삭제</button>
                </div>
                <div class="col-sm-3 col-md-3 col-lg-3"></div>
                <div class="col-sm-2 col-md-2 col-lg-2">
                        <nav style="color:midnightblue;">
                                <ul class="pagination">
                                  <li><a href="#"><span aria-hidden="true">«</span><span class="sr-only">Previous</span></a></li>
                                  <li><a href="#">1</a></li>
                                  <li><a href="#">2</a></li>
                                  <li><a href="#">3</a></li>
                                  <li><a href="#">4</a></li>
                                  <li><a href="#">5</a></li>
                                  <li><a href="#"><span aria-hidden="true">»</span><span class="sr-only">Next</span></a></li>
                                </ul>
                              </nav>
                </div>
                <div class="col-sm-5 col-md-5 col-lg-5"></div>
        </div>
	<%@ include file="/views/common/footer.jsp" %>
    </body>
</html>