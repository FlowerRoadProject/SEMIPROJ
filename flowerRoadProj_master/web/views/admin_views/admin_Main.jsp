<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fr.jsp.admin.model.vo.*, java.util.*" %>
<% 
	AdminFortuen adminFortuen = (AdminFortuen) request.getAttribute("adminFortuen"); 
	AdminRandomGame adminRandomGame = (AdminRandomGame) request.getAttribute("adminRandomGame");
	ArrayList<AdminRandomGameLeaderBoard> adminLeaderBoard = (ArrayList<AdminRandomGameLeaderBoard>) request.getAttribute("adminLeaderBoard");
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
        <div class="right_col" role="main">
          <div class="">
            <div class="row">
              <div class="col-lg-8 col-md-12 col-sm-12 col-xs-12 mainGameShow">
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
	                  <div class="randomGame page"  style=" width: auto;height:500px">
							  <button id="target" class="fun-btn" style="width:200px;height:200px;position:absolute;top:<%=adminRandomGame.getTopNum()%>%;left:<%=adminRandomGame.getLeftNum()%>%;">click</button>
	                    	  <div id="goal" style="border-radius: 100px;border:2px solid pink;width:200px;height:200px;position:absolute;top:<%=adminRandomGame.getGoalTopNum()%>%;left:<%=adminRandomGame.getGoalLeftNum()%>%;"></div>
	                    	
	                  </div>
	                </div>
	              </div>
              </div>
              <div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
	              <div class="col-md-12 col-sm-12 col-xs-12 mainFortuneShow">
	                <div class="x_panel">
	                  <div class="x_title">
	                    <h2>오늘의 명언 <small></small></h2>
	                    	<div class="clearfix"></div>
	                  </div>
	                  <div class="x_content">
	                  	<button type="button" class="btn btn-round btn-warning col-lg-10 col-md-10 col-sm-10 col-xs-10"
	                  			style="margin-left:10%;margin-right:10%;" id="teachMe">승회(承誨): 가르침을 받음</button>
	                  	<div id="english"><%=adminFortuen.getFortuenEnglish() %></div>
	                  	<div id="korean"><%=adminFortuen.getFortuenKorean() %></div>
	                  </div>
	                </div>
	              </div>
	              <div class="col-md-12 col-sm-12 col-xs-12 mainLeaderBoardShow">
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
                              <select name="" id="selectDifficulty" class="col-lg-7 col-md-4 col-sm-4 col-xs-7 PEvent" style="height: 30px;margin-bottom: 15px">
                                  <option value="easy" style="background:snow;color:black;">쉬움</option>
                                  <option value="normal" style="background:lightgreen;color:darkblue;">보통</option>
                                  <option value="hard" style="background:darkorange;color:brown;">어려움</option>
                                  <option value="veryHard" style="background:darkred;color:lightgoldenrodyellow;">매우 어려움</option>
                              </select>
                              <div class="col-lg-12 col-md-5 col-sm-5 col-xs-12" style="padding: 0px;">
		                         <button type="button" class="btn btn-round btn-success col-lg-10 col-md-10 col-sm-10 col-xs-10" 
		                         		style="margin-left:10%;margin-right:10%;"id="randomPlace">랜덤 위치</button>
		                         <button type="button" class="btn btn-round btn-warning col-lg-10 col-md-10 col-sm-10 col-xs-10" 
		                         		style="margin-left:10%;margin-right:10%;"id="resetScore">초기화</button>
	                          </div>
	                          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	                          		<div class="panel-body">
			                            <table class="table table-striped">
			                              <thead>
			                                <tr>
			                                  <th>순위</th>
			                                  <th>이름</th>
			                                  <th>횟수</th>
			                                  <th>날짜</th>
			                                </tr>
			                              </thead>
			                              <tbody  class="leaderBoardTbody">
			                              <%for(int i=0; i<adminLeaderBoard.size(); i++){ %>
			                                <tr>
			                                  <th scope="row"><%=i+1 %></th>
			                                  <td><%=adminLeaderBoard.get(i).getAdminNum() %></td>
			                                  <td><%=adminLeaderBoard.get(i).getClickCount() %></td>
			                                  <td><%=adminLeaderBoard.get(i).getGameDate() %></td>
			                                </tr>
			                                <%} %>
			                              </tbody>
			                            </table>
			                          </div>
	                          </div>
	                  </div>
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
