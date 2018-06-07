<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fr.jsp.member.model.vo.*"%>
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

        @media (max-width:992px) {
            #no1,
            #no2 {
                width: 500px;
            }
            .container-fluid {
                width: 900px;
            }
        }
        @media (max-width:1100px){
        	#no1,#no2{
        	width:900px;
        	}
        	.container{
        	width:900px;
        	}
        }
        
        @media(min-width:1332px){
        	.lg-size{
        		height: 11em;
        	}
        }
        
        
    .navbar-default {
      background-color: rgba(255, 254, 254, 0.9);
    }
    .btn {cursor:pointer;}
    
    .test{
    border:1px solid black;
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
    <!-- 
    <div class="visible-md">md</div>
    <div class="visible-sm">sm</div> -->
    
    <nav class="navbar navbar-default navbar-fixed-top" id="naaaaav">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header col-xs-2 col-sm-2 col-md-2 col-lg-2">                
                <a href="#" class="favorite">
                    <img src="<%=request.getContextPath()%>/resources/images/favorite.png" width="75px" height="75px">
                </a>            
            </div>
            <!-- style="width:200px; height:80px" -->            
           <!--  style="width:43em; height:10em" -->
            <a href="<%=request.getContextPath()%>/main.jsp">
            	<img src="<%=request.getContextPath()%>/resources/images/FlowerRoadLogo.jpg" class="btn lg-size col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2"></img>
            </a>
            
            <div class="col-xs-1 col-md-1 col-lg-1">&nbsp;</div>
            <!-- <div class="col-lg-3 col-lg-offset-2 collapse navbar-collapse">   -->          	                 
            	<ul class="col-xs-4 col-sm-4 col-md-3 col-lg-3 nav navbar-nav visible-md visible-lg">
            	    <%if(memberNum==null){ %>
                   		<li>
                        	<a href="<%=request.getContextPath()%>/views/mainPage/login.jsp">로그인</a>
                        </li>
                        <li>
                        	<a href="<%=request.getContextPath()%>/views/mainPage/signUp.jsp">회원가입</a>
                        </li>
                    <%}else{ %>
                        <li>
                        	<a href="<%= request.getContextPath() %>/logout.me">로그아웃</a>
                        </li>
                        <li>
                            <a href="<%=request.getContextPath()%>/infoMain.me">마이페이지</a>
                        </li>
                    <%} %>
                        <li>
                        	<a href="<%=request.getContextPath()%>/select.bk">장바구니</a>
                        </li>
                    </ul>
                    
                    
                    
                    
            <!-- </div> -->
                        
            <div class="col-xs-8 col-sm-12 col-md-12 col-lg-12" style="text-align:center; display:inline-block;">
                <%-- <div id="no1">
                    <a href="<%=request.getContextPath()%>/main.jsp"><img src="<%=request.getContextPath()%>/resources/images/FlowerRoadLogo.jpg" class="btn" style="width:30em; height:10em"></img></a>
                </div> --%>
                <div style="text-align:center; display:inline-block;" id="no2" class="col-sm-12 col-xs-12 col-lg-12 col-md-12">

                    <ul class="nav navbar-nav navbar-bottom-font col-sm-12 col-xs-12 col-lg-12 col-md-12 test">
                        <li class="col-sm-2 col-xs-2 col-sm-offset-1 col-xs-offset-1" >
                            <a href="<%=request.getContextPath()%>/productList.do?category=꽃다발">꽃다발</a>
                        </li>
                        <li class="col-lg-2 col-sm-2 col-xs-2">
                            <a href="<%=request.getContextPath()%>/productList.do?category=꽃바구니">꽃바구니</a>
                        </li>
                        <li class="col-sm-2 col-xs-2">
                            <a href="<%=request.getContextPath()%>/productList.do?category=화환">화환</a>
                        </li>
                        <li class="col-sm-2 col-xs-2">
                            <a href="<%=request.getContextPath()%>/productList.do?category=디저트">디저트</a>
                        </li>
                        <li class="col-sm-2 col-xs-2">
                            <a href="<%=request.getContextPath()%>/productList.do?category=선물">선물</a>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            
            <!-- /.navbar-collapse -->
        
        </div>
        <!-- /.container-fluid -->
    
    </nav>

    
