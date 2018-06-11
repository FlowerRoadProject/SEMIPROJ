<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.fr.jsp.member.model.vo.*"%>
<%
	String memberNum = (String) session.getAttribute("memberNum");
%>
<!DOCTYPE html>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>



<link rel="icon"
	href="<%=request.getContextPath()%>/images/FlowerRoadLogo.png"
	type="image/ico" />
<script>

				$(function(){
					<%
					if (memberNum == null || memberNum == "") {
					%>
					$('#menu').popover(
							{
								template : '<div class="popover" style="width:90px; height:60px;"><div class="arrow"></div><div class="popover-inner"><div class="popover-content"><p></p></div></div></div>'
							});
					<%}else{%>
					$('#menu').popover(
							{
								template : '<div class="popover" style="width:115px; height:90px;"><div class="arrow"></div><div class="popover-inner"><div class="popover-content"><p></p></div></div></div>'
							});	
					<%}%>
			
					$('#menu').attr("data-content" , $('#menu_button').html());
					$('.popover-dismiss').popover({
						  trigger: 'focus'
						});
				});
				
				$('#favorite').on(
						'click',
						function(e) {
							var bookmarkURL = window.location.href;
							var bookmarkTitle = document.title;
							var triggerDefault = false;
							if (window.sidebar && window.sidebar.addPanel) {
								// Firefox version < 23 
								window.sidebar.addPanel(bookmarkTitle,
										bookmarkURL, '');
							} else if ((window.sidebar && (navigator.userAgent
									.toLowerCase().indexOf('firefox') > -1))
									|| (window.opera && window.print)) {
								// Firefox version >= 23 and Opera Hotlist 
								var $this = $(this);
								$this.attr('href', bookmarkURL);
								$this.attr('title', bookmarkTitle);
								$this.attr('rel', 'sidebar');
								$this.off(e);
								triggerDefault = true;
							} else if (window.external
									&& ('AddFavorite' in window.external)) {
								// IE Favorite 
								window.external.AddFavorite(bookmarkURL,
										bookmarkTitle);
							} else {
								// WebKit - Safari/Chrome 
								alert((navigator.userAgent.toLowerCase()
										.indexOf('mac') != -1 ? 'Cmd' : 'Ctrl')
										+ '+D 키를 눌러 즐겨찾기에 등록하실 수 있습니다.');
							}
							return triggerDefault;
						});
</script>

<style>
.navbar-bottom-font {
	font-weight: bold;
}

@media ( max-width :992px) {
	#no1, #no2 {
		width: 500px;
	}
	.container-fluid {
		width: 900px;
	}
}

@media ( max-width :1100px) {
	#no1, #no2 {
		width: 900px;
	}
	.container {
		width: 900px;
	}
}

@media ( min-width :1332px) {
	.lg-size {
		height: 8em;
	}
}

.navbar-default {
	background-color: rgba(255, 254, 254, 0.9);
}

.btn {
	cursor: pointer;
}

.test {
	border: 1px solid black;
}

.Pmenu {
	height: 3.5em;
}

.Pmenu li a {
	height: 2.5em;
	font-size: 1.2em;
}
</style>



<br>

