<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.fr.jsp.member.model.vo.Member"%>
<% Member admin = (Member) session.getAttribute("admin"); %>
<% int admin_messageCount = (int)(session.getAttribute("admin_messageCount")); %>
<% int admin_orderCount = (int)(session.getAttribute("admin_orderCount")); %>
<% int admin_reviewCount = (int)(session.getAttribute("admin_reviewCount")); %>
<% int admin_userQuestionCount = (int)(session.getAttribute("admin_userQuestionCount")); %>
<!-- left navigation -->
<div class="col-md-3 left_col menu_fixed">
	<div class="left_col scroll-view">
		<div class="navbar nav_title" style="border: 0;">
			<a href="<%=request.getContextPath() %>/main.admin" class="site_title"><img class="" src="<%=request.getContextPath() %>/resources/images/admin/admin_side_icon.png" style="width: 45px;"> <span style="font-family: SangSangFlowerRoad;text-transform: uppercase;letter-spacing: 5px;font-weight: bold;font-size: 20px;text-shadow: 1px 1px #000;margin-left: 15px">꽃길 ADMIN</span></a>
		</div>
		<div class="clearfix"></div>

		<!-- menu profile quick info -->
		<div class="profile clearfix">
			<div class="profile_pic">
				<img src="<%=request.getContextPath() %>/resources/images/admin/<%=admin.getImagePath() %>" alt="..." class="img-circle profile_img" title="멋있죠?" data-toggle="tooltip">
			</div>
			<div class="profile_info">
				<span>어서오세요!</span>
				<h2><%=admin.getMemberName() %> 님</h2>
			</div>
  			<div class="logout"><a data-toggle="tooltip" href="#" title="로그아웃"><i class="glyphicon glyphicon-off"></i></a></div>
		</div>
		<!-- /menu profile quick info -->
		<br />

		<!-- sidebar menu -->
		<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
			<div class="menu_section">
				<h3 title="관리" data-toggle="tooltip">Administration</h3>
				<ul class="nav side-menu">
					<li><a><i class="fa fa-tencent-weibo"></i> 상품관리 <span class="fa fa-chevron-down"></span></a>
						<ul class="nav child_menu">
							<li><a href="<%=request.getContextPath() %>/retrieveProduct.admin">상품조회</a></li>
							<li><a href="<%=request.getContextPath() %>/regiProduct.admin">상품등록</a></li>
							<li><a href="<%=request.getContextPath() %>/retrieveProductOrder.admin">발주현황</a></li>
							<li><a href="<%=request.getContextPath() %>/productOrder.admin">상품발주</a></li>
						</ul>
					</li>
					<li><a><i class="fa fa-user"></i> 회원관리 <span class="fa fa-chevron-down"></span></a>
						<ul class="nav child_menu">
							<li><a href="<%=request.getContextPath() %>/member.admin">회원조회</a></li>
							<li><a href="<%=request.getContextPath() %>/admin.admin">관리자조회</a></li>
							<li><a href="<%=request.getContextPath() %>/regiAdmin.admin">관리자등록</a></li>
						</ul>
					</li>
					<li><a><i class="fa fa-tree"></i> 제작관리 <span class="label label-success pull-right">Coming Soon</span></a>
						<ul class="nav child_menu">
							<li><a href="<%=request.getContextPath() %>/DIY.admin">주문제작조회</a></li>
							<li><a href="<%=request.getContextPath() %>/DIY.admin">주문제작처리</a></li>
						</ul>
					</li>
					<li><a><i class="fa fa-truck"></i> 주문/배송관리 <span class="fa fa-chevron-down"></span></a>
						<ul class="nav child_menu">
							<li><a href="<%=request.getContextPath() %>/delivery.admin">주문/배송조회</a></li>
							<li><a href="<%=request.getContextPath() %>/delivery.admin">주문/배송처리</a></li>
						</ul>
					</li>
					<li><a><i class="fa fa-pencil-square-o"></i> 게시판관리 <span class="fa fa-chevron-down"></span></a>
						<ul class="nav child_menu">
							<li><a href="<%=request.getContextPath() %>/noticeBoard.admin">공지사항</a></li>
							<li><a href="<%=request.getContextPath() %>/faqBoard.admin">FAQ</a></li>
							<li><a href="<%=request.getContextPath() %>/userQuestionBoard.admin">1:1문의</a></li>
							<li><a href="<%=request.getContextPath() %>/reviewBoard.admin">상품후기</a></li>
						</ul>
					</li>
					<li><a><i class="fa fa-calendar"></i> 일정관리 <span class="label label-success pull-right">Coming Soon</span></a>
						<ul class="nav child_menu">
							<li><a href="<%=request.getContextPath() %>/calendar.admin">일정조회</a></li>
							<li><a href="<%=request.getContextPath() %>/calendar.admin">일정등록</a></li>
							<li><a href="<%=request.getContextPath() %>/calendar.admin">일정수정/삭제</a></li>
						</ul>
					</li>
				</ul>
			</div>
			<div class="menu_section">
				<h3 title="통계" data-toggle="tooltip">statistics</h3>
				<ul class="nav side-menu">
					<li><a><i class="fa fa-bar-chart"></i> 상품통계 <span class="fa fa-chevron-down"></span></a>
						<ul class="nav child_menu">
							<li><a href="<%=request.getContextPath() %>/productStatisticsSell.admin">최고매출상품TOP5</a></li>
							<li><a href="<%=request.getContextPath() %>/productStatisticsMerchandise.admin">최다판매상품TOP5</a></li>
							<li><a href="<%=request.getContextPath() %>/productStatisticsStar.admin">최고별점상품TOP5</a></li>
							<li><a href="<%=request.getContextPath() %>/productStatisticsClick.admin">최다조회상품TOP5</a></li>
						</ul>
					</li>
					<li><a><i class="fa fa-pie-chart"></i> 회원통계 <span class="fa fa-chevron-down"></span></a>
						<ul class="nav child_menu">
							<li><a href="<%=request.getContextPath() %>/memberStatisticsPurchase.admin">최고구입회원TOP5</a></li>
							<li><a href="<%=request.getContextPath() %>/memberStatisticsBuy.admin">최다구매회원TOP5</a></li>
							<li><a href="<%=request.getContextPath() %>/memberStatisticsVisit.admin">최다방문회원TOP5</a></li>
							<li><a href="<%=request.getContextPath() %>/memberStatisticsReview.admin">최다댓글회원TOP5</a></li>
						</ul>
					</li>
					<li><a><i class="fa fa-line-chart"></i> 기타통계 <span class="fa fa-chevron-down"></span></a>
						<ul class="nav child_menu">
							<li><a href="<%=request.getContextPath() %>/otherStatistics.admin">시간별 방문/구매 분포</a>
							<li><a href="<%=request.getContextPath() %>/otherStatistics.admin">연령별 회원 비율</a>
							<li><a href="<%=request.getContextPath() %>/otherStatistics.admin">등급별 회원 비율</a>
							<li><a href="<%=request.getContextPath() %>/otherStatistics.admin">성별 회원 비율</a>
						</ul>
					</li>                  
				</ul>
			</div>
			<div class="menu_section">
				<h3 title="정산" data-toggle="tooltip">settlement</h3>
				<ul class="nav side-menu dropdown">            
					<li title="커밍순" data-toggle="tooltip" data-placement="top"><a href="<%=request.getContextPath() %>/settlement.admin"><i class="fa fa-calculator"></i> 정산 <span class="label label-success pull-right">Coming Soon</span></a>
				</ul>
			</div>
		</div>
		<!-- /sidebar menu -->

		<!-- /menu footer buttons -->
		<div class="sidebar-footer hidden-small">
  			<a data-toggle="tooltip" data-placement="top" title="TOP" href="#top">
				<span class="glyphicon glyphicon-menu-up" aria-hidden="true"></span>
			</a>
		</div>
		<!-- /menu footer buttons -->
	</div>
