<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fr.jsp.admin.model.vo.AdminTheme"%>
<% 
	AdminTheme adminTheme = (AdminTheme)(session.getAttribute("adminTheme"));
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
			var font_family = '<%=adminTheme.getFontFamily()%>';
			var font_size = '<%=adminTheme.getFontSize()%>';
			var font_weight = '<%=adminTheme.getFontWeight()%>';
			var nav_title_bgc = '<%=adminTheme.getNavTitleBbc()%>';
			var nav_center_bgc = '<%=adminTheme.getNavCenterBgc()%>';
			var nav_child_bgc = '<%=adminTheme.getNavChildBgc()%>';
			var nav_bottom_bgc = '<%=adminTheme.getNavBottomBgc()%>';
			var top_menu_bgc = '<%=adminTheme.getTopMenuBgc()%>';
			var top_child_bgc = '<%=adminTheme.getTopChildBgc()%>';
			var main_bgc = '<%=adminTheme.getMainBgc()%>';
			var nav_title_color = '<%=adminTheme.getNavTitleColor()%>';
			var nav_profile_color = '<%=adminTheme.getNavProfileColor()%>';
			var nav_side_title_color = '<%=adminTheme.getNavSideTitleColor()%>';
			var nav_side_color = '<%=adminTheme.getNavSideColor()%>';
			var nav_child_color = '<%=adminTheme.getNavChildColor()%>';
			var top_menu_color = '<%=adminTheme.getTopMenuColor()%>';
			var main_color = '<%=adminTheme.getMainColor()%>';
			var mainPath = '<%=request.getContextPath()%>';
		</script>
		<style>
			<%-- body{
				width:100%;
				font-family:Do hyeon;
				background-image:url('<%=request.getContextPath() %>/resources/images/admin/petal2.gif');
			} --%>
			#one{
			    width: 30em;
			    height: auto;
			    white-space:nowrap;
			    overflow:hidden;
			    -webkit-animation: type 5s steps(50,end);
			    animation: type 5s steps(50,end);
			}
			#two{
			    width: 30em;
			    height: auto;
			    white-space:nowrap;
			    overflow:hidden;
			    -webkit-animation: type 5s steps(4000,end);
			    animation: type 5s steps(4000, end);
			    display:none;			
			}
			#three{
			    width: 30em;
			    height: auto;
			    white-space:nowrap;
			    overflow:hidden;
			    -webkit-animation: type 5s steps(4000,end);
			    animation: type 5s steps(4000, end);
			    display:none;			
			}
			#four{
			    width: 30em;
			    height: auto;
			    white-space:nowrap;
			    overflow:hidden;
			    -webkit-animation: type 5s steps(4000,end);
			    animation: type 5s steps(4000, end);
			    display:none;			
			}
			 
			@keyframes type{
			    from { width: 0; }
			}
			 
			@-webkit-keyframes type{
			    from { width: 0; }
			}
		</style>
	</head>
	<body id="adminQuiz">
		<!-- <div id="infoDiv" style="width:100%;height:auto;top:15%;left:15%;position:absolute">
			<h1 id="one">안녕하세요.</h1><br />
			<h1 id="two">이곳은 <mark>관리자</mark> 페이지입니다. </h1>
			<h1 id="three"><mark>관리자</mark>가 아니라면 들어갈 수 없습니다. </h1>
			<h1 id="four">나가는 방법은 화면을 아무데나 클릭하세요.</h1>
		</div> -->
		<a href="<%=request.getContextPath() %>/main.admin" id="admin_Main"></a>
		<a href="<%=request.getContextPath() %>/views/mainPage/login.jsp" id="member_Main"></a>
		<%-- <audio src="<%=request.getContextPath() %>/resources/music/third.wav" loop autoplay preload="metadata"></audio> --%>
		
		<!-- admin_JS -->
		<%@ include file="common/admin_JS.jsp" %>
	</body>
</html>