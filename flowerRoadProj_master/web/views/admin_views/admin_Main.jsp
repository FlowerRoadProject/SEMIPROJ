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
		<!-- admin_JS -->
		<%@ include file="common/admin_JS.jsp" %>
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
	                    <h2>RANDOM GAME<small></small></h2>
	                    <ul class="nav navbar-right panel_toolbox">
	                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
	                      </li>
	                    </ul>
	                    <div class="clearfix"></div>
	                  </div>
	                  <div class="randomGame"  style="height:500px">
	                    	<img src="<%=request.getContextPath() %>/resources/images/admin/blue_flower_background.jpg" alt="" 
	                    		style="width:50px;height:50px;position:relative;top:<%=adminRandomGame.getTopNum()%>%;left:<%=adminRandomGame.getLeftNum()%>%;"/>
	                    	<div style="border:2px solid pink;width:50px;height:50px;position:relative;top:<%=adminRandomGame.getGoalTopNum()%>%;left:<%=adminRandomGame.getGoalLeftNum()%>%;"></div>
	                    	<script>
	                    		$('.randomGame img').on({
	                    			'click':function(){
	                    				if(<%=adminRandomGame.getTopNum()%>!=<%=adminRandomGame.getGoalTopNum()%> || <%=adminRandomGame.getLeftNum()%>!=<%=adminRandomGame.getGoalLeftNum()%>){
	                    					var top1 = (Math.random()*100)+1;
	                    					var left1 = (Math.random()*100)+1;
	                    					var widthget = $(this).parent().css('width');
	                    					var heightget = $(this).parent().css('height');
	                    					console.log(widthget);
	                    					console.log(heightget);
	                    					$(this).css({'top':top1+'%', 'left':'50%'});
	                    				}
	                    			
	                    				$.ajax({
	                    					url: "<%=request.getContextPath()%>/randomGame.admin",
	                    					type: "post",
	                    					data: {
	                    						topNum: <%=adminRandomGame.getTopNum()%>,
	                    						leftNum: <%=adminRandomGame.getLeftNum()%>,
	                    						goalTopNum: <%=adminRandomGame.getGoalTopNum()%>,
	                    						goalLeftNum: <%=adminRandomGame.getGoalLeftNum()%>
	                    					},
	                    					success: function(data){
	                    						
	                    					},error: function(data){
	                    						alert("전달 실패!!");
	                    					}
	                    				});
	                    			}
	                    		});
	                    	</script>
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
	                  	<button id="teachMe">승회</button>
	                  	<div id="english"><%=adminFortuen.getFortuenEnglish() %></div>
	                  	<div id="korean"><%=adminFortuen.getFortuenKorean() %></div>
	                  	<script>
	                  		$(document).ready(function(){ 
	                  			$("#english").slideUp();$("#korean").slideUp();
	                  			var i = 1;
		                        $("#teachMe").on('click',function(){ 
		                            if(i==1){
		                            	$("#english").slideDown("slow"); i++;
		                            }else $("#korean").slideToggle("slow");
		                        });
		                    });
				        </script>
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
	</body>
</html>