</div>
<!-- /left navigation -->

<!-- top navigation -->
<div class="top_nav">
	<div class="nav_menu">
		<nav>
			<div class="nav toggle">
				<a id="menu_toggle"><i class="fa fa-bars"></i></a>
			</div>
			<div class="nav navbar-nav" style="margin-top: 5px;width: 160px;float: left">
				<a href="<%=request.getContextPath() %>/main.admin"><span class="topMenuFontColor topMenuTitle" id="admin">꽃길 ADMIN</span></a>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li class="">
					<a href="" class="user-profile dropdown-toggle" data-toggle="dropdown">
						<img src="<%=request.getContextPath() %>/resources/images/admin/<%=admin.getImagePath() %>" alt=""><%=admin.getMemberName() %> 님
						<span class=" fa fa-angle-down"></span>
					</a>
					<ul class="dropdown-menu dropdown-usermenu pull-right">
						<li><a href="<%=request.getContextPath() %>/admin.admin">관리자 정보</a></li>
						<li><a href="<%=request.getContextPath() %>/thema.admin">테마 변경</a></li>
						<li><a href="main.jsp">회원 페이지</a></li>
						<li><a href="<%=request.getContextPath() %>/main.jsp"><i class="fa fa-sign-out pull-right"></i>로그아웃</a></li>
					</ul>
				</li>
				<li role="presentation" class="dropdown">
					<a href="<%=request.getContextPath() %>/delivery.admin" class="dropdown-toggle info-number">
						<i class="fa fa-truck" title="주문/배송" data-toggle="tooltip" data-placement="bottom"></i>
						<span class="badge bg-red"><%=admin_orderCount %></span>
					</a>
				</li>
				<li role="presentation" class="dropdown">
					<a href="<%=request.getContextPath() %>/DIY.admin" class="dropdown-toggle info-number">
						<i class="fa fa-tree" title="주문제작" data-toggle="tooltip" data-placement="bottom"></i>
						<span class="badge bg-orange">0</span>
					</a>
				</li>
				<li role="presentation" class="dropdown">
					<a href="<%=request.getContextPath() %>/reviewBoard.admin" class="dropdown-toggle info-number">
						<i class="fa fa-pencil-square-o" title="상품리뷰" data-toggle="tooltip" data-placement="bottom"></i>
						<span class="badge bg-green"><%=admin_reviewCount %></span>
					</a>
				</li>
				<li role="presentation" class="dropdown">
					<a href="<%=request.getContextPath() %>/userQuestionBoard.admin" class="dropdown-toggle info-number">
						<i class="fa fa-comment-o" title="1:1문의" data-toggle="tooltip" data-placement="bottom"></i>
						<span class="badge bg-blue"><%=admin_userQuestionCount %></span>
					</a>
				</li>
				<li role="presentation" class="dropdown">
					<a href="<%=request.getContextPath() %>/message.admin" class="dropdown-toggle info-number">
						<i class="fa fa-envelope-o" title="메시지" data-toggle="tooltip" data-placement="bottom"></i>
						<span class="badge bg-purple"><%=admin_messageCount %></span>
					</a>
				</li>
			</ul>
		</nav>
	</div>
</div>
<!-- /top navigation -->
