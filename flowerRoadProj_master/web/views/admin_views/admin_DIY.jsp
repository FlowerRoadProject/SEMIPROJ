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
                <h3>주문제작 관리 <small>(DIY)</small></h3>
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
                      <div class="animated flipInY col-lg-2 col-md-4 col-sm-6 col-xs-12">
                        <div class="tile-stats">
                          <div class="icon"><i class="fa fa-check-square-o"></i>
                          </div>
                          <div class="count">5</div>
                          <h3>총 주문제작</h3>
                          <p>Lorem ipsum psdea itgum rixt.</p>
                        </div>
                      </div>
                      <div class="animated flipInY col-lg-2 col-md-4 col-sm-6 col-xs-12">
                        <div class="tile-stats">
                          <div class="icon"><i class="fa fa-check-circle"></i>
                          </div>
                          <div class="count">2</div>

                          <h3>주문제작 접수</h3>
                          <p>Lorem ipsum psdea itgum rixt.</p>
                        </div>
                      </div>
                      <div class="animated flipInY col-lg-2 col-md-4 col-sm-6 col-xs-12">
                        <div class="tile-stats">
                          <div class="icon"><i class="fa fa-scissors"></i>
                          </div>
                          <div class="count">1</div>

                          <h3>주문제작 중</h3>
                          <p>Lorem ipsum psdea itgum rixt.</p>
                        </div>
                      </div>
                      <div class="animated flipInY col-lg-2 col-md-4 col-sm-6 col-xs-12">
                        <div class="tile-stats">
                          <div class="icon"><i class="fa fa-tree"></i>
                          </div>
                          <div class="count">1</div>

                          <h3>주문제작 완료</h3>
                          <p>Lorem ipsum psdea itgum rixt.</p>
                        </div>
                      </div>
                      <div class="animated flipInY col-lg-2 col-md-4 col-sm-6 col-xs-12">
                        <div class="tile-stats">
                          <div class="icon"><i class="fa fa-frown-o"></i>
                          </div>
                          <div class="count">1</div>
                          <h3>주문제작 취소</h3>
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
                    <h2>주문제작 조회<small>DIYs</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <p class="text-muted font-13 m-b-30">
                      
                    </p>
					
                    <table id="datatable-buttons" class="table table-striped table-bordered dt-responsive nowrap DIYTable" cellspacing="0" width="100%">
                      <thead>
                        <tr>
                          <th>주문제작번호</th>
                          <th>회원번호</th>
                          <th>제작접수일</th>
                          <th>상태</th>
                          <th>제작완료일</th>
                          <th>상품구성</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>C001</td>
                          <td>M001</td>
                          <td>18/04/01</td>
                          <td>결제대기</td>
                          <td>18/04/03</td>
                          <td>바구니/장미/3/튤립/2</td>
                        </tr>
                        <tr>
                          <td>C002</td>
                          <td>M002</td>
                          <td>18/04/01</td>
                          <td>결제완료</td>
                          <td>18/04/03</td>
                          <td>바구니/장미/3/튤립/2</td>
                        </tr>
                        <tr>
                          <td>C003</td>
                          <td>M003</td>
                          <td>18/04/01</td>
                          <td>제작시작</td>
                          <td>18/04/03</td>
                          <td>바구니/장미/3/튤립/2</td>
                        </tr>
                        <tr>
                          <td>C004</td>
                          <td>M004</td>
                          <td>18/04/01</td>
                          <td>제작완료</td>
                          <td>18/04/03</td>
                          <td>바구니/장미/3/튤립/2</td>
                        </tr>
                      </tbody>
                    </table>
					
					
                  </div>
                </div>
              </div>
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>주문제작 처리 <small>DIYs</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content DIYslide">
                    <table class="table table-striped DIYCheck">
                      <thead>
                        <tr>
                          <th style="width: 15%">제작번호</th>
                          <th style="width: 15%">회원번호</th>
                          <th>상태</th>
                          <th style="width: 10%">처리</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>C</td>
                          <td>M</td>
                          <td class="form_wizard wizard_horizontal">
                            <ul class="wizard_steps">
                                <li id="paying">
                                  <a href="#step-1">
                                    <span class="step_no">1</span>
                                    <span class="step_descr">결제<br /><small>대기</small></span>
                                  </a>
                                </li>
                                <li id="paycom">
                                  <a href="#step-2">
                                    <span class="step_no">2</span>
                                    <span class="step_descr">결제<br /><small>완료</small></span>
                                  </a>
                                </li>
                                <li id="deling">
                                  <a href="#step-3">
                                    <span class="step_no">3</span>
                                    <span class="step_descr">제작<br /><small>시작</small></span>
                                  </a>
                                </li>
                                <li id="delcom">
                                  <a href="#step-4">
                                    <span class="step_no">4</span>
                                    <span class="step_descr">제작<br /><small>완료</small></span>
                                  </a>
                                </li>
                              </ul>
                          </td>
                          <td>
                            <button type="button" class="btn btn-success btn-xs">적용</button>
                            <button type="button" class="btn btn-danger btn-xs">삭제</button>
                          </td>
                        </tr>
                        
                      </tbody>
                    </table>
                    
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
    </div>

	<!-- admin_JS -->
    <%@ include file="common/admin_JS.jsp" %>
  </body>
</html>
