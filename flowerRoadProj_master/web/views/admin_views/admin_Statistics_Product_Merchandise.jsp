<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.fr.jsp.admin.model.vo.AdminStatisticsProduct"%>
<% 
	AdminStatisticsProduct merchandiseP1 = (AdminStatisticsProduct)(request.getAttribute("merchandiseP1"));
	AdminStatisticsProduct merchandiseP2 = (AdminStatisticsProduct)(request.getAttribute("merchandiseP2"));
	AdminStatisticsProduct merchandiseP3 = (AdminStatisticsProduct)(request.getAttribute("merchandiseP3"));
	AdminStatisticsProduct merchandiseP4 = (AdminStatisticsProduct)(request.getAttribute("merchandiseP4"));
	AdminStatisticsProduct merchandiseP5 = (AdminStatisticsProduct)(request.getAttribute("merchandiseP5"));
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
                <h3>최다 판매 상품 통계 <small>Statistics</small></h3>
              </div>

              <div class="title_right">
                
              </div>
            </div>
            <div class="clearfix"></div>
            <div class="">

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
                    <div  class="col-lg-12 col-md-3 col-sm-3 col-xs-12" style="float: right">
                      <!-- required for floating -->
                      <!-- Nav tabs -->
                      <ul class="nav nav-tabs bar_tabs">
                        <li class="active  col-lg-2 col-md-12 col-sm-12 col-xs-2"><a href="#top1right" data-toggle="tab">TOP 1</a>
                        </li>
                        <li class="col-lg-2 col-md-12 col-sm-12 col-xs-2"><a href="#top2right" data-toggle="tab">TOP 2</a>
                        </li>
                        <li class="col-lg-2 col-md-12 col-sm-12 col-xs-2"><a href="#top3right" data-toggle="tab">TOP 3</a>
                        </li>
                        <li class="col-lg-2 col-md-12 col-sm-12 col-xs-2"><a href="#top4right" data-toggle="tab">TOP 4</a>
                        </li>
                        <li class="col-lg-2 col-md-12 col-sm-12 col-xs-2"><a href="#top5right" data-toggle="tab">TOP 5</a>
                        </li>
                      </ul>
                    </div>
                    <div class="col-lg-12 col-md-9 col-sm-9 col-xs-12" style="float: left">
                      <!-- Tab panes -->
                      <div class="tab-content">
                        <div class="tab-pane active" id="top1right">
                         <div class="col-md-5 col-sm-5 col-xs-12" style="">
                            <img src="<%=request.getContextPath() %>/resources/images/product/<%=merchandiseP1.getProductImage() %>" alt="상품 이미지" style="width: 100%;">
                          </div>
                          <div class="col-md-7 col-sm-7 col-xs-12" style="">
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>상품명</h4>
                                 <p><%=merchandiseP1.getProductName() %></p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 판매 횟수</h4>
                                 <p><%=merchandiseP1.getProductMerchandiseCount() %> 회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 판매 수량 대비 <small><%=merchandiseP1.getRateByTotalMerchandiseCount() %> %</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="<%=merchandiseP1.getRateByTotalMerchandiseCount() %>"></div>
                                    </div>
                                    
                                </div>
                             </div>
                          </div>
                          
                          <div class="x_content">
                            <h4>연령별 구매 회원 <small>(남/여)</small></h4>
                            <canvas id="merchandiseProduct1"></canvas>
                          </div>
                        </div>
                        <div class="tab-pane" id="top2right">
                         <div class="col-md-5 col-sm-5 col-xs-12" style="">
                            <img src="<%=request.getContextPath() %>/resources/images/product/<%=merchandiseP2.getProductImage() %>" alt="상품 이미지" style="width: 100%;">
                          </div>
                          <div class="col-md-7 col-sm-7 col-xs-12" style="">
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>상품명</h4>
                                 <p><%=merchandiseP2.getProductName() %></p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 판매 횟수</h4>
                                 <p><%=merchandiseP2.getProductMerchandiseCount() %> 회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 판매 수량 대비 <small><%=merchandiseP2.getRateByTotalMerchandiseCount() %> %</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="<%=merchandiseP2.getRateByTotalMerchandiseCount() %>"></div>
                                    </div>
                                    
                                </div>
                             </div>
                          </div>
                          
                          <div class="x_content">
                            <h4>연령별 구매 회원 <small>(남/여)</small></h4>
                            <canvas id="merchandiseProduct2"></canvas>
                          </div>
                        </div>
                        <div class="tab-pane" id="top3right">
                         <div class="col-md-5 col-sm-5 col-xs-12" style="">
                            <img src="<%=request.getContextPath() %>/resources/images/product/<%=merchandiseP3.getProductImage() %>" alt="상품 이미지" style="width: 100%;">
                          </div>
                          <div class="col-md-7 col-sm-7 col-xs-12" style="">
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>상품명</h4>
                                 <p><%=merchandiseP3.getProductName() %></p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 판매 횟수</h4>
                                 <p><%=merchandiseP3.getProductMerchandiseCount() %> 회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 판매 수량 대비 <small><%=merchandiseP3.getRateByTotalMerchandiseCount() %> %</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="<%=merchandiseP3.getRateByTotalMerchandiseCount() %>"></div>
                                    </div>
                                    
                                </div>
                             </div>
                          </div>
                          
                          <div class="x_content">
                            <h4>연령별 구매 회원 <small>(남/여)</small></h4>
                            <canvas id="merchandiseProduct3"></canvas>
                          </div>
                        </div>
                        <div class="tab-pane" id="top4right">
                         <div class="col-md-5 col-sm-5 col-xs-12" style="">
                            <img src="<%=request.getContextPath() %>/resources/images/product/<%=merchandiseP4.getProductImage() %>" alt="상품 이미지" style="width: 100%;">
                          </div>
                          <div class="col-md-7 col-sm-7 col-xs-12" style="">
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>상품명</h4>
                                 <p><%=merchandiseP4.getProductName() %></p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 판매 횟수</h4>
                                 <p><%=merchandiseP4.getProductMerchandiseCount() %> 회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 판매 수량 대비 <small><%=merchandiseP4.getRateByTotalMerchandiseCount() %> %</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="<%=merchandiseP4.getRateByTotalMerchandiseCount() %>"></div>
                                    </div>
                                    
                                </div>
                             </div>
                          </div>
                          
                          <div class="x_content">
                            <h4>연령별 구매 회원 <small>(남/여)</small></h4>
                            <canvas id="merchandiseProduct4"></canvas>
                          </div>
                        </div>
                        <div class="tab-pane" id="top5right">
                         <div class="col-md-5 col-sm-5 col-xs-12" style="">
                            <img src="<%=request.getContextPath() %>/resources/images/product/<%=merchandiseP5.getProductImage() %>" alt="상품 이미지" style="width: 100%;">
                          </div>
                          <div class="col-md-7 col-sm-7 col-xs-12" style="">
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>상품명</h4>
                                 <p><%=merchandiseP5.getProductName() %></p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 판매 횟수</h4>
                                 <p><%=merchandiseP5.getProductMerchandiseCount() %> 회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 판매 수량 대비 <small><%=merchandiseP5.getRateByTotalMerchandiseCount() %> %</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="<%=merchandiseP5.getRateByTotalMerchandiseCount() %>"></div>
                                    </div>
                                    
                                </div>
                             </div>
                          </div>
                          
                          <div class="x_content">
                            <h4>연령별 구매 회원 <small>(남/여)</small></h4>
                            <canvas id="merchandiseProduct5"></canvas>
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
	</script>
	<!-- admin_JS -->
    <%@ include file="common/admin_JS.jsp" %>
  </body>
</html>
