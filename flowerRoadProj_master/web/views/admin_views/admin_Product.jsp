<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.fr.jsp.admin.model.vo.*" %>
<% 
	int admin_allProductCount = (int)(request.getAttribute("admin_allProductCount"));
	int admin_todayRegiProductCount = (int)(request.getAttribute("admin_todayRegiProductCount"));
	int admin_stockLackProductCount = (int)(request.getAttribute("admin_stockLackProductCount"));
	int admin_todayProductOrderCount = (int)(request.getAttribute("admin_todayProductOrderCount")); 
	ArrayList<AdminProduct> admin_productList = (ArrayList<AdminProduct>)(request.getAttribute("admin_productList"));
	ArrayList<String> admin_productCategoryList = (ArrayList<String>)(request.getAttribute("admin_productCategoryList"));
	ArrayList<String> admin_productOriginList = (ArrayList<String>)(request.getAttribute("admin_productOriginList"));
	ArrayList<AdminProductOrder> admin_productOrderList = (ArrayList<AdminProductOrder>)(request.getAttribute("admin_productOrderList"));
%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<!-- Meta, title, CSS, favicons, etc. -->
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<title>Walk Together Along the Flower Road </title>

		<!-- admin_CSS -->
		<%@ include file="common/admin_CSS.jsp" %>
		<script>
			var mainPath = '<%=request.getContextPath() %>';
		</script>
	</head>

	<body class="nav-md">
		<!-- admin_LOADING -->
		<%@ include file="common/admin_LOADING.jsp" %>
    
    <div class="container body">
      <div class="main_container">
        <!-- admin_NAV -->
    <%@ include file="common/admin_NAV.jsp" %>

        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>상품 관리 <small>(Products)</small></h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                    
                  </div>
                </div>
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12">
                <div class="">
                  <div class="x_content">
                    <div class="row">
                      <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="tile-stats">
                          <div class="icon"><i class="fa fa-caret-square-o-right"></i>
                          </div>
                          <div class="count"><%=admin_allProductCount %></div>
                          <a href="/flowerRoadProj/product.admin"><h3>총 상품</h3></a>
                          <p>Lorem ipsum psdea itgum rixt.</p>
                        </div>
                      </div>
                      <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="tile-stats">
                          <div class="icon"><i class="fa fa-comments-o"></i>
                          </div>
                          <div class="count todayRegiProductCount"><%=admin_todayRegiProductCount %></div>

                          <a href="/flowerRoadProj/todayRegiProduct.admin"><h3>오늘 등록</h3></a>
                          <p>Lorem ipsum psdea itgum rixt.</p>
                        </div>
                      </div>
                      <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="tile-stats">
                          <div class="icon"><i class="fa fa-check-square-o"></i>
                          </div>
                          <div class="count"><%=admin_stockLackProductCount %></div>

                          <a href="/flowerRoadProj/stockLackProduct.admin"><h3>재고 부족</h3></a>
                          <p>Lorem ipsum psdea itgum rixt.</p>
                        </div>
                      </div>
                      <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="tile-stats">
                          <div class="icon"><i class="fa fa-caret-square-o-right"></i>
                          </div>
                          <div class="count todayProductOrderCount"><%=admin_todayProductOrderCount %></div>
                          <a href="/flowerRoadProj/todayProductOrder.admin"><h3>오늘 발주</h3></a>
                          <p>Lorem ipsum psdea itgum rixt.</p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>상품 조회<small>Products</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <table id="datatable-buttons" class="table table-striped table-bordered dt-responsive nowrap productTable" cellspacing="0" width="100%">
                      <thead>
                        <tr>
                          <th>상품번호</th>
                          <th>카테고리</th>
                          <th>상품이름</th>
                          <th>상품등록일</th>
                          <th>재고수량</th>
                          <th>원가</th>
                          <th>매가</th>
                          <th>원산지</th>
                          <th>이벤트</th>
                          <th>이미지</th>
                        </tr>
                      </thead>
                      <tbody  class='PtableTr'>
                      <% for(AdminProduct ap : admin_productList){ %>
                        <tr>
                          <td class='PNumD'><%=ap.getProductNum() %></td>
                          <td><%=ap.getProductCategoryName() %></td>
                          <td><%=ap.getProductName() %></td>
                          <td><%=ap.getProductRegiDate() %></td>
                          <td><%=ap.getProductQuantity() %></td>
                          <td><%=ap.getProductCost() %></td>
                          <td><%=ap.getProductPrice() %></td>
                          <td><%=ap.getProductOriginName() %></td>
                          <td><%=ap.getProductEvent() %></td>
                          <td><%=ap.getImagePath() %></td>
                        </tr>
                       <%} %>
                      </tbody>
                    </table>
					
					
                  </div>
                </div>
              </div>
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>상품 상세정보 <small>Product</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                    <div class="col-md-5 col-sm-12 col-xs-12" style="margin-bottom: 20px;">
                      <div class="product-image">
                        <img class="PImage" src="" alt="상품 이미지 없음" />
                        <input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" class="PInfoImage" onchange="PInfoImgChange();"/>
                      </div>
                    </div>

                    <div class="col-md-7 col-sm-12 col-xs-12" style="border:0px solid #e5e5e5;">
                     <div class="col-md-12 col-sm-12 col-xs-12" style="">
                          <h3 class="prod_title">상품 번호</h3>
                          <input  class="col-md-12 col-sm-12 col-xs-12 PNum" type="text" style="margin-bottom: 15px" disabled>
                          <p style="margin-bottom: 0px">상품 이름</p>
                          <input class="col-md-12 col-sm-12 col-xs-12 PName"  type="text" style="margin-bottom: 15px">
                     </div>
                      <div class="col-md-12 col-sm-12 col-xs-12" style="padding: 0px;">
                          <div class="col-md-6 col-sm-6 col-xs-6" style="">
                              <p class="col-md-12 col-sm-12 col-xs-12"  style="margin-bottom: 0px">카테고리</p>
                              <select name="" id="selectCategory" class="col-md-12 col-sm-12 col-xs-12 PCategory" style="height: 30px;margin-bottom: 15px">
                              	  <% for(String category : admin_productCategoryList){ %>
                                  <option value="<%=category%>"><%=category%></option>
                                  <%} %>
                              </select>
                          </div>
                          <div class="col-md-6 col-sm-6 col-xs-6" style="">
                              <p class="col-md-12 col-sm-12 col-xs-12"  style="margin-bottom: 0px">원산지</p>
                              <select name="" id="selectOrigin" class="col-md-12 col-sm-12 col-xs-12 POrigin" style="height: 30px;margin-bottom: 15px">
                                  <% for(String origin : admin_productOriginList){ %>
                                  <option value="<%=origin%>"><%=origin%></option>
                                  <%} %>
                              </select>
                          </div>
                      </div>
                      <div class="col-md-12 col-sm-12 col-xs-12" style="padding: 0px;">
                          <div class="col-md-6 col-sm-6 col-xs-6" style="">
                              <p class="col-md-12 col-sm-12 col-xs-12"  style="margin-bottom: 0px">이벤트</p>
                              <select name="" id="selectPEvent" class="col-md-12 col-sm-12 col-xs-12 PEvent" style="height: 30px;margin-bottom: 15px">
                                  <option value="없음">없음</option>
                                  <option value="생일/축하">생일/축하</option>
                                  <option value="연인">연인</option>
                                  <option value="부부">부부</option>
                                  <option value="승진/개업">승진/개업</option>
                                  <option value="부모님">부모님</option>
                                  <option value="근조">근조</option>
                              </select>
                          </div>
                          <div class="col-md-6 col-sm-6 col-xs-6" style="">
                              <p class="col-md-12 col-sm-12 col-xs-12"  style="margin-bottom: 0px">재고수량</p>
                              <input class="col-md-12 col-sm-12 col-xs-12 PStock"  type="number" min='0' style="margin-bottom: 15px">
                          </div>
                      </div>
                      <div class="col-md-12 col-sm-12 col-xs-12" style="padding: 0px;">
                          <div class="col-md-6 col-sm-6 col-xs-6" style="">
                              <p style="margin-bottom: 0px">원가</p>
                              <input class="col-md-12 col-sm-12 col-xs-12 PCost"  type="number" min='0' style="margin-bottom: 15px">
                          </div>
                          <div class="col-md-6 col-sm-6 col-xs-6" style="">
                              <p style="margin-bottom: 0px">매가</p>
                              <input class="col-md-12 col-sm-12 col-xs-12 PPrice"  type="number" min='0' style="margin-bottom: 15px">
                          </div>
                      </div>
                      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding: 0px;">
                         <button type="button" class="btn btn-round btn-success col-lg-3 col-md-3 col-sm-3 col-xs-3" style="margin: 4%" id="checkProduct">확인</button>
                          <button type="button" class="btn btn-round btn-warning col-lg-3 col-md-3 col-sm-3 col-xs-3" style="margin: 4%" id="editProduct">수정</button>
                          <button type="button" class="btn btn-round btn-danger col-lg-3 col-md-3 col-sm-3 col-xs-3" style="margin: 4%" id="deleteProduct">삭제</button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>상품 등록 <small>Product</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                    <div class="col-md-5 col-sm-12 col-xs-12" style="margin-bottom: 20px;">
                      <div class="product-image">
                        <img class="PImgeRegi" src="" alt="..." />
                        <input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" class="PInfoImage2" onchange="PInfoImgRegi();"/>
                      </div>
                    </div>

                    <div class="col-md-7 col-sm-12 col-xs-12" style="border:0px solid #e5e5e5;">
                      <div class="col-md-12 col-sm-12 col-xs-12" style="">
                          <p style="margin-bottom: 0px">상품 이름</p>
                          <input class="col-md-12 col-sm-12 col-xs-12 insertPName"  type="text" style="margin-bottom: 15px">
                        </div>
                      <div class="col-md-12 col-sm-12 col-xs-12" style="padding: 0px;">
                          <div class="col-md-6 col-sm-6 col-xs-6" style="">
                              <p class="col-md-12 col-sm-12 col-xs-12"  style="margin-bottom: 0px">카테고리</p>
                              <select name="" id="insertPCategory" class="col-md-12 col-sm-12 col-xs-12"  style="height: 30px;margin-bottom: 15px">
                                  <% for(String category : admin_productCategoryList){ %>
                                  <option value="<%=category%>"><%=category%></option>
                                  <%} %>
                              </select>
                          </div>
                          <div class="col-md-6 col-sm-6 col-xs-6" style="">
                              <p class="col-md-12 col-sm-12 col-xs-12"  style="margin-bottom: 0px">원산지</p>
                              <select name="" id="insertPOrigin" class="col-md-12 col-sm-12 col-xs-12"  style="height: 30px;margin-bottom: 15px">
                                  <% for(String origin : admin_productOriginList){ %>
                                  <option value="<%=origin%>"><%=origin%></option>
                                  <%} %>
                              </select>
                          </div>
                      </div>
                      <div class="col-md-12 col-sm-12 col-xs-12" style="padding: 0px;">
                          <div class="col-md-6 col-sm-6 col-xs-6" style="">
                              <p class="col-md-12 col-sm-12 col-xs-12"  style="margin-bottom: 0px">이벤트</p>
                              <select name="" id="insertPEvent" class="col-md-12 col-sm-12 col-xs-12 PEvent" style="height: 30px;margin-bottom: 15px">
                                  <option value="없음">없음</option>
                                  <option value="생일/축하">생일/축하</option>
                                  <option value="연인">연인</option>
                                  <option value="부부">부부</option>
                                  <option value="승진/개업">승진/개업</option>
                                  <option value="부모님">부모님</option>
                                  <option value="근조">근조</option>
                              </select>
                          </div>
                          <div class="col-md-6 col-sm-6 col-xs-6" style="">
                              <p class="col-md-12 col-sm-12 col-xs-12"  style="margin-bottom: 0px">재고수량</p>
                              <input class="col-md-12 col-sm-12 col-xs-12 insertPStock"  type="number" min='0' style="margin-bottom: 15px">
                          </div>
                      </div>
                      <div class="col-md-12 col-sm-12 col-xs-12" style="padding: 0px;">
                          <div class="col-md-6 col-sm-6 col-xs-6" style="">
                              <p style="margin-bottom: 0px">원가</p>
                              <input class="col-md-12 col-sm-12 col-xs-12 insertPCost"  type="number" min='0' style="margin-bottom: 15px">
                          </div>
                          <div class="col-md-6 col-sm-6 col-xs-6" style="">
                              <p style="margin-bottom: 0px">매가</p>
                              <input class="col-md-12 col-sm-12 col-xs-12 insertPPrice"  type="number" min='0' style="margin-bottom: 15px">
                          </div>
                      </div>
                      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding: 0px;">
                         <button type="button" class="btn btn-round btn-success col-lg-5 col-md-5 col-sm-5 col-xs-5" style="margin: 4%" id="insertProduct">등록</button>
                          <button type="button" class="btn btn-round btn-danger col-lg-5 col-md-5 col-sm-5 col-xs-5" style="margin: 4%" id="cancleProduct">취소</button>
                          </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>발주현황 조회<small>Orders</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                      <thead>
                        <tr>
                          <th>발주번호</th>
                          <th>상품번호</th>
                          <th>발주업체</th>
                          <th>발주일</th>
                          <th>발주수량</th>
                        </tr>
                      </thead>
                      <tbody>
                      <% for(AdminProductOrder po : admin_productOrderList){ %>
                        <tr>
                          <td><%=po.getProductOrderNum() %></td>
                          <td><%=po.getProductNum() %></td>
                          <td><%=po.getProductOrderCompany() %></td>
                          <td><%=po.getProductOrderDate() %></td>
                          <td><%=po.getProductOrderQuantity() %></td>
                        </tr>
                        <%} %>
                      </tbody>
                    </table>
					
					
                  </div>
                </div>
              </div>
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>상품 발주 <small>Order</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12" style="padding: 0px;">
                          <div class="col-md-6 col-sm-6 col-xs-12" style="">
                              <p style="margin-bottom: 0px">상품번호</p>
                              <input class="col-md-12 col-sm-12 col-xs-12 PNum insertPNumO"  type="text" style="margin-bottom: 15px">
                          </div>
                          <div class="col-md-6 col-sm-6 col-xs-12" style="">
                              <p style="margin-bottom: 0px">발주업체</p>
                              <select name="" id="insertPOCompany" class="col-md-12 col-sm-12 col-xs-12"  style="height: 30px;margin-bottom: 15px">
                                  <option value="업체를 선정해주세요">업체를 선정해주세요</option>
                                  <option value="노원꽃화원">노원꽃화원</option>
                                  <option value="비밀의화원">비밀의화원</option>
                                  <option value="서울꽃화원">서울꽃화원</option>
                                  <option value="푸른화원">푸른화원</option>
                                  <option value="맥스제과">맥스제과</option>
                                  <option value="개미문구점">개미문구점</option>
                              </select>
                          </div>
                      </div>
                      <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12" style="padding: 0px;">
                          <div class="col-md-6 col-sm-6 col-xs-12" style="">
                              <p style="margin-bottom: 0px">발주일</p>
                              <input class="col-md-12 col-sm-12 col-xs-12 insertPDateO"  type="date" style="margin-bottom: 15px">
                          </div>
                          <div class="col-md-6 col-sm-6 col-xs-12" style="">
                              <p style="margin-bottom: 0px">발주수량</p>
                              <input class="col-md-12 col-sm-12 col-xs-12 insertPQO"  type="number" min='0' style="margin-bottom: 15px">
                          </div>
                          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding: 0px;">
                         <button type="button" class="btn btn-round btn-success col-lg-5 col-md-5 col-sm-5 col-xs-5" style="margin: 4%" id="insertProductOrder">발주</button>
                          <button type="button" class="btn btn-round btn-danger col-lg-5 col-md-5 col-sm-5 col-xs-5" style="margin: 4%" id="cancleProductOrder">취소</button>
                          </div>
                      </div>
                    
                  </div>
                </div>
              </div>
            </div>
            
          </div>
          
        </div>
        <!-- /page content -->
        
        <!-- footer content -->
        <footer>
         <div class="pull-right">
            
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      
    </div>

	<!-- admin_JS -->
    <%@ include file="common/admin_JS.jsp" %>
  </body>
</html>
