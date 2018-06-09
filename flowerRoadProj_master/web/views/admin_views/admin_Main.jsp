<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fr.jsp.admin.model.vo.*" %>
<% 
	AdminFortuen adminFortuen = (AdminFortuen) request.getAttribute("adminFortuen"); 
	AdminRandomGame adminRandomGame = (AdminRandomGame) request.getAttribute("adminRandomGame");
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
		
		<script>
			var mainPath = '<%=request.getContextPath() %>';
		</script>
	</head>

	<body class="nav-md">
		<!-- admin_LOADING -->
		<%@ include file="common/admin_LOADING.jsp" %>
    
		<div class="container body">
			<div class="main_container">
				<!-- admin_NAV -->
				<%@ include file="common/admin_NAV.jsp" %>

				<!-- page content -->
        <%-- <div class="right_col" role="main">
          <div class="">
            <div class="row">
              <div class="col-lg-8 col-md-12 col-sm-12 col-xs-12">
	              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	                <div class="x_panel">
	                  <div class="x_title">
	                    <h2>RANDOM GAME <span class="badge bg-red" id="clickCount"></span></h2>
	                    <ul class="nav navbar-right panel_toolbox">
	                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
	                      </li>
	                    </ul>
	                    <div class="clearfix"></div>
	                  </div>
	                  <div class="randomGame"  style="height:500px">
	                  
	                    	<img id="target" src="<%=request.getContextPath() %>/resources/images/admin/blue_flower_background.jpg" alt="" 
	                    		style="width:50px;height:50px;position:absolute;top:<%=adminRandomGame.getTopNum()%>%;left:<%=adminRandomGame.getLeftNum()%>%;"/>
	                    	<div id="goal" style="border:2px solid pink;width:50px;height:50px;position:absolute;top:<%=adminRandomGame.getGoalTopNum()%>%;left:<%=adminRandomGame.getGoalLeftNum()%>%;"></div>
	                    	
	                  </div>
	                </div>
	              </div>
              </div>
              <div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
	              <div class="col-md-12 col-sm-12 col-xs-12">
	                <div class="x_panel">
	                  <div class="x_title">
	                    <h2>오늘의 명언 <small></small></h2>
	                    	<div class="clearfix"></div>
	                  </div>
	                  <div class="x_content">
	                  	<button type="button" class="btn btn-round btn-warning col-lg-10 col-md-10 col-sm-10 col-xs-10"
	                  			style="margin-left:10%;margin-right:10%;" id="teachMe">승회</button>
	                  	<div id="english"><%=adminFortuen.getFortuenEnglish() %></div>
	                  	<div id="korean"><%=adminFortuen.getFortuenKorean() %></div>
	                  </div>
	                </div>
	              </div>
	              <div class="col-md-12 col-sm-12 col-xs-12">
	                <div class="x_panel">
	                  <div class="x_title">
	                    <h2>LEADER BOARD <small></small></h2>
	                    <ul class="nav navbar-right panel_toolbox">
	                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
	                      </li>
	                    </ul>
	                    <div class="clearfix"></div>
	                  </div>
	                  <div class="x_content">
	                  		<p class="col-lg-5 col-md-3 col-sm-3 col-xs-5"  style="margin-bottom: 0px">난이도 선택</p>
                              <select name="" id="insertPEvent" class="col-lg-7 col-md-4 col-sm-4 col-xs-7 PEvent" style="height: 30px;margin-bottom: 15px">
                                  <option value="easy" style="background:snow;color:black;">쉬움</option>
                                  <option value="normal" style="background:lightgreen;color:darkblue;">보통</option>
                                  <option value="hard" style="background:darkorange;color:brown;">어려움</option>
                                  <option value="veryHard" style="background:darkred;color:lightgoldenrodyellow;">매우 어려움</option>
                              </select>
                              <div class="col-lg-12 col-md-5 col-sm-5 col-xs-12" style="padding: 0px;">
		                         <button type="button" class="btn btn-round btn-success col-lg-10 col-md-10 col-sm-10 col-xs-10" 
		                         		style="margin-left:10%;margin-right:10%;"id="">난이도 변경</button>
	                          </div>
	                  </div>
	                </div>
	              </div>
	            </div>
            </div>
            
          </div>
        </div> --%>
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
