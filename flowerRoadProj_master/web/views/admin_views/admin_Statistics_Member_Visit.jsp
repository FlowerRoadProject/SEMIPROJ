<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.fr.jsp.admin.model.vo.AdminStatisticsMember"%>
<% 
	AdminStatisticsMember visitM1 = (AdminStatisticsMember)(request.getAttribute("visitM1"));
	AdminStatisticsMember visitM2 = (AdminStatisticsMember)(request.getAttribute("visitM2"));
	AdminStatisticsMember visitM3 = (AdminStatisticsMember)(request.getAttribute("visitM3"));
	AdminStatisticsMember visitM4 = (AdminStatisticsMember)(request.getAttribute("visitM4"));
	AdminStatisticsMember visitM5 = (AdminStatisticsMember)(request.getAttribute("visitM5"));
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
                <h3>최다 방문 회원 통계 <small>Statistics</small></h3>
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
                         <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12" style="">
                            <img src="<%=request.getContextPath() %>/resources/images/member/<%=visitM1.getMemberImage() %>" alt="이미지 없음" style="width: 100%;">
                          </div>
                          <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12" style="">
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>회원명</h4>
                                 <p><%=visitM1.getMemberName() %></p>
                             </div>
                             <div class="col-lg-12 col-md-6 col-sm-6 col-xs-6">
                                 <h4>등급</h4>
                                 <p><%=visitM1.getMemberGrade() %></p>
                             </div>
                              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 방문 횟수</h4>
                                 <p><%=visitM1.getMemberVisitTime() %></p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 방문 수 대비 <small><%=visitM1.getRateBytotalVisitTime() %>%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="<%=visitM1.getRateBytotalVisitTime() %>"></div>
                                    </div>
                                    
                                </div>
                             </div>
                          </div>
                          <div class="x_content2 col-md-12 col-sm-12 col-xs-12" style="height: 250px;">
                           <h4>시간별 방문 통계</h4>
                            <div id="memberVisit1" style="width:100%; height:210px;"></div>
                          </div>
                        </div>
                      </div>
                      <div class="panel col-md-12 col-sm-12 col-xs-12">
                        <a class="panel-heading collapsed" role="tab" id="headingTwo" data-toggle="collapse" data-parent="#accordion" href="#top2star">
                          <h4 class="panel-title">TOP 2</h4>
                        </a>
                        <div id="top2star" class="panel-collapse collapse col-md-12 col-sm-12 col-xs-12" role="tabpanel" style="padding: 10px;">
                         <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12" style="">
                            <img src="<%=request.getContextPath() %>/resources/images/member/<%=visitM2.getMemberImage() %>" alt="이미지 없음" style="width: 100%;">
                          </div>
                          <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12" style="">
                             <div class="col-lg-12 col-md-6 col-sm-6 col-xs-6">
                                 <h4>회원명</h4>
                                 <p><%=visitM2.getMemberName() %></p>
                             </div>
                             <div class="col-lg-12 col-md-6 col-sm-6 col-xs-6">
                                 <h4>등급</h4>
                                 <p><%=visitM2.getMemberGrade() %></p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 방문 횟수</h4>
                                 <p><%=visitM2.getMemberVisitTime() %></p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 방문 수 대비 <small><%=visitM2.getRateBytotalVisitTime() %>%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="<%=visitM2.getRateBytotalVisitTime() %>"></div>
                                    </div>
                                    
                                </div>
                             </div>
                          </div>
                          <div class="x_content2 col-md-12 col-sm-12 col-xs-12" style="height: 250px;">
                           <h4>시간별 방문 통계</h4>
                            <div id="memberVisit2" style="width:100%; height:210px;"></div>
                          </div>
                        </div>
                      </div>
                      <div class="panel col-md-12 col-sm-12 col-xs-12">
                        <a class="panel-heading collapsed" role="tab" id="headingThree" data-toggle="collapse" data-parent="#accordion" href="#top3star">
                          <h4 class="panel-title">TOP 3</h4>
                        </a>
                        <div id="top3star" class="panel-collapse collapse col-md-12 col-sm-12 col-xs-12" role="tabpanel" style="padding: 10px;">
                         <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12" style="">
                            <img src="<%=request.getContextPath() %>/resources/images/member/<%=visitM3.getMemberImage() %>" alt="이미지 없음" style="width: 100%;">
                          </div>
                          <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12" style="">
                             <div class="col-lg-12 col-md-6 col-sm-6 col-xs-6">
                                 <h4>회원명</h4>
                                 <p><%=visitM3.getMemberName() %></p>
                             </div>
                             <div class="col-lg-12 col-md-6 col-sm-6 col-xs-6">
                                 <h4>등급</h4>
                                 <p><%=visitM3.getMemberGrade() %></p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 방문 횟수</h4>
                                 <p><%=visitM3.getMemberVisitTime() %></p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 방문 수 대비 <small><%=visitM3.getRateBytotalVisitTime() %>%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="<%=visitM3.getRateBytotalVisitTime() %>"></div>
                                    </div>
                                    
                                </div>
                             </div>
                          </div>
                          <div class="x_content2 col-md-12 col-sm-12 col-xs-12" style="height: 250px;">
                           <h4>시간별 방문 통계</h4>
                            <div id="memberVisit3" style="width:100%; height:210px;"></div>
                          </div>
                        </div>
                      </div>
                      <div class="panel col-md-12 col-sm-12 col-xs-12">
                        <a class="panel-heading collapsed" role="tab" id="headingFour" data-toggle="collapse" data-parent="#accordion" href="#top4star">
                          <h4 class="panel-title">TOP 4</h4>
                        </a>
                        <div id="top4star" class="panel-collapse collapse col-md-12 col-sm-12 col-xs-12" role="tabpanel" style="padding: 10px;">
                         <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12" style="">
                            <img src="<%=request.getContextPath() %>/resources/images/member/<%=visitM4.getMemberImage() %>" alt="이미지 없음" style="width: 100%;">
                          </div>
                          <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12" style="">
                             <div class="col-lg-12 col-md-6 col-sm-6 col-xs-6">
                                 <h4>회원명</h4>
                                 <p><%=visitM4.getMemberName() %></p>
                             </div>
                             <div class="col-lg-12 col-md-6 col-sm-6 col-xs-6">
                                 <h4>등급</h4>
                                 <p><%=visitM4.getMemberGrade() %></p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 방문 횟수</h4>
                                 <p><%=visitM4.getMemberVisitTime() %></p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 방문 수 대비 <small><%=visitM4.getRateBytotalVisitTime() %>%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="<%=visitM4.getRateBytotalVisitTime() %>"></div>
                                    </div>
                                    
                                </div>
                             </div>
                          </div>
                          <div class="x_content2 col-md-12 col-sm-12 col-xs-12" style="height: 250px;">
                           <h4>시간별 방문 통계</h4>
                            <div id="memberVisit4" style="width:100%; height:210px;"></div>
                          </div>
                        </div>
                      </div>
                      <div class="panel col-md-12 col-sm-12 col-xs-12">
                        <a class="panel-heading collapsed" role="tab" id="headingFive" data-toggle="collapse" data-parent="#accordion" href="#top5star">
                          <h4 class="panel-title">TOP 5</h4>
                        </a>
                        <div id="top5star" class="panel-collapse collapse col-md-12 col-sm-12 col-xs-12" role="tabpanel" style="padding: 10px;">
                         <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12" style="">
                            <img src="<%=request.getContextPath() %>/resources/images/member/<%=visitM5.getMemberImage() %>" alt="이미지 없음" style="width: 100%;">
                          </div>
                          <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12" style="">
                             <div class="col-lg-12 col-md-6 col-sm-6 col-xs-6">
                                 <h4>회원명</h4>
                                 <p><%=visitM5.getMemberName() %></p>
                             </div>
                             <div class="col-lg-12 col-md-6 col-sm-6 col-xs-6">
                                 <h4>등급</h4>
                                 <p><%=visitM5.getMemberGrade() %></p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 방문 횟수</h4>
                                 <p><%=visitM5.getMemberVisitTime() %></p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 방문 수 대비 <small><%=visitM5.getRateBytotalVisitTime() %>%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="<%=visitM5.getRateBytotalVisitTime() %>"></div>
                                    </div>
                                    
                                </div>
                             </div>
                          </div>
                          <div class="x_content2 col-md-12 col-sm-12 col-xs-12" style="height: 250px;">
                           <h4>시간별 방문 통계</h4>
                            <div id="memberVisit5" style="width:100%; height:210px;"></div>
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
