<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.fr.jsp.admin.model.vo.AdminStatisticsProduct"%>
<% 
	AdminStatisticsProduct clickP1 = (AdminStatisticsProduct)(request.getAttribute("clickP1"));
	AdminStatisticsProduct clickP2 = (AdminStatisticsProduct)(request.getAttribute("clickP2"));
	AdminStatisticsProduct clickP3 = (AdminStatisticsProduct)(request.getAttribute("clickP3"));
	AdminStatisticsProduct clickP4 = (AdminStatisticsProduct)(request.getAttribute("clickP4"));
	AdminStatisticsProduct clickP5 = (AdminStatisticsProduct)(request.getAttribute("clickP5"));
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
                <h3>최다 조회 상품 통계 <small>Statistics</small></h3>
              </div>

              <div class="title_right">
                
              </div>
            </div>
            <div class="clearfix"></div>
            <div class="">
              
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2><i class="fa fa-align-left"></i> TOP 5 <small></small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                    <!-- start accordion -->
                    <div class="accordion" id="accordion1" role="tablist">
                      <div class="panel col-md-12 col-sm-12 col-xs-12">
                        <a class="panel-heading" role="tab" id="headingOne1" data-toggle="collapse" data-parent="#accordion1" href="#top1click">
                          <h4 class="panel-title">TOP 1</h4>
                        </a>
                        <div id="top1click" class="panel-collapse collapse in col-md-12 col-sm-12 col-xs-12" role="tabpanel" style="padding: 10px;">
                         
                         <div class="col-lg-5 col-md-4 col-sm-4 col-xs-12" style="">
                            <img src="<%=request.getContextPath() %>/resources/images/product/<%=clickP1.getProductImage() %>" alt="상품 이미지" style="width: 100%;">
                          </div>
                          <div class="col-lg-7 col-md-8 col-sm-8 col-xs-12" style="">
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>상품명</h4>
                                 <p><%=clickP1.getProductName() %></p>
                             </div>
                              <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>누적 조회 수</h4>
                                 <p><%=clickP1.getProductClickCount() %> 회</p>
                             </div>
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>찜 횟수</h4>
                                 <p><%=clickP1.getProductFavoriteCount() %> 회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 조회 수 대비 <small><%=clickP1.getRateBytotalClickCount() %> %</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="<%=clickP1.getRateBytotalClickCount() %>"></div>
                                    </div>
                                    
                                </div>
                             </div>
                          </div>
                          <div class="x_content">
                               <h4>연령별 조회 회원 <small>(남/여)</small></h4>
                                <canvas id="clickProduct1"></canvas>
                            
                          </div>
                        </div>
                      </div>
                      <div class="panel col-md-12 col-sm-12 col-xs-12">
                        <a class="panel-heading collapsed" role="tab" id="headingTwo2" data-toggle="collapse" data-parent="#accordion1" href="#top2click">
                          <h4 class="panel-title">TOP 2</h4>
                        </a>
                        <div id="top2click" class="panel-collapse collapse col-md-12 col-sm-12 col-xs-12" role="tabpanel" style="padding: 10px;">
                         
                         <div class="col-lg-5 col-md-4 col-sm-4 col-xs-12" style="">
                            <img src="<%=request.getContextPath() %>/resources/images/product/<%=clickP2.getProductImage() %>" alt="상품 이미지" style="width: 100%;">
                          </div>
                          <div class="col-lg-7 col-md-8 col-sm-8 col-xs-12" style="">
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>상품명</h4>
                                 <p><%=clickP2.getProductName() %></p>
                             </div>
                              <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>누적 조회 수</h4>
                                 <p><%=clickP2.getProductClickCount() %> 회</p>
                             </div>
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>찜 횟수</h4>
                                 <p><%=clickP2.getProductFavoriteCount() %> 회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 조회 수 대비 <small><%=clickP2.getRateBytotalClickCount() %> %</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="<%=clickP2.getRateBytotalClickCount() %>"></div>
                                    </div>
                                    
                                </div>
                             </div>
                          </div>
                          <div class="x_content">
                               <h4>연령별 조회 회원 <small>(남/여)</small></h4>
                                <canvas id="clickProduct2"></canvas>
                            
                          </div>
                        </div>
                      </div>
                      <div class="panel col-md-12 col-sm-12 col-xs-12">
                        <a class="panel-heading collapsed" role="tab" id="headingThree3" data-toggle="collapse" data-parent="#accordion1" href="#top3click">
                          <h4 class="panel-title">TOP 3</h4>
                        </a>
                        <div id="top3click" class="panel-collapse collapse col-md-12 col-sm-12 col-xs-12" role="tabpanel" style="padding: 10px;">
                         
                         <div class="col-lg-5 col-md-4 col-sm-4 col-xs-12" style="">
                            <img src="<%=request.getContextPath() %>/resources/images/product/<%=clickP3.getProductImage() %>" alt="상품 이미지" style="width: 100%;">
                          </div>
                          <div class="col-lg-7 col-md-8 col-sm-8 col-xs-12" style="">
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>상품명</h4>
                                 <p><%=clickP3.getProductName() %></p>
                             </div>
                              <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>누적 조회 수</h4>
                                 <p><%=clickP3.getProductClickCount() %> 회</p>
                             </div>
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>찜 횟수</h4>
                                 <p><%=clickP3.getProductFavoriteCount() %> 회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 조회 수 대비 <small><%=clickP3.getRateBytotalClickCount() %> %</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="<%=clickP3.getRateBytotalClickCount() %>"></div>
                                    </div>
                                    
                                </div>
                             </div>
                          </div>
                          <div class="x_content">
                               <h4>연령별 조회 회원 <small>(남/여)</small></h4>
                                <canvas id="clickProduct3"></canvas>
                            
                          </div>
                        </div>
                      </div>
                      <div class="panel col-md-12 col-sm-12 col-xs-12">
                        <a class="panel-heading collapsed" role="tab" id="headingFour4" data-toggle="collapse" data-parent="#accordion1" href="#top4click">
                          <h4 class="panel-title">TOP 4</h4>
                        </a>
                        <div id="top4click" class="panel-collapse collapse col-md-12 col-sm-12 col-xs-12" role="tabpanel" style="padding: 10px;">
                         
                         <div class="col-lg-5 col-md-4 col-sm-4 col-xs-12" style="">
                            <img src="<%=request.getContextPath() %>/resources/images/product/<%=clickP4.getProductImage() %>" alt="상품 이미지" style="width: 100%;">
                          </div>
                          <div class="col-lg-7 col-md-8 col-sm-8 col-xs-12" style="">
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>상품명</h4>
                                 <p><%=clickP4.getProductName() %></p>
                             </div>
                              <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>누적 조회 수</h4>
                                 <p><%=clickP4.getProductClickCount() %> 회</p>
                             </div>
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>찜 횟수</h4>
                                 <p><%=clickP4.getProductFavoriteCount() %> 회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 조회 수 대비 <small><%=clickP4.getRateBytotalClickCount() %> %</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="<%=clickP4.getRateBytotalClickCount() %>"></div>
                                    </div>
                                    
                                </div>
                             </div>
                          </div>
                          <div class="x_content">
                               <h4>연령별 조회 회원 <small>(남/여)</small></h4>
                                <canvas id="clickProduct4"></canvas>
                            
                          </div>
                        </div>
                      </div>
                      <div class="panel col-md-12 col-sm-12 col-xs-12">
                        <a class="panel-heading collapsed" role="tab" id="headingFive5" data-toggle="collapse" data-parent="#accordion1" href="#top5click">
                          <h4 class="panel-title">TOP 5</h4>
                        </a>
                        <div id="top5click" class="panel-collapse collapse col-md-12 col-sm-12 col-xs-12" role="tabpanel" style="padding: 10px;">
                         
                         <div class="col-lg-5 col-md-4 col-sm-4 col-xs-12" style="">
                            <img src="<%=request.getContextPath() %>/resources/images/product/<%=clickP5.getProductImage() %>" alt="상품 이미지" style="width: 100%;">
                          </div>
                          <div class="col-lg-7 col-md-8 col-sm-8 col-xs-12" style="">
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>상품명</h4>
                                 <p><%=clickP5.getProductName() %></p>
                             </div>
                              <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>누적 조회 수</h4>
                                 <p><%=clickP5.getProductClickCount() %> 회</p>
                             </div>
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>찜 횟수</h4>
                                 <p><%=clickP5.getProductFavoriteCount() %> 회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 조회 수 대비 <small><%=clickP5.getRateBytotalClickCount() %> %</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="<%=clickP5.getRateBytotalClickCount() %>"></div>
                                    </div>
                                    
                                </div>
                             </div>
                          </div>
                          <div class="x_content">
                               <h4>연령별 조회 회원 <small>(남/여)</small></h4>
                                <canvas id="clickProduct5"></canvas>
                            
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- end of accordion -->
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