<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid" id="navContainer">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header col-xs-2 col-sm-2 col-md-2 col-lg-2">
			<%-- <a href="#"> <img id="favorite"
				src="<%=request.getContextPath()%>/resources/images/favorite.png"
				width="75px" height="75px">
			</a> --%>
			<button type="button" class="btn btn-default btn-lg">
			 <span class="glyphicon glyphicon-star" id="favorite" style="cursor: pointer" aria-hidden="true"></span> 
			 </button>
			
		</div>
		<!-- style="width:200px; height:80px" -->
		<!--  style="width:43em; height:10em" -->
		<a href="<%=request.getContextPath()%>/main.jsp"> <img
			src="<%=request.getContextPath()%>/resources/images/FlowerRoadLogo.jpg"
			class="btn lg-size col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2"></img>
		</a>

		<div class="col-xs-1 col-md-1 col-lg-1">&nbsp;</div>
		<!-- <div class="col-lg-3 col-lg-offset-2 collapse navbar-collapse">   -->


		<ul class="col-xs-4 col-sm-4 col-md-3 col-lg-3 nav navbar-nav">

			<li style="float: right">
			 <a id="menu" class="btn btn-default btn-sm glyphicon glyphicon-align-justify" tabindex="0"
							role="button" style="color: black" data-toggle="popover" 
							data-html="true" data-trigger="focus" title="메뉴" data-placement="bottom"></a>
				<%-- <ul class="dropdown-menu">
					<%
						if (memberNum == null || memberNum == "") {
					%>
					<li><a
						href="<%=request.getContextPath()%>/views/mainPage/login.jsp">로그인</a>
					</li>
					<li><a
						href="<%=request.getContextPath()%>/views/mainPage/signUp.jsp">회원가입</a>
					</li>
					<%
						} else if (memberNum.substring(0, 1).equals("A")) {
					%>
					<li><a href="<%=request.getContextPath()%>/logout.me">로그아웃</a></li>
					<li><a href="<%=request.getContextPath()%>/firstMain.admin">관리자페이지</a></li>
					<%
						} else {
					%>
					<li><a href="<%=request.getContextPath()%>/logout.me">로그아웃</a></li>
					<li><a href="<%=request.getContextPath()%>/infoMain.me">마이페이지</a></li>
					<li><a href="<%=request.getContextPath()%>/select.bk">장바구니</a></li>
					<%
						}
					%>
				</ul> --%></li>
		</ul>


		<!-- </div> -->

		<div class="col-xs-8 col-sm-12 col-md-12 col-lg-12"
			style="text-align: center; display: inline-block;">

			<div style="text-align: center; display: inline-block;" id="no2"
				class="col-sm-12 col-xs-12 col-lg-10 col-md-12 col-lg-offset-1">

				<ul
					class="nav navbar-nav navbar-bottom-font Pmenu col-sm-12 col-xs-12 col-lg-12 col-md-12">
					<li class="col-sm-2 col-xs-2 col-sm-offset-1 col-xs-offset-1">
						<a
						href="<%=request.getContextPath()%>/productList.do?category=꽃다발">꽃다발</a>
					</li>
					<li class="col-lg-2 col-sm-2 col-xs-2"><a
						href="<%=request.getContextPath()%>/productList.do?category=꽃바구니">꽃바구니</a>
					</li>
					<li class="col-sm-2 col-xs-2"><a
						href="<%=request.getContextPath()%>/productList.do?category=화환">화환</a>
					</li>
					<li class="col-sm-2 col-xs-2"><a
						href="<%=request.getContextPath()%>/productList.do?category=디저트">디저트</a>
					</li>
					<li class="col-sm-2 col-xs-2"><a
						href="<%=request.getContextPath()%>/productList.do?category=선물">선물</a>
					</li>
				</ul>
			</div>
		</div>
		<script>
			$('.Pmenu li a').hover(function() {
				$(this).css({
					background : 'lightcoral',
					"color" : 'white',
					cursor : "pointer"
				});
			}, function() {
				$(this).css({
					background : 'rgba(255, 254, 254, 0.9)',
					color : "black"

				});
			})
			
			navContainerHeight = $('#navContainer').height();
			
			$(function(){
				
				$(window).on('resize',function(){
					navContainerHeight=$('#navContainer').height();
					
				});
				
			});
			
			function getHeight(){
				return navContainerHeight;
			}
		</script>


		<!-- Collect the nav links, forms, and other content for toggling -->

		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->

</nav>
		<div style="display : none">
			<div id="menu_button" class="btn-group-vertical">
					<%
						if (memberNum == null || memberNum == "") {
					%>
					<a href="<%=request.getContextPath()%>/views/mainPage/login.jsp">로그인</a><br>
					<a href="<%=request.getContextPath()%>/views/mainPage/signUp.jsp">회원가입</a><br>
					<%
						} else if (memberNum.substring(0, 1).equals("A")) {
					%>
					<a href="<%=request.getContextPath()%>/logout.me">로그아웃</a><br>
					<a href="<%=request.getContextPath()%>/firstMain.admin">관리자페이지</a><br>
					<%
						} else {
					%>
					<a href="<%=request.getContextPath()%>/logout.me">로그아웃</a><br>
					<a href="<%=request.getContextPath()%>/infoMain.me">마이페이지</a><br>
					<a href="<%=request.getContextPath()%>/select.bk">장바구니</a><br>
					<%
						}
					%>
         	</div>
         </div>
<br />
<br />
<br />
<br />
