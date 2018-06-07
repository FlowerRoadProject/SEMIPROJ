<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.fr.jsp.admin.model.vo.AdminStatisticsMember"%>
<% 
	AdminStatisticsMember reviewM1 = (AdminStatisticsMember)(request.getAttribute("reviewM1"));
	AdminStatisticsMember reviewM2 = (AdminStatisticsMember)(request.getAttribute("reviewM2"));
	AdminStatisticsMember reviewM3 = (AdminStatisticsMember)(request.getAttribute("reviewM3"));
	AdminStatisticsMember reviewM4 = (AdminStatisticsMember)(request.getAttribute("reviewM4"));
	AdminStatisticsMember reviewM5 = (AdminStatisticsMember)(request.getAttribute("reviewM5"));
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
                <h3>최다 댓글 회원 통계 <small>Statistics</small></h3>
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
                        <a class="panel-heading" role="tab" id="headingOne1" data-toggle="collapse" data-parent="#accordion1" href="#top1reply">
                          <h4 class="panel-title">TOP 1</h4>
                        </a>
                        <div id="top1reply" class="panel-collapse collapse in col-md-12 col-sm-12 col-xs-12" role="tabpanel" style="padding: 10px;">
                         <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12" style="">
                            <img src="<%=request.getContextPath() %>/resources/images/member/<%=reviewM1.getMemberImage() %>" alt="이미지 없음" style="width: 100%;">
                          </div>
                          <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12" style="">
                             <div class="col-lg-12 col-md-6 col-sm-6 col-xs-6">
                                 <h4>회원명</h4>
                                 <p><%=reviewM1.getMemberName() %></p>
                             </div>
                             <div class="col-lg-12 col-md-6 col-sm-6 col-xs-6">
                                 <h4>등급</h4>
                                 <p><%=reviewM1.getMemberGrade() %></p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 작성 횟수</h4>
                                 <p><%=reviewM1.getMemberReviewWriteTime() %> 회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 댓글 수 대비 <small><%=reviewM1.getRateBytotalReviewWriteTime() %>%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="<%=reviewM1.getRateBytotalReviewWriteTime() %>"></div>
                                    </div>
                                    
                                </div>
                             </div>
                          </div>
                          <div class="x_content2 col-md-12 col-sm-12 col-xs-12" style="height: 250px;">
                           <h4>시간별 작성 통계</h4>
                            <div id="memberReply1" style="width:100%; height:210px;"></div>
                          </div>
                        </div>
                      </div>
                      <div class="panel col-md-12 col-sm-12 col-xs-12">
                        <a class="panel-heading collapsed" role="tab" id="headingTwo2" data-toggle="collapse" data-parent="#accordion1" href="#top2reply">
                          <h4 class="panel-title">TOP 2</h4>
                        </a>
                        <div id="top2reply" class="panel-collapse collapse col-md-12 col-sm-12 col-xs-12" role="tabpanel" style="padding: 10px;">
                         <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12" style="">
                            <img src="<%=request.getContextPath() %>/resources/images/member/<%=reviewM2.getMemberImage() %>" alt="이미지 없음" style="width: 100%;">
                          </div>
                          <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12" style="">
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>회원명</h4>
                                 <p><%=reviewM2.getMemberName() %></p>
                             </div>
                             <div class="col-lg-12 col-md-6 col-sm-6 col-xs-6">
                                 <h4>등급</h4>
                                 <p><%=reviewM2.getMemberGrade() %></p>
                             </div>
                              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 작성 횟수</h4>
                                 <p><%=reviewM2.getMemberReviewWriteTime() %> 회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 댓글 수 대비 <small><%=reviewM2.getRateBytotalReviewWriteTime() %>%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="<%=reviewM2.getRateBytotalReviewWriteTime() %>"></div>
                                    </div>
                                    
                                </div>
                             </div>
                          </div>
                          <div class="x_content2 col-md-12 col-sm-12 col-xs-12" style="height: 250px;">
                           <h4>시간별 작성 통계</h4>
                            <div id="memberReply2" style="width:100%; height:210px;"></div>
                          </div>
                        </div>
                      </div>
                      <div class="panel col-md-12 col-sm-12 col-xs-12">
                        <a class="panel-heading collapsed" role="tab" id="headingThree3" data-toggle="collapse" data-parent="#accordion1" href="#top3reply">
                          <h4 class="panel-title">TOP 3</h4>
                        </a>
                        <div id="top3reply" class="panel-collapse collapse col-md-12 col-sm-12 col-xs-12" role="tabpanel" style="padding: 10px;">
                         <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12" style="">
                            <img src="<%=request.getContextPath() %>/resources/images/member/<%=reviewM3.getMemberImage() %>" alt="이미지 없음" style="width: 100%;">
                          </div>
                          <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12" style="">
                             <div class="col-lg-12 col-md-6 col-sm-6 col-xs-6">
                                 <h4>회원명</h4>
                                 <p><%=reviewM3.getMemberName() %></p>
                             </div>
                             <div class="col-lg-12 col-md-6 col-sm-6 col-xs-6">
                                 <h4>등급</h4>
                                 <p><%=reviewM3.getMemberGrade() %></p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 작성 횟수</h4>
                                 <p><%=reviewM3.getMemberReviewWriteTime() %> 회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 댓글 수 대비 <small><%=reviewM3.getRateBytotalReviewWriteTime() %>%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="<%=reviewM3.getRateBytotalReviewWriteTime() %>"></div>
                                    </div>
                                    
                                </div>
                             </div>
                          </div>
                          <div class="x_content2 col-md-12 col-sm-12 col-xs-12" style="height: 250px;">
                           <h4>시간별 작성 통계</h4>
                            <div id="memberReply3" style="width:100%; height:210px;"></div>
                          </div>
                        </div>
                      </div>
                      <div class="panel col-md-12 col-sm-12 col-xs-12">
                        <a class="panel-heading collapsed" role="tab" id="headingFour4" data-toggle="collapse" data-parent="#accordion1" href="#top4reply">
                          <h4 class="panel-title">TOP 4</h4>
                        </a>
                        <div id="top4reply" class="panel-collapse collapse col-md-12 col-sm-12 col-xs-12" role="tabpanel" style="padding: 10px;">
                         <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12" style="">
                            <img src="<%=request.getContextPath() %>/resources/images/member/<%=reviewM4.getMemberImage() %>" alt="이미지 없음" style="width: 100%;">
                          </div>
                          <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12" style="">
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>회원명</h4>
                                 <p><%=reviewM4.getMemberName() %></p>
                             </div>
                             <div class="col-lg-12 col-md-6 col-sm-6 col-xs-6">
                                 <h4>등급</h4>
                                 <p><%=reviewM4.getMemberGrade() %></p>
                             </div>
                              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 작성 횟수</h4>
                                 <p><%=reviewM4.getMemberReviewWriteTime() %> 회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 댓글 수 대비 <small><%=reviewM4.getRateBytotalReviewWriteTime() %>%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="<%=reviewM4.getRateBytotalReviewWriteTime() %>"></div>
                                    </div>
                                    
                                </div>
                             </div>
                          </div>
                          <div class="x_content2 col-md-12 col-sm-12 col-xs-12" style="height: 250px;">
                           <h4>시간별 작성 통계</h4>
                            <div id="memberReply4" style="width:100%; height:210px;"></div>
                          </div>
                        </div>
                      </div>
                      <div class="panel col-md-12 col-sm-12 col-xs-12">
                        <a class="panel-heading collapsed" role="tab" id="headingFive5" data-toggle="collapse" data-parent="#accordion1" href="#top5reply">
                          <h4 class="panel-title">TOP 5</h4>
                        </a>
                        <div id="top5reply" class="panel-collapse collapse col-md-12 col-sm-12 col-xs-12" role="tabpanel" style="padding: 10px;">
                         <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12" style="">
                            <img src="<%=request.getContextPath() %>/resources/images/member/<%=reviewM5.getMemberImage() %>" alt="이미지 없음" style="width: 100%;">
                          </div>
                          <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12" style="">
                             <div class="col-lg-12 col-md-6 col-sm-6 col-xs-6">
                                 <h4>회원명</h4>
                                 <p><%=reviewM5.getMemberName() %></p>
                             </div>
                             <div class="col-lg-12 col-md-6 col-sm-6 col-xs-6">
                                 <h4>등급</h4>
                                 <p><%=reviewM5.getMemberGrade() %></p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 작성 횟수</h4>
                                 <p><%=reviewM5.getMemberReviewWriteTime() %> 회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 댓글 수 대비 <small><%=reviewM5.getRateBytotalReviewWriteTime() %>%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="<%=reviewM5.getRateBytotalReviewWriteTime() %>"></div>
                                    </div>
                                    
                                </div>
                             </div>
                          </div>
                          <div class="x_content2 col-md-12 col-sm-12 col-xs-12" style="height: 250px;">
                           <h4>시간별 작성 통계</h4>
                            <div id="memberReply5" style="width:100%; height:210px;"></div>
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
