<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.fr.jsp.admin.model.vo.*" %>
<% 
	int admin_allDeliveryCount = (int)(request.getAttribute("admin_allDeliveryCount"));
	int admin_paycompleteCount = (int)(request.getAttribute("admin_paycompleteCount"));
	int admin_productReadyCount = (int)(request.getAttribute("admin_productReadyCount"));
	int admin_deliverystartCount = (int)(request.getAttribute("admin_deliverystartCount"));
	int admin_deliverycompleteCount = (int)(request.getAttribute("admin_deliverycompleteCount"));
	int admin_ordercancleCount = (int)(request.getAttribute("admin_ordercancleCount"));
	ArrayList<AdminOrder> admin_orderList = (ArrayList<AdminOrder>)(request.getAttribute("admin_orderList"));
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
                <a href="<%=request.getContextPath() %>/delivery.admin"><h3>주문/배송 관리</a> <small>(Order/Delivery: <%=admin_allDeliveryCount %> 건)</small></h3>
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
                          <div class="icon payCompleteList"><i class="fa fa-check-square-o"></i>
                          </div>
                          <div class="count"><%=admin_paycompleteCount %></div>
                          <a href="<%=request.getContextPath() %>/payComplete.admin"><h3>결제완료</h3></a>
                          <p>Lorem ipsum psdea itgum rixt.</p>
                        </div>
                      </div>
                      <div class="animated flipInY col-lg-2 col-md-4 col-sm-6 col-xs-12">
                        <div class="tile-stats">
                          <div class="icon"><i class="fa fa-file-text-o"></i>
                          </div>
                          <div class="count"><%=admin_productReadyCount %></div>

                          <a href="<%=request.getContextPath() %>/productReady.admin"><h3>상품준비</h3></a>
                          <p>Lorem ipsum psdea itgum rixt.</p>
                        </div>
                      </div>
                      <div class="animated flipInY col-lg-2 col-md-4 col-sm-6 col-xs-12">
                        <div class="tile-stats">
                          <div class="icon"><i class="fa fa-truck"></i>
                          </div>
                          <div class="count"><%=admin_deliverystartCount %></div>

                          <a href="<%=request.getContextPath() %>/deliveryStart.admin"><h3>배송출발</h3></a>
                          <p>Lorem ipsum psdea itgum rixt.</p>
                        </div>
                      </div>
                      <div class="animated flipInY col-lg-2 col-md-4 col-sm-6 col-xs-12">
                        <div class="tile-stats">
                          <div class="icon"><i class="fa fa-gift"></i>
                          </div>
                          <div class="count"><%=admin_deliverycompleteCount %></div>

                          <a href="<%=request.getContextPath() %>/deliveryComplete.admin"><h3>배송완료</h3></a>
                          <p>Lorem ipsum psdea itgum rixt.</p>
                        </div>
                      </div>
                      <div class="animated flipInY col-lg-2 col-md-4 col-sm-6 col-xs-12">
                        <div class="tile-stats">
                          <div class="icon"><i class="fa fa-frown-o"></i>
                          </div>
                          <div class="count"><%=admin_ordercancleCount %></div>
                          <a href="<%=request.getContextPath() %>/orderCancle.admin"><h3>구매취소</h3></a>
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
                    <h2>주문/배송 조회<small>Orders/Deliveries</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <p class="text-muted font-13 m-b-30">
                      
                    </p>
					
                    <table id="datatable-buttons" class="table table-striped table-bordered dt-responsive nowrap deliveryTable" cellspacing="0" width="100%">
                      <thead>
                        <tr>
                          <th>주문번호</th>
                          <th>회원이름</th>
                          <th>상품이름</th>
                          <th>주문수량</th>
                          <th>상태</th>
                          <th>주문일</th>
                          <th>예약발송일</th>
                          <th>(받)이름</th>
                          <th>(받)전화번호</th>
                          <th>(받)주소</th>
                          <th>배송기사메시지</th>
                          <th>익명발송</th>
                        </tr>
                      </thead>
                      <tbody>
                      <%for(AdminOrder ao : admin_orderList){ %>
                        <tr>
                          <td class="OrderNum"><%=ao.getOrderNum() %></td>
                          <td><%=ao.getMemberName() %></td>
                          <td><%=ao.getProductName() %></td>
                          <td><%=ao.getProductAmount() %></td>
                          <td><%=ao.getOrderStateName() %></td>
                          <td><%=ao.getOrderedDate() %></td>
                          <td><%=ao.getReservationDate() %></td>
                          <td><%=ao.getReceiverName() %></td>
                          <td><%=ao.getReceiverPhone() %></td>
                          <td><%=ao.getReceiverAddress() %></td>
                          <td><%=ao.getDeliveryMessage() %></td>
                          <td><%=ao.getAnonymousDelivery() %></td>
                        </tr>
                        <%} %>
                      </tbody>
                    </table>
					
					
                  </div>
                </div>
              </div>
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>주문/배송 처리 <small>Orders/Deliveries</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <!-- start project list -->
                    <table class="table table-striped orderCheck">
                      <thead>
                        <tr>
                          <th style="width: 15%">주문번호</th>
                          <th style="width: 15%">회원이름</th>
                          <th style="width: 15%">상품이름</th>
                          <th>상태</th>
                          <th style="width: 5%">처리</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td class="ONum"></td>
                          <td></td>
                          <td></td>
                          <td class="form_wizard wizard_horizontal">
                            <ul class="wizard_steps">
                                <li id="paying">
                                  <a>
                                    <span class="step_no">PC</span>
                                    <span class="step_descr">결제<small> 완료</small></span>
                                  </a>
                                </li>
                                <li id="paycom">
                                  <a>
                                    <span class="step_no">PR</span>
                                    <span class="step_descr">상품<small> 준비</small></span>
                                  </a>
                                </li>
                                <li id="deling">
                                  <a>
                                    <span class="step_no">DS</span>
                                    <span class="step_descr">배송<small> 출발</small></span>
                                  </a>
                                </li>
                                <li id="delcom">
                                  <a>
                                    <span class="step_no">DC</span>
                                    <span class="step_descr">배송<small> 완료</small></span>
                                  </a>
                                </li>
                              </ul>
                          </td>
                          <td>
                            <button type="button" class="btn btn-success btn-xs" id="editOrderState">적용</button>
                            <button type="button" class="btn btn-warning btn-xs" id="refundOrder">환불</button>
                            <button type="button" class="btn btn-danger btn-xs" id="cancleOrderState">취소</button>
                          </td>
                        </tr>
                        
                      </tbody>
                    </table>
                    <!-- end project list -->

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
