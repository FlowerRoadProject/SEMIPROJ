<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.fr.jsp.admin.model.vo.AdminStatisticsProduct"%>
<% 
	AdminStatisticsProduct sellP1 = (AdminStatisticsProduct)(request.getAttribute("sellP1"));
	AdminStatisticsProduct sellP2 = (AdminStatisticsProduct)(request.getAttribute("sellP2"));
	AdminStatisticsProduct sellP3 = (AdminStatisticsProduct)(request.getAttribute("sellP3"));
	AdminStatisticsProduct sellP4 = (AdminStatisticsProduct)(request.getAttribute("sellP4"));
	AdminStatisticsProduct sellP5 = (AdminStatisticsProduct)(request.getAttribute("sellP5"));
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
                <h3>최고 매출 상품 통계 <small>Statistics</small></h3>
              </div>

              <div class="title_right">
                
              </div>
            </div>
            <div class="clearfix"></div>
            <div class="">
              <div class="clearfix"></div>
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2><i class="fa fa-bars"></i> TOP 5 <small></small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                      <!-- required for floating -->
                      <!-- Nav tabs -->
                      <ul class="nav nav-tabs bar_tabs">
                        <li class="active col-lg-12 col-md-12 col-sm-12 col-xs-2"><a href="#top1left" data-toggle="tab">TOP 1</a>
                        </li>
                        <li class="col-lg-12 col-md-12 col-sm-12 col-xs-2"><a href="#top2left" data-toggle="tab">TOP 2</a>
                        </li>
                        <li class="col-lg-12 col-md-12 col-sm-12 col-xs-2"><a href="#top3left" data-toggle="tab">TOP 3</a>
                        </li>
                        <li class="col-lg-12 col-md-12 col-sm-12 col-xs-2"><a href="#top4left" data-toggle="tab">TOP 4</a>
                        </li>
                        <li class="col-lg-12 col-md-12 col-sm-12 col-xs-2"><a href="#top5left" data-toggle="tab">TOP 5</a>
                        </li>
                      </ul>
                    </div>

                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                      <!-- Tab panes -->
                      <div class="tab-content">
                        <div class="tab-pane active" id="top1left">
                         <div class="col-md-5 col-sm-5 col-xs-12" style="">
                            <img src="<%=request.getContextPath() %>/resources/images/product/<%=sellP1.getProductImage() %>" alt="상품 이미지" style="width: 100%;">
                          </div>
                          <div class="col-md-7 col-sm-7 col-xs-12" style="">
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>상품명</h4>
                                 <p><%=sellP1.getProductName() %></p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 매출 금액</h4>
                                 <p>￦ <%=sellP1.getProductSellAmount() %></p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 매출액 대비 <small><%=sellP1.getRateBytotalSellAmount() %> %</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="<%=sellP1.getRateBytotalSellAmount() %>"></div>
                                    </div>
                                    
                                </div>
                             </div>
                          </div>
                          
                          <div class="x_content">
                            <h4>연령별 구매 회원 <small>(남/여)</small></h4>
                            <canvas id="sellProduct1"></canvas>
                          </div>
                        </div>
                        <div class="tab-pane" id="top2left">
                         
                         <div class="col-md-5 col-sm-5 col-xs-12" style="">
                            <img src="<%=request.getContextPath() %>/resources/images/product/<%=sellP2.getProductImage() %>" alt="상품 이미지" style="width: 100%;">
                          </div>
                          <div class="col-md-7 col-sm-7 col-xs-12" style="">
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>상품명</h4>
                                 <p><%=sellP2.getProductName() %></p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 매출 금액</h4>
                                 <p>￦ <%=sellP2.getProductSellAmount() %></p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 매출액 대비 <small><%=sellP2.getRateBytotalSellAmount() %> %</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="<%=sellP2.getRateBytotalSellAmount() %>"></div>
                                    </div>
                                    
                                </div>
                             </div>
                          </div>
                          
                          <div class="x_content">
                            <h4>연령별 구매 회원 <small>(남/여)</small></h4>
                            <canvas id="sellProduct2"></canvas>
                          </div>
                        </div>
                        <div class="tab-pane" id="top3left">
                         
                         <div class="col-md-5 col-sm-5 col-xs-12" style="">
                            <img src="<%=request.getContextPath() %>/resources/images/product/<%=sellP3.getProductImage() %>" alt="상품 이미지" style="width: 100%;">
                          </div>
                          <div class="col-md-7 col-sm-7 col-xs-12" style="">
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>상품명</h4>
                                 <p><%=sellP3.getProductName()%></p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 매출 금액</h4>
                                 <p>￦ <%=sellP3.getProductSellAmount() %></p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 매출액 대비 <small><%=sellP3.getRateBytotalSellAmount() %> %</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="<%=sellP3.getRateBytotalSellAmount() %>"></div>
                                    </div>
                                    
                                </div>
                             </div>
                          </div>
                          
                          <div class="x_content">
                            <h4>연령별 구매 회원 <small>(남/여)</small></h4>
                            <canvas id="sellProduct3"></canvas>
                          </div>
                        </div>
                        <div class="tab-pane" id="top4left">
                         <div class="col-md-5 col-sm-5 col-xs-12" style="">
                            <img src="<%=request.getContextPath() %>/resources/images/product/<%=sellP4.getProductImage() %>" alt="상품 이미지" style="width: 100%;">
                          </div>
                          <div class="col-md-7 col-sm-7 col-xs-12" style="">
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>상품명</h4>
                                 <p><%=sellP4.getProductName() %></p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 매출 금액</h4>
                                 <p>￦ <%=sellP4.getProductSellAmount() %></p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 매출액 대비 <small><%=sellP4.getRateBytotalSellAmount() %> %</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="<%=sellP4.getRateBytotalSellAmount() %>"></div>
                                    </div>
                                    
                                </div>
                             </div>
                          </div>
                          
                          <div class="x_content">
                            <h4>연령별 구매 회원 <small>(남/여)</small></h4>
                            <canvas id="sellProduct4"></canvas>
                          </div>
                        </div>
                        <div class="tab-pane" id="top5left">
                         <div class="col-md-5 col-sm-5 col-xs-12" style="">
                            <img src="<%=request.getContextPath() %>/resources/images/product/<%=sellP5.getProductImage() %>" alt="상품 이미지" style="width: 100%;">
                          </div>
                          <div class="col-md-7 col-sm-7 col-xs-12" style="">
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>상품명</h4>
                                 <p><%=sellP5.getProductName() %></p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 매출 금액</h4>
                                 <p>￦ <%=sellP5.getProductSellAmount() %></p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 매출액 대비 <small><%=sellP5.getRateBytotalSellAmount() %> %</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="<%=sellP5.getRateBytotalSellAmount() %>"></div>
                                    </div>
                                    
                                </div>
                             </div>
                          </div>
                          
                          <div class="x_content">
                            <h4>연령별 구매 회원 <small>(남/여)</small></h4>
                            <canvas id="sellProduct5"></canvas>
                          </div>
                        </div>
                      </div>
                    </div>

                  </div>
                </div>
              </div>
              
            </div>
            
          </div>
          <div class="clearfix"></div>
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
    </div>
	<script>
		var mainPath = '<%=request.getContextPath() %>';
		var sellP1 = '<%=sellP1.getProductName()%>';
		var sellP2 = '<%=sellP2.getProductName()%>';
		var sellP3 = '<%=sellP3.getProductName()%>';
		var sellP4 = '<%=sellP4.getProductName()%>';
		var sellP5 = '<%=sellP5.getProductName()%>';
	</script>
	<!-- admin_JS -->
    <%@ include file="common/admin_JS.jsp" %>
  </body>
</html>
