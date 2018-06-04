<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fr.jsp.member.model.vo.Member"%>
<%
	String memberNum = (String)session.getAttribute("memberNum");
	Member m = (Member)session.getAttribute("m");
%>
<!DOCTYPE html>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
  	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>
  
  
 
    <link rel="icon" href="<%=request.getContextPath()%>/images/FlowerRoadLogo.png" type="image/ico" />
    <style>
    
        .navbar-bottom-font {
            font-weight: bold;
        }

        @media (max-width:768px) {
            #no1,
            #no2 {
                width: 750px;
            }
            .container {
                width: 750px;
            }
        }
    .navbar-default {
      background-color: rgba(255, 254, 254, 0.9);
    }
    .btn {cursor:pointer;}
    
    .test{
    border:1px solid;
    }
    
    </style>
<%-- <script>
	function mainGo(){
		location.href="<%=request.getContextPath()%>/main.jsp";
	}

     $('#logo').on('click', function (e) {
    	window.location.href="<%=request.getContextPath()%>/main.jsp";
    }); 
}
</script> --%>

<!-- <body style="height:5000px"> -->
   
    
    <br>
    <div class="visible-md">md</div>
    <div class="visible-sm">sm</div>
    
    <nav class="navbar navbar-default navbar-fixed-top test" id="naaaaav">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header col-xs-2 col-sm-2 col-md-2 col-lg-2">
                <a href="#" id="favorite">
                    <img src="<%=request.getContextPath()%>/resources/images/main/favorite.png" width="75px" height="75px">
                </a>
            </div>
            <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8" style="text-align:center; display:inline-block;">
                <div id="no1">
                    <a href="<%=request.getContextPath()%>/main.jsp"><img src="<%=request.getContextPath()%>/resources/images/FlowerRoadLogo.jpg" class="btn" style="width:200px; height:80px"></a>
                </div>
                <div style="text-align:center; display:inline-block;" id="no2" class="col-sm-12 col-xs-12 col-lg-12 col-md-12">

                    <ul class="nav navbar-nav navbar-bottom-font col-sm-12 col-xs-12 col-lg-12 col-md-12 test">
                        <li class="col-sm-2 col-xs-2 col-sm-offset-1 col-xs-offset-1 test" >
                            <a href="<%=request.getContextPath()%>/productList.do?category=꽃다발">꽃다발</a>
                        </li>
                        <li class="col-sm-2 col-xs-2">
                            <a href="<%=request.getContextPath()%>/productList.do?category=꽃바구니">꽃바구니</a>
                        </li>
                        <li class="col-sm-2 col-xs-2">
                            <a href="<%=request.getContextPath()%>/productList.do?category=화환">화환</a>
                        </li>
                        <li class="col-sm-2 col-xs-2">
                            <a href="<%=request.getContextPath()%>/productList.do?category=디저트">디저트</a>
                        </li>
                        <li class="col-sm-2 col-xs-2">
                            <a href="<%=request.getContextPath()%>/productList.do?category=카드">선물</a>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 test">
                <div class="collapse navbar-collapse">
                   
                        <ul class="nav navbar-nav navbar-right test">
                        <%if(memberNum==null){ %>
                            <li>
                                <a href="<%=request.getContextPath()%>/views/mainPage/login.jsp">로그인</a>
                            </li>
                            <li>
                                <a href="#">회원가입</a>
                            </li>
                            <%}else{ %>
                            <li>
                                <a href="<%= request.getContextPath() %>/logout.me">로그아웃</a>
                            </li>
                            <li>
                                <a href="<%=request.getContextPath()%>/views/myPage/myPage_main.jsp">마이페이지</a>
                            </li>
                            <%} %>
                            <li>
                                <a href="<%=request.getContextPath()%>/select.bk">장바구니</a>
                            </li>
                        </ul>
               
               
                </div>

            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
    
