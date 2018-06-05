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
                          <a href="<%=request.getContextPath() %>/product.admin"><h3>총 상품</h3></a>
                          <p>Lorem ipsum psdea itgum rixt.</p>
                        </div>
                      </div>
                      <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="tile-stats">
                          <div class="icon"><i class="fa fa-comments-o"></i>
                          </div>
                          <div class="count todayRegiProductCount"><%=admin_todayRegiProductCount %></div>

                          <a href="<%=request.getContextPath() %>/todayRegiProduct.admin"><h3>오늘 등록</h3></a>
                          <p>Lorem ipsum psdea itgum rixt.</p>
                        </div>
                      </div>
                      <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="tile-stats">
                          <div class="icon"><i class="fa fa-check-square-o"></i>
                          </div>
                          <div class="count"><%=admin_stockLackProductCount %></div>

                          <a href="<%=request.getContextPath() %>/stockLackProduct.admin"><h3>재고 부족</h3></a>
                          <p>Lorem ipsum psdea itgum rixt.</p>
                        </div>
                      </div>
                      <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="tile-stats">
                          <div class="icon"><i class="fa fa-caret-square-o-right"></i>
                          </div>
                          <div class="count todayProductOrderCount"><%=admin_todayProductOrderCount %></div>
                          <a href="<%=request.getContextPath() %>/todayProductOrder.admin"><h3>오늘 발주</h3></a>
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
