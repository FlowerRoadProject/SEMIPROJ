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
                <h3>상품 통계 <small>TOP 5</small></h3>
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
                    <h2><i class="fa fa-bars"></i> 최고매출상품 <small>TOP 5</small></h2>
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
                            <img src="../../images/admin/flower.jpg" alt="상품 이미지" style="width: 100%;">
                          </div>
                          <div class="col-md-7 col-sm-7 col-xs-12" style="">
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>상품명</h4>
                                 <p>붉은 장미 꽃</p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 매출 금액</h4>
                                 <p>￦ 123,000</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 매출액 대비 <small>57%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="57"></div>
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
                            <img src="../../images/admin/flower.jpg" alt="상품 이미지" style="width: 100%;">
                          </div>
                          <div class="col-md-7 col-sm-7 col-xs-12" style="">
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>상품명</h4>
                                 <p>붉은 장미 꽃</p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 매출 금액</h4>
                                 <p>￦ 123,000</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 매출액 대비 <small>57%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="57"></div>
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
                            <img src="../../images/admin/flower.jpg" alt="상품 이미지" style="width: 100%;">
                          </div>
                          <div class="col-md-7 col-sm-7 col-xs-12" style="">
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>상품명</h4>
                                 <p>붉은 장미 꽃</p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 매출 금액</h4>
                                 <p>￦ 123,000</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 매출액 대비 <small>57%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="57"></div>
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
                            <img src="../../images/admin/flower.jpg" alt="상품 이미지" style="width: 100%;">
                          </div>
                          <div class="col-md-7 col-sm-7 col-xs-12" style="">
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>상품명</h4>
                                 <p>붉은 장미 꽃</p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 매출 금액</h4>
                                 <p>￦ 123,000</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 매출액 대비 <small>57%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="57"></div>
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
                            <img src="../../images/admin/flower.jpg" alt="상품 이미지" style="width: 100%;">
                          </div>
                          <div class="col-md-7 col-sm-7 col-xs-12" style="">
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>상품명</h4>
                                 <p>붉은 장미 꽃</p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 매출 금액</h4>
                                 <p>￦ 123,000</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 매출액 대비 <small>57%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="57"></div>
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

                    <div class="clearfix"></div>

                  </div>
                </div>
              </div>

              <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2><i class="fa fa-bars"></i> 최다판매상품 <small>TOP 5</small></h2>
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
                            <img src="../../images/admin/flower.jpg" alt="상품 이미지" style="width: 100%;">
                          </div>
                          <div class="col-md-7 col-sm-7 col-xs-12" style="">
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>상품명</h4>
                                 <p>붉은 장미 꽃</p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 판매 횟수</h4>
                                 <p>20회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 판매 수량 대비 <small>57%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="57"></div>
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
                            <img src="../../images/admin/flower.jpg" alt="상품 이미지" style="width: 100%;">
                          </div>
                          <div class="col-md-7 col-sm-7 col-xs-12" style="">
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>상품명</h4>
                                 <p>붉은 장미 꽃</p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 판매 횟수</h4>
                                 <p>20회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 판매 수량 대비 <small>57%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="57"></div>
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
                            <img src="../../images/admin/flower.jpg" alt="상품 이미지" style="width: 100%;">
                          </div>
                          <div class="col-md-7 col-sm-7 col-xs-12" style="">
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>상품명</h4>
                                 <p>붉은 장미 꽃</p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 판매 횟수</h4>
                                 <p>20회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 판매 수량 대비 <small>57%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="57"></div>
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
                            <img src="../../images/admin/flower.jpg" alt="상품 이미지" style="width: 100%;">
                          </div>
                          <div class="col-md-7 col-sm-7 col-xs-12" style="">
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>상품명</h4>
                                 <p>붉은 장미 꽃</p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 판매 횟수</h4>
                                 <p>20회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 판매 수량 대비 <small>57%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="57"></div>
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
                            <img src="../../images/admin/flower.jpg" alt="상품 이미지" style="width: 100%;">
                          </div>
                          <div class="col-md-7 col-sm-7 col-xs-12" style="">
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>상품명</h4>
                                 <p>붉은 장미 꽃</p>
                             </div>
                              <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>누적 판매 횟수</h4>
                                 <p>20회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 판매 수량 대비 <small>57%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="57"></div>
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
              <div class="clearfix"></div>


              <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2><i class="fa fa-align-left"></i> 최고별점상품 <small>TOP 5</small></h2>
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
                            <img src="../../images/admin/flower.jpg" alt="상품 이미지" style="width: 100%;">
                          </div>
                          <div class="col-lg-7 col-md-8 col-sm-8 col-xs-12" style="">
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>상품명</h4>
                                 <p>붉은 장미 꽃</p>
                             </div>
                              <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>평균 별점</h4>
                                 <p>5점</p>
                             </div>
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>댓글 수</h4>
                                 <p>20개</p>
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
                            <img src="../../images/admin/flower.jpg" alt="상품 이미지" style="width: 100%;">
                          </div>
                          <div class="col-lg-7 col-md-8 col-sm-8 col-xs-12" style="">
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>상품명</h4>
                                 <p>붉은 장미 꽃</p>
                             </div>
                              <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>평균 별점</h4>
                                 <p>5점</p>
                             </div>
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>댓글 수</h4>
                                 <p>20개</p>
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
                            <img src="../../images/admin/flower.jpg" alt="상품 이미지" style="width: 100%;">
                          </div>
                          <div class="col-lg-7 col-md-8 col-sm-8 col-xs-12" style="">
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>상품명</h4>
                                 <p>붉은 장미 꽃</p>
                             </div>
                              <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>평균 별점</h4>
                                 <p>5점</p>
                             </div>
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>댓글 수</h4>
                                 <p>20개</p>
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
                            <img src="../../images/admin/flower.jpg" alt="상품 이미지" style="width: 100%;">
                          </div>
                          <div class="col-lg-7 col-md-8 col-sm-8 col-xs-12" style="">
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>상품명</h4>
                                 <p>붉은 장미 꽃</p>
                             </div>
                              <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>평균 별점</h4>
                                 <p>5점</p>
                             </div>
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>댓글 수</h4>
                                 <p>20개</p>
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
                            <img src="../../images/admin/flower.jpg" alt="상품 이미지" style="width: 100%;">
                          </div>
                          <div class="col-lg-7 col-md-8 col-sm-8 col-xs-12" style="">
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>상품명</h4>
                                 <p>붉은 장미 꽃</p>
                             </div>
                              <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>평균 별점</h4>
                                 <p>5점</p>
                             </div>
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>댓글 수</h4>
                                 <p>20개</p>
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
              <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2><i class="fa fa-align-left"></i> 최다조회상품 <small>TOP 5</small></h2>
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
                            <img src="../../images/admin/flower.jpg" alt="상품 이미지" style="width: 100%;">
                          </div>
                          <div class="col-lg-7 col-md-8 col-sm-8 col-xs-12" style="">
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>상품명</h4>
                                 <p>붉은 장미 꽃</p>
                             </div>
                              <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>누적 조회 수</h4>
                                 <p>15회</p>
                             </div>
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>찜 횟수</h4>
                                 <p>20회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 조회 수 대비 <small>57%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="57"></div>
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
                            <img src="../../images/admin/flower.jpg" alt="상품 이미지" style="width: 100%;">
                          </div>
                          <div class="col-lg-7 col-md-8 col-sm-8 col-xs-12" style="">
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>상품명</h4>
                                 <p>붉은 장미 꽃</p>
                             </div>
                              <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>누적 조회 수</h4>
                                 <p>15회</p>
                             </div>
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>찜 횟수</h4>
                                 <p>20회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 조회 수 대비 <small>57%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="57"></div>
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
                            <img src="../../images/admin/flower.jpg" alt="상품 이미지" style="width: 100%;">
                          </div>
                          <div class="col-lg-7 col-md-8 col-sm-8 col-xs-12" style="">
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>상품명</h4>
                                 <p>붉은 장미 꽃</p>
                             </div>
                              <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>누적 조회 수</h4>
                                 <p>15회</p>
                             </div>
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>찜 횟수</h4>
                                 <p>20회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 조회 수 대비 <small>57%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="57"></div>
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
                            <img src="../../images/admin/flower.jpg" alt="상품 이미지" style="width: 100%;">
                          </div>
                          <div class="col-lg-7 col-md-8 col-sm-8 col-xs-12" style="">
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>상품명</h4>
                                 <p>붉은 장미 꽃</p>
                             </div>
                              <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>누적 조회 수</h4>
                                 <p>15회</p>
                             </div>
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>찜 횟수</h4>
                                 <p>20회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 조회 수 대비 <small>57%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="57"></div>
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
                            <img src="../../images/admin/flower.jpg" alt="상품 이미지" style="width: 100%;">
                          </div>
                          <div class="col-lg-7 col-md-8 col-sm-8 col-xs-12" style="">
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                 <h4>상품명</h4>
                                 <p>붉은 장미 꽃</p>
                             </div>
                              <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>누적 조회 수</h4>
                                 <p>15회</p>
                             </div>
                             <div class="col-md-6 col-sm-6 col-xs-6">
                                 <h4>찜 횟수</h4>
                                 <p>20회</p>
                             </div>
                             <div class="col-md-12 col-sm-12 col-xs-12">
                                <h4>총 조회 수 대비 <small>57%</small></h4>
                                 <div class="project_progress">
                                    <div class="progress progress_sm">
                                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="57"></div>
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

	<!-- admin_JS -->
    <%@ include file="common/admin_JS.jsp" %>
  </body>
</html>
