<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <h3>회원 통계 <small>TOP 5</small></h3>
              </div>

              <div class="title_right">
                
              </div>
            </div>
            <div class="clearfix"></div>
            <div class="">
              <div class="clearfix"></div>
              
              <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2><i class="fa fa-bars"></i> 최고구입회원 <small>TOP 5</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                    <div class="col-lg-12 col-md-3 col-sm-3 col-xs-12">
                      <!-- required for floating -->
                      <!-- Nav tabs -->
                      <ul class="nav nav-tabs bar_tabs">
                        <li class="active col-lg-2 col-md-12 col-sm-12 col-xs-2"><a href="#top1left" data-toggle="tab">TOP 1</a>
                        </li>
                        <li class="col-lg-2 col-md-12 col-sm-12 col-xs-2"><a href="#top2left" data-toggle="tab">TOP 2</a>
                        </li>
                        <li class="col-lg-2 col-md-12 col-sm-12 col-xs-2"><a href="#top3left" data-toggle="tab">TOP 3</a>
                        </li>
                        <li class="col-lg-2 col-md-12 col-sm-12 col-xs-2"><a href="#top4left" data-toggle="tab">TOP 4</a>
                        </li>
                        <li class="col-lg-2 col-md-12 col-sm-12 col-xs-2"><a href="#top5left" data-toggle="tab">TOP 5</a>
                        </li>
                      </ul>
                    </div>

                    <div class="col-lg-12 col-md-9 col-sm-9 col-xs-12">
                      <!-- Tab panes -->
                      <div class="tab-content">
                        <div class="tab-pane active" id="top1left">
                          <div class="col-md-5 col-sm-5 col-xs-12" style="">
                            <img class="img-circle"src="../../images/admin/flower.jpg" alt="이미지 없음" style="width: 100%;">
                          </div>
                          <div class="col-md-7 col-sm-7 col-xs-12" style="">
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>회원명</h4>
                                 <p>박태영</p>
                             </div>
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>등급</h4>
                                 <p>PLATINUM</p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 구입 금액</h4>
                                 <p>￦ 123,000</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 구입액 대비 <small>57%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="57"></div>
                                    </div>
                                    
                                </div>
                             </div>
                          </div>
                          <div class="x_content">
                           <h4>시간별 구입 통계</h4>
                            <canvas id="memberPurchase1"></canvas>
                          </div>
                        </div>
                        <div class="tab-pane" id="top2left">
                         <div class="col-md-5 col-sm-5 col-xs-12" style="">
                            <img class="img-circle"src="../../images/admin/flower.jpg" alt="이미지 없음" style="width: 100%;">
                          </div>
                          <div class="col-md-7 col-sm-7 col-xs-12" style="">
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>회원명</h4>
                                 <p>박태영</p>
                             </div>
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>등급</h4>
                                 <p>PLATINUM</p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 구입 금액</h4>
                                 <p>￦ 123,000</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 구입액 대비 <small>57%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="57"></div>
                                    </div>
                                    
                                </div>
                             </div>
                          </div>
                          <div class="x_content">
                           <h4>시간별 구입 통계</h4>
                            <canvas id="memberPurchase2"></canvas>
                          </div>
                        </div>
                        <div class="tab-pane" id="top3left">
                         <div class="col-md-5 col-sm-5 col-xs-12" style="">
                            <img class="img-circle"src="../../images/admin/flower.jpg" alt="이미지 없음" style="width: 100%;">
                          </div>
                          <div class="col-md-7 col-sm-7 col-xs-12" style="">
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>회원명</h4>
                                 <p>박태영</p>
                             </div>
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>등급</h4>
                                 <p>PLATINUM</p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 구입 금액</h4>
                                 <p>￦ 123,000</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 구입액 대비 <small>57%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="57"></div>
                                    </div>
                                    
                                </div>
                             </div>
                          </div>
                          <div class="x_content">
                           <h4>시간별 구입 통계</h4>
                            <canvas id="memberPurchase3"></canvas>
                          </div>
                        </div>
                        <div class="tab-pane" id="top4left">
                         <div class="col-md-5 col-sm-5 col-xs-12" style="">
                            <img class="img-circle"src="../../images/admin/flower.jpg" alt="이미지 없음" style="width: 100%;">
                          </div>
                          <div class="col-md-7 col-sm-7 col-xs-12" style="">
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>회원명</h4>
                                 <p>박태영</p>
                             </div>
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>등급</h4>
                                 <p>PLATINUM</p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 구입 금액</h4>
                                 <p>￦ 123,000</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 구입액 대비 <small>57%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="57"></div>
                                    </div>
                                    
                                </div>
                             </div>
                          </div>
                          <div class="x_content">
                           <h4>시간별 구입 통계</h4>
                            <canvas id="memberPurchase4"></canvas>
                          </div>
                        </div>
                        <div class="tab-pane" id="top5left">
                         <div class="col-md-5 col-sm-5 col-xs-12" style="">
                            <img class="img-circle"src="../../images/admin/flower.jpg" alt="이미지 없음" style="width: 100%;">
                          </div>
                          <div class="col-md-7 col-sm-7 col-xs-12" style="">
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>회원명</h4>
                                 <p>박태영</p>
                             </div>
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>등급</h4>
                                 <p>PLATINUM</p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 구입 금액</h4>
                                 <p>￦ 123,000</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 구입액 대비 <small>57%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="57"></div>
                                    </div>
                                    
                                </div>
                             </div>
                          </div>
                          <div class="x_content">
                           <h4>시간별 구입 통계</h4>
                            <canvas id="memberPurchase5"></canvas>
                          </div>
                        </div>
                      </div>
                    </div>

                    <div class="clearfix"></div>

                  </div>
                </div>
              </div>

              <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2><i class="fa fa-bars"></i> 최다구매회원 <small>TOP 5</small></h2>
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
                            <img class="img-circle"src="../../images/admin/flower.jpg" alt="이미지 없음" style="width: 100%;">
                          </div>
                          <div class="col-md-7 col-sm-7 col-xs-12" style="">
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>회원명</h4>
                                 <p>박태영</p>
                             </div>
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>등급</h4>
                                 <p>PLATINUM</p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 구매 횟수</h4>
                                 <p>20회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 구매 횟수 대비 <small>57%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="57"></div>
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
                         <div class="col-md-5 col-sm-5 col-xs-12" style="">
                            <img class="img-circle"src="../../images/admin/flower.jpg" alt="이미지 없음" style="width: 100%;">
                          </div>
                          <div class="col-md-7 col-sm-7 col-xs-12" style="">
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>회원명</h4>
                                 <p>박태영</p>
                             </div>
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>등급</h4>
                                 <p>PLATINUM</p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 구매 횟수</h4>
                                 <p>20회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 구매 횟수 대비 <small>57%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="57"></div>
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
                         <div class="col-md-5 col-sm-5 col-xs-12" style="">
                            <img class="img-circle"src="../../images/admin/flower.jpg" alt="이미지 없음" style="width: 100%;">
                          </div>
                          <div class="col-md-7 col-sm-7 col-xs-12" style="">
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>회원명</h4>
                                 <p>박태영</p>
                             </div>
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>등급</h4>
                                 <p>PLATINUM</p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 구매 횟수</h4>
                                 <p>20회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 구매 횟수 대비 <small>57%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="57"></div>
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
                         <div class="col-md-5 col-sm-5 col-xs-12" style="">
                            <img class="img-circle"src="../../images/admin/flower.jpg" alt="이미지 없음" style="width: 100%;">
                          </div>
                          <div class="col-md-7 col-sm-7 col-xs-12" style="">
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>회원명</h4>
                                 <p>박태영</p>
                             </div>
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>등급</h4>
                                 <p>PLATINUM</p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 구매 횟수</h4>
                                 <p>20회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 구매 횟수 대비 <small>57%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="57"></div>
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
                         <div class="col-md-5 col-sm-5 col-xs-12" style="">
                            <img class="img-circle"src="../../images/admin/flower.jpg" alt="이미지 없음" style="width: 100%;">
                          </div>
                          <div class="col-md-7 col-sm-7 col-xs-12" style="">
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>회원명</h4>
                                 <p>박태영</p>
                             </div>
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>등급</h4>
                                 <p>PLATINUM</p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 구매 횟수</h4>
                                 <p>20회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 구매 횟수 대비 <small>57%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="57"></div>
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
              <div class="clearfix"></div>


              <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2><i class="fa fa-align-left"></i> 최다방문회원 <small>TOP 5</small></h2>
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
                            <img src="../../images/admin/flower.jpg" alt="이미지 없음" style="width: 100%;">
                          </div>
                          <div class="col-lg-7 col-md-8 col-sm-8 col-xs-12" style="">
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>회원명</h4>
                                 <p>박태영</p>
                             </div>
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>등급</h4>
                                 <p>PLATINUM</p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 방문 횟수</h4>
                                 <p>20회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 방문 수 대비 <small>57%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="57"></div>
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
                         <div class="col-lg-5 col-md-4 col-sm-4 col-xs-12" style="">
                            <img src="../../images/admin/flower.jpg" alt="이미지 없음" style="width: 100%;">
                          </div>
                          <div class="col-lg-7 col-md-8 col-sm-8 col-xs-12" style="">
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>회원명</h4>
                                 <p>박태영</p>
                             </div>
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>등급</h4>
                                 <p>PLATINUM</p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 방문 횟수</h4>
                                 <p>20회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 방문 수 대비 <small>57%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="57"></div>
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
                         <div class="col-lg-5 col-md-4 col-sm-4 col-xs-12" style="">
                            <img src="../../images/admin/flower.jpg" alt="이미지 없음" style="width: 100%;">
                          </div>
                          <div class="col-lg-7 col-md-8 col-sm-8 col-xs-12" style="">
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>회원명</h4>
                                 <p>박태영</p>
                             </div>
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>등급</h4>
                                 <p>PLATINUM</p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 방문 횟수</h4>
                                 <p>20회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 방문 수 대비 <small>57%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="57"></div>
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
                         <div class="col-lg-5 col-md-4 col-sm-4 col-xs-12" style="">
                            <img src="../../images/admin/flower.jpg" alt="이미지 없음" style="width: 100%;">
                          </div>
                          <div class="col-lg-7 col-md-8 col-sm-8 col-xs-12" style="">
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>회원명</h4>
                                 <p>박태영</p>
                             </div>
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>등급</h4>
                                 <p>PLATINUM</p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 방문 횟수</h4>
                                 <p>20회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 방문 수 대비 <small>57%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="57"></div>
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
                         <div class="col-lg-5 col-md-4 col-sm-4 col-xs-12" style="">
                            <img src="../../images/admin/flower.jpg" alt="이미지 없음" style="width: 100%;">
                          </div>
                          <div class="col-lg-7 col-md-8 col-sm-8 col-xs-12" style="">
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>회원명</h4>
                                 <p>박태영</p>
                             </div>
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>등급</h4>
                                 <p>PLATINUM</p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 방문 횟수</h4>
                                 <p>20회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 방문 수 대비 <small>57%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="57"></div>
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
              <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2><i class="fa fa-align-left"></i> 최다댓글회원 <small>TOP 5</small></h2>
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
                         <div class="col-lg-5 col-md-4 col-sm-4 col-xs-12" style="">
                            <img src="../../images/admin/flower.jpg" alt="이미지 없음" style="width: 100%;">
                          </div>
                          <div class="col-lg-7 col-md-8 col-sm-8 col-xs-12" style="">
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>회원명</h4>
                                 <p>박태영</p>
                             </div>
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>등급</h4>
                                 <p>PLATINUM</p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 작성 횟수</h4>
                                 <p>20회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 댓글 수 대비 <small>57%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="57"></div>
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
                         <div class="col-lg-5 col-md-4 col-sm-4 col-xs-12" style="">
                            <img src="../../images/admin/flower.jpg" alt="이미지 없음" style="width: 100%;">
                          </div>
                          <div class="col-lg-7 col-md-8 col-sm-8 col-xs-12" style="">
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>회원명</h4>
                                 <p>박태영</p>
                             </div>
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>등급</h4>
                                 <p>PLATINUM</p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 작성 횟수</h4>
                                 <p>20회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 댓글 수 대비 <small>57%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="57"></div>
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
                         <div class="col-lg-5 col-md-4 col-sm-4 col-xs-12" style="">
                            <img src="../../images/admin/flower.jpg" alt="이미지 없음" style="width: 100%;">
                          </div>
                          <div class="col-lg-7 col-md-8 col-sm-8 col-xs-12" style="">
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>회원명</h4>
                                 <p>박태영</p>
                             </div>
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>등급</h4>
                                 <p>PLATINUM</p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 작성 횟수</h4>
                                 <p>20회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 댓글 수 대비 <small>57%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="57"></div>
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
                         <div class="col-lg-5 col-md-4 col-sm-4 col-xs-12" style="">
                            <img src="../../images/admin/flower.jpg" alt="이미지 없음" style="width: 100%;">
                          </div>
                          <div class="col-lg-7 col-md-8 col-sm-8 col-xs-12" style="">
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>회원명</h4>
                                 <p>박태영</p>
                             </div>
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>등급</h4>
                                 <p>PLATINUM</p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 작성 횟수</h4>
                                 <p>20회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 댓글 수 대비 <small>57%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="57"></div>
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
                         <div class="col-lg-5 col-md-4 col-sm-4 col-xs-12" style="">
                            <img src="../../images/admin/flower.jpg" alt="이미지 없음" style="width: 100%;">
                          </div>
                          <div class="col-lg-7 col-md-8 col-sm-8 col-xs-12" style="">
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>회원명</h4>
                                 <p>박태영</p>
                             </div>
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>등급</h4>
                                 <p>PLATINUM</p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 작성 횟수</h4>
                                 <p>20회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 댓글 수 대비 <small>57%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="57"></div>
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

	<!-- admin_JS -->
    <%@ include file="common/admin_JS.jsp" %>
  </body>
</html>
