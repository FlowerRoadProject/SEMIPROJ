<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.fr.jsp.admin.model.vo.AdminStatisticsMember"%>
<% 
	AdminStatisticsMember buyM1 = (AdminStatisticsMember)(request.getAttribute("buyM1"));
	AdminStatisticsMember buyM2 = (AdminStatisticsMember)(request.getAttribute("buyM2"));
	AdminStatisticsMember buyM3 = (AdminStatisticsMember)(request.getAttribute("buyM3"));
	AdminStatisticsMember buyM4 = (AdminStatisticsMember)(request.getAttribute("buyM4"));
	AdminStatisticsMember buyM5 = (AdminStatisticsMember)(request.getAttribute("buyM5"));
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
                <h3>최다 구매 회원 통계 <small>Statistics</small></h3>
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
                    <div  class="col-lg-3 col-md-3 col-sm-3 col-xs-12" style="float: right">
                      <!-- required for floating -->
                      <!-- Nav tabs -->
                      <ul class="nav nav-tabs bar_tabs">
                        <li class="active  col-lg-12 col-md-12 col-sm-12 col-xs-2"><a href="#top1right" data-toggle="tab">TOP 1</a>
                        </li>
                        <li class="col-lg-12 col-md-12 col-sm-12 col-xs-2"><a href="#top2right" data-toggle="tab">TOP 2</a>
                        </li>
                        <li class="col-lg-12 col-md-12 col-sm-12 col-xs-2"><a href="#top3right" data-toggle="tab">TOP 3</a>
                        </li>
                        <li class="col-lg-12 col-md-12 col-sm-12 col-xs-2"><a href="#top4right" data-toggle="tab">TOP 4</a>
                        </li>
                        <li class="col-lg-12 col-md-12 col-sm-12 col-xs-2"><a href="#top5right" data-toggle="tab">TOP 5</a>
                        </li>
                      </ul>
                    </div>
                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12" style="float: left">
                      <!-- Tab panes -->
                      <div class="tab-content">
                        <div class="tab-pane active" id="top1right">
                          <div class="col-lg-4 col-md-5 col-sm-5 col-xs-12" style="">
                            <img class="img-circle"src="<%=request.getContextPath() %>/resources/images/member/<%=buyM1.getMemberImage() %>" alt="이미지 없음" style="width: 100%;">
                          </div>
                          <div class="col-lg-8 col-md-7 col-sm-7 col-xs-12" style="">
                             <div class="col-lg-12 col-md-6 col-sm-6 col-xs-6">
                                 <h4>회원명</h4>
                                 <p><%=buyM1.getMemberName() %></p>
                             </div>
                             <div class="col-lg-12 col-md-6 col-sm-6 col-xs-6">
                                 <h4>등급</h4>
                                 <p><%=buyM1.getMemberGrade() %></p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 구매 횟수</h4>
                                 <p><%=buyM1.getMemberPurchaseTime() %> 회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 구매 횟수 대비 <small><%=buyM1.getRateBytotalPurchaseTime() %>%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="<%=buyM1.getRateBytotalPurchaseTime() %>"></div>
                                    </div>
                                    
                                </div>
                             </div>
                          </div>
                          <div class="x_content">
                           <h4>시간별 구매 통계</h4>
                            <canvas id="memberBuy1"></canvas>
                          </div>
                        </div>
                        <div class="tab-pane" id="top2right">
                         <div class="col-lg-4 col-md-5 col-sm-5 col-xs-12" style="">
                            <img class="img-circle"src="<%=request.getContextPath() %>/resources/images/member/<%=buyM2.getMemberImage() %>" alt="이미지 없음" style="width: 100%;">
                          </div>
                          <div class="col-lg-8 col-md-7 col-sm-7 col-xs-12" style="">
                             <div class="col-lg-12 col-md-6 col-sm-6 col-xs-6">
                                 <h4>회원명</h4>
                                 <p><%=buyM2.getMemberName() %></p>
                             </div>
                             <div class="col-lg-12 col-md-6 col-sm-6 col-xs-6">
                                 <h4>등급</h4>
                                 <p><%=buyM2.getMemberGrade() %></p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 구매 횟수</h4>
                                 <p><%=buyM2.getMemberPurchaseTime() %> 회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 구매 횟수 대비 <small><%=buyM2.getRateBytotalPurchaseTime() %>%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="<%=buyM2.getRateBytotalPurchaseTime() %>"></div>
                                    </div>
                                    
                                </div>
                             </div>
                          </div>
                          <div class="x_content">
                           <h4>시간별 구매 통계</h4>
                            <canvas id="memberBuy2"></canvas>
                          </div>
                        </div>
                        <div class="tab-pane" id="top3right">
                         <div class="col-lg-4 col-md-5 col-sm-5 col-xs-12" style="">
                            <img class="img-circle"src="<%=request.getContextPath() %>/resources/images/member/<%=buyM3.getMemberImage() %>" alt="이미지 없음" style="width: 100%;">
                          </div>
                          <div class="col-lg-8 col-md-7 col-sm-7 col-xs-12" style="">
                             <div class="col-lg-12 col-md-6 col-sm-6 col-xs-6">
                                 <h4>회원명</h4>
                                 <p><%=buyM3.getMemberName() %></p>
                             </div>
                             <div class="col-lg-12 col-md-6 col-sm-6 col-xs-6">
                                 <h4>등급</h4>
                                 <p><%=buyM3.getMemberGrade() %></p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 구매 횟수</h4>
                                 <p><%=buyM3.getMemberPurchaseTime() %> 회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 구매 횟수 대비 <small><%=buyM3.getRateBytotalPurchaseTime() %>%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="<%=buyM3.getRateBytotalPurchaseTime() %>"></div>
                                    </div>
                                    
                                </div>
                             </div>
                          </div>
                          <div class="x_content">
                           <h4>시간별 구매 통계</h4>
                            <canvas id="memberBuy3"></canvas>
                          </div>
                        </div>
                        <div class="tab-pane" id="top4right">
                         <div class="col-lg-4 col-md-5 col-sm-5 col-xs-12" style="">
                            <img class="img-circle"src="<%=request.getContextPath() %>/resources/images/member/<%=buyM4.getMemberImage() %>" alt="이미지 없음" style="width: 100%;">
                          </div>
                          <div class="col-lg-8 col-md-7 col-sm-7 col-xs-12" style="">
                             <div class="col-lg-12 col-md-6 col-sm-6 col-xs-6">
                                 <h4>회원명</h4>
                                 <p><%=buyM4.getMemberName() %></p>
                             </div>
                             <div class="col-lg-12 col-md-6 col-sm-6 col-xs-6">
                                 <h4>등급</h4>
                                 <p><%=buyM4.getMemberGrade() %></p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 구매 횟수</h4>
                                 <p><%=buyM4.getMemberPurchaseTime() %> 회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 구매 횟수 대비 <small><%=buyM4.getRateBytotalPurchaseTime() %>%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="<%=buyM4.getRateBytotalPurchaseTime() %>"></div>
                                    </div>
                                    
                                </div>
                             </div>
                          </div>
                          <div class="x_content">
                           <h4>시간별 구매 통계</h4>
                            <canvas id="memberBuy4"></canvas>
                          </div>
                        </div>
                        <div class="tab-pane" id="top5right">
                         <div class="col-lg-4 col-md-5 col-sm-5 col-xs-12" style="">
                            <img class="img-circle"src="<%=request.getContextPath() %>/resources/images/member/<%=buyM5.getMemberImage() %>" alt="이미지 없음" style="width: 100%;">
                          </div>
                          <div class="col-lg-8 col-md-7 col-sm-7 col-xs-12" style="">
                             <div class="col-lg-12 col-md-6 col-sm-6 col-xs-6">
                                 <h4>회원명</h4>
                                 <p><%=buyM5.getMemberName() %></p>
                             </div>
                             <div class="col-lg-12 col-md-6 col-sm-6 col-xs-6">
                                 <h4>등급</h4>
                                 <p><%=buyM5.getMemberGrade() %></p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 구매 횟수</h4>
                                 <p><%=buyM5.getMemberPurchaseTime() %> 회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 구매 횟수 대비 <small><%=buyM5.getRateBytotalPurchaseTime() %>%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="<%=buyM5.getRateBytotalPurchaseTime() %>"></div>
                                    </div>
                                    
                                </div>
                             </div>
                          </div>
                          <div class="x_content">
                           <h4>시간별 구매 통계</h4>
                            <canvas id="memberBuy5"></canvas>
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
