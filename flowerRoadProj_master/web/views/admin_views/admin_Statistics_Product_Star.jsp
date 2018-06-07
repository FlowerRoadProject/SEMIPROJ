<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.fr.jsp.admin.model.vo.AdminStatisticsProduct"%>
<% 
	AdminStatisticsProduct starP1 = (AdminStatisticsProduct)(request.getAttribute("starP1"));
	AdminStatisticsProduct starP2 = (AdminStatisticsProduct)(request.getAttribute("starP2"));
	AdminStatisticsProduct starP3 = (AdminStatisticsProduct)(request.getAttribute("starP3"));
	AdminStatisticsProduct starP4 = (AdminStatisticsProduct)(request.getAttribute("starP4"));
	AdminStatisticsProduct starP5 = (AdminStatisticsProduct)(request.getAttribute("starP5"));
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
                <h3>최고 별점 상품 통계 <small>Statistics</small></h3>
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
                    <div class="accordion" id="accordion" role="tablist">
                      <div class="panel col-md-12 col-sm-12 col-xs-12">
                        <a class="panel-heading" role="tab" id="headingOne" data-toggle="collapse" data-parent="#accordion" href="#top1star">
                          <h4 class="panel-title">TOP 1</h4>
                        </a>
                        <div id="top1star" class="panel-collapse collapse in col-md-12 col-sm-12 col-xs-12" role="tabpanel" style="padding: 10px;">
                         <div class="col-lg-5 col-md-4 col-sm-4 col-xs-12" style="">
                            <img src="<%=request.getContextPath() %>/resources/images/product/<%=starP1.getProductImage() %>" alt="상품 이미지" style="width: 100%;">
                          </div>
                          <div class="col-lg-7 col-md-8 col-sm-8 col-xs-12" style="">
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>상품명</h4>
                                 <p><%=starP1.getProductName() %></p>
                             </div>
                              <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>평균 별점</h4>
                                 <p><%=starP1.getProductStarAverage() %> 점</p>
                             </div>
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>댓글 수</h4>
                                 <p><%=starP1.getProductReviewCount() %> 개</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 댓글 수 대비 <small><%=starP1.getRateBytotalReviewCount() %> %</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="<%=starP1.getRateBytotalReviewCount() %>"></div>
                                    </div>
                                    
                                </div>
                             </div>
                          </div>
                          <div class="x_content">
                           <h4>연령별 별점 회원 <small>(남/여)</small></h4>
                            <canvas id="starProduct1"></canvas>
                          </div>
                        </div>
                      </div>
                      <div class="panel col-md-12 col-sm-12 col-xs-12">
                        <a class="panel-heading collapsed" role="tab" id="headingTwo" data-toggle="collapse" data-parent="#accordion" href="#top2star">
                          <h4 class="panel-title">TOP 2</h4>
                        </a>
                         <div id="top2star" class="panel-collapse collapse col-md-12 col-sm-12 col-xs-12" role="tabpanel" style="padding: 10px;">
                         <div class="col-lg-5 col-md-4 col-sm-4 col-xs-12" style="">
                            <img src="<%=request.getContextPath() %>/resources/images/product/<%=starP2.getProductImage() %>" alt="상품 이미지" style="width: 100%;">
                          </div>
                          <div class="col-lg-7 col-md-8 col-sm-8 col-xs-12" style="">
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>상품명</h4>
                                 <p><%=starP2.getProductName() %></p>
                             </div>
                              <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>평균 별점</h4>
                                 <p><%=starP2.getProductStarAverage() %> 점</p>
                             </div>
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>댓글 수</h4>
                                 <p><%=starP2.getProductReviewCount() %> 개</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 댓글 수 대비 <small><%=starP2.getRateBytotalReviewCount() %> %</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="<%=starP2.getRateBytotalReviewCount() %>"></div>
                                    </div>
                                    
                                </div>
                             </div>
                          </div>
                          <div class="x_content">
                           <h4>연령별 별점 회원 <small>(남/여)</small></h4>
                            <canvas id="starProduct2"></canvas>
                          </div>
                        </div>
                      </div>
                      <div class="panel col-md-12 col-sm-12 col-xs-12">
                        <a class="panel-heading collapsed" role="tab" id="headingThree" data-toggle="collapse" data-parent="#accordion" href="#top3star">
                          <h4 class="panel-title">TOP 3</h4>
                        </a>
                        <div id="top3star" class="panel-collapse collapse col-md-12 col-sm-12 col-xs-12" role="tabpanel" style="padding: 10px;">
                         
                         <div class="col-lg-5 col-md-4 col-sm-4 col-xs-12" style="">
                            <img src="<%=request.getContextPath() %>/resources/images/product/<%=starP3.getProductImage() %>" alt="상품 이미지" style="width: 100%;">
                          </div>
                          <div class="col-lg-7 col-md-8 col-sm-8 col-xs-12" style="">
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>상품명</h4>
                                 <p><%=starP3.getProductName() %></p>
                             </div>
                              <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>평균 별점</h4>
                                 <p><%=starP3.getProductStarAverage() %> 점</p>
                             </div>
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>댓글 수</h4>
                                 <p><%=starP3.getProductReviewCount() %> 개</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 댓글 수 대비 <small><%=starP3.getRateBytotalReviewCount() %> %</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="<%=starP3.getRateBytotalReviewCount() %>"></div>
                                    </div>
                                    
                                </div>
                             </div>
                          </div>
                          <div class="x_content">
                           <h4>연령별 별점 회원 <small>(남/여)</small></h4>
                            <canvas id="starProduct3"></canvas>
                          </div>
                        
                        </div>
                      </div>
                      <div class="panel col-md-12 col-sm-12 col-xs-12">
                        <a class="panel-heading collapsed" role="tab" id="headingFour" data-toggle="collapse" data-parent="#accordion" href="#top4star">
                          <h4 class="panel-title">TOP 4</h4>
                        </a>
                        <div id="top4star" class="panel-collapse collapse col-md-12 col-sm-12 col-xs-12" role="tabpanel" style="padding: 10px;">
                         
                         <div class="col-lg-5 col-md-4 col-sm-4 col-xs-12" style="">
                            <img src="<%=request.getContextPath() %>/resources/images/product/<%=starP4.getProductImage() %>" alt="상품 이미지" style="width: 100%;">
                          </div>
                          <div class="col-lg-7 col-md-8 col-sm-8 col-xs-12" style="">
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>상품명</h4>
                                 <p><%=starP4.getProductName() %></p>
                             </div>
                              <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>평균 별점</h4>
                                 <p><%=starP4.getProductStarAverage() %> 점</p>
                             </div>
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>댓글 수</h4>
                                 <p><%=starP4.getProductReviewCount() %> 개</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 댓글 수 대비 <small><%=starP4.getRateBytotalReviewCount() %> %</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="<%=starP4.getRateBytotalReviewCount() %>"></div>
                                    </div>
                                    
                                </div>
                             </div>
                          </div>
                          <div class="x_content">
                           <h4>연령별 별점 회원 <small>(남/여)</small></h4>
                            <canvas id="starProduct4"></canvas>
                          </div>
                        
                        </div>
                      </div>
                      <div class="panel col-md-12 col-sm-12 col-xs-12">
                        <a class="panel-heading collapsed" role="tab" id="headingFive" data-toggle="collapse" data-parent="#accordion" href="#top5star">
                          <h4 class="panel-title">TOP 5</h4>
                        </a>
                        <div id="top5star" class="panel-collapse collapse col-md-12 col-sm-12 col-xs-12" role="tabpanel" style="padding: 10px;">
                         
                         <div class="col-lg-5 col-md-4 col-sm-4 col-xs-12" style="">
                            <img src="<%=request.getContextPath() %>/resources/images/product/<%=starP5.getProductImage() %>" alt="상품 이미지" style="width: 100%;">
                          </div>
                          <div class="col-lg-7 col-md-8 col-sm-8 col-xs-12" style="">
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>상품명</h4>
                                 <p><%=starP5.getProductName() %></p>
                             </div>
                              <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>평균 별점</h4>
                                 <p><%=starP5.getProductStarAverage() %> 점</p>
                             </div>
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>댓글 수</h4>
                                 <p><%=starP5.getProductReviewCount() %> 개</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 댓글 수 대비 <small><%=starP5.getRateBytotalReviewCount() %> %</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="<%=starP5.getRateBytotalReviewCount() %>"></div>
                                    </div>
                                    
                                </div>
                             </div>
                          </div>
                          <div class="x_content">
                           <h4>연령별 별점 회원 <small>(남/여)</small></h4>
                            <canvas id="starProduct5"></canvas>
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
