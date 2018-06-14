<%@page import="com.fr.jsp.product.model.vo.ProductSimple"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.* ,com.fr.jsp.product.model.vo.ProductDetail,com.fr.jsp.common.PageInfo"%>
    
<% ArrayList<ProductSimple> pagedList = (ArrayList<ProductSimple>)request.getAttribute("pagedList");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int reviewCount = (Integer)request.getAttribute("reviewCount");
	String event = (String)request.getAttribute("event");
	String category = (String)request.getAttribute("category");
	String order = (String)request.getAttribute("order");
	String member_num = (String)session.getAttribute("memberNum");
	
	if(event==null)
		event="none";
	
	if(category==null)
		category="none";
	
	
	if(order==null)
		order="none";
	
%>
<!DOCTYPE html>
<html>
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.js"></script>

<meta charset="UTF-8">
	
    
	<title>상품목록</title>
	<style>		
		@media(min-width:1200px){
			.items{
				height:540px;
			
			}
		}

		@media(min-width:992px) and (max-width:1199px){
			.items{
				height:470px;
					
			}
		}
		
		@media(max-width:991px){
		.items{
				height:600px;
				
			}
		}

        
        .hrline{
        	background: black;
        } 
        .top-margin{
        	margin-top: 1.5em;
        }
        .linein{
        	display: inline;
        } 
        .test-border{
        	border: 1px solid black;
        }
        .rightAlign{
        	text-align: right;
        }
        .font-gray{
        	color: gray;
        }
        .border-gray{
        	border: 1px solid gray;
        }
        .font-title{
        	font-size: 1.2em;
        	color: #4a4a4a;
			padding-left: 0;
			text-overflow: ellipsis;
			white-space: nowrap;
			overflow: hidden;
			display:block;
        }
        .tag{
        	position: relative;
        	top: -3em;
        	right: -1em;
        }
        
        .decrease_padding{
        	padding-left:3px;
        	padding-right:3px;
        }
        .thumbnail img:HOVER{
        
        	opacity: 0.5;
   			filter: alpha(opacity=50);
        	animation-name: opaque;
    		animation-duration: 10s;
        }
        
        .thumbnail_soldOut{
        	opacity: 0.5;
   			filter: alpha(opacity=50);
        
        }
        
        .soldOut_text{
         position: absolute;
   		 top: 50%;
    	 left: 50%;
    	 transform: translate(-50%, -50%);
        }
        
       
        
        .test{
        	border:1px solid;
        }
     	.align-center-inner{
     		float:none;
     	}

		.align-center-outer{
			text-align:center;
		}     
		
		.rating_star {
			color: gold;
			font-size: 1em;
		}

		.rating_star_empty {
			color: grey;
			font-size: 1em;
		}  
		
		
		.rating_star_align{
			text-align:right;
			margin-top:7px;
		}
		
		
	</style>


</head>
<body>




<%@include file="../common/header.jsp"%>
<br /><br /><br /><br /><br /><br />
<%-- <%@ include file="../common/eventMenu.jsp"%> --%>
<%@include file="../common/loginModal.jsp" %>

<jsp:include page="../common/eventMenu.jsp">

<jsp:param name="category" value="<%=event %>" />
 
</jsp:include>
  <img src="<%=request.getContextPath()%>/resources/images/banner.png" alt="" class="banner" style="position: absolute; right: 10em; top: 42em; width: 10em; height: 30em;"/>
	
   <!-- 여기부터 내용을 넣겠다 -->
	<div class="container">
	<div class="col-lg-12 visible-lg " style="margin-top: 4em"></div>
		
		<div class="col-lg-12 top-margin"> <!-- 높은가격순? -->
			
			<div class="col-lg-12" ><!-- 여기에 상품 리스트. 사진들 들어갈거야 -->
				<!-- <div class="row"> -->
				<div class="linein">
				<a href="<%=request.getContextPath()%>/sortProduct.do?order=review" type="button" class="btn btn-primary">평점순</a></div>
				<div class="linein">
				<a href="<%=request.getContextPath()%>/sortProduct.do?order=priceDesc" type="button" class="btn btn-success">높은 가격순</a></div>
				<div class="linein">
				<a href="<%=request.getContextPath()%>/sortProduct.do?order=priceAsc" type="button" class="btn btn-info">낮은 가격순</a></div>
				<div class="linein">
				<a href="<%=request.getContextPath()%>/sortProduct.do?order=byName" type="button" class="btn btn-warning">이름순</a></div>
				<hr class="col-lg-12 hrline" style="float:center;">
				
				<%if(pagedList!=null){ %>
				<%for(int i=0;i<pagedList.size();++i) {%>
				
  					<div class="col-xs-6 col-sm-6 col-md-4 col-lg-4">
    					<div class="col-lg-12 thumbnail items ">
    					<a href="<%=request.getContextPath()%>/productDetail.do?productNum=+<%=pagedList.get(i).getProductNum()%>">
    					
    					<%if(pagedList.get(i).getProductQuantity()>0){ %>
      						<img src="<%=request.getContextPath()%>/resources/images/product/<%=pagedList.get(i).getImage()%>" alt="...">
      					<%} else {%>
      						<img class="thumbnail_soldOut" src="<%=request.getContextPath()%>/resources/images/product/<%=pagedList.get(i).getImage()%>" alt="...">
      						<span class="soldOut_text"><h4><b>곧 준비할게요 :)</b></h4></span>
      					
      					<%} %>
      					</a>
      					<!-- 	<span class="label label-primary tag">Primary</span>
      						<span class="label label-success tag">success</span> -->
      						<div class="col-lg-12 caption">        						
        						<h4 class="col-lg-12 "><br /><b class="font-title text-truncate"><%=pagedList.get(i).getProductName() %></b></h4>        						
        						<h4 class=" col-lg-12 "><%=pagedList.get(i).getProductPrice() %>원</h4>
        						
       						
        						<h5 class="col-lg-4  font-gray">리뷰 <span><%=pagedList.get(i).getReviewCount() %></span></h5>  
        						<div class="col-lg-8  rating_star_align ">
	        						<%for(int j=0;j<Math.floor(pagedList.get(i).getReviewAvg());++j){ %>
	        							<span class='glyphicon glyphicon-star rating_star'></span>
	        						<%} %>
	        						<%for(int j=0;j<5-Math.floor(pagedList.get(i).getReviewAvg());++j){ %>
	        							<span class='glyphicon glyphicon-star rating_star_empty'></span>
	        						<%} %>
        						</div>
        						
        						  
        						<div class="col-lg-12 " style="margin-top:15px;">  
        							
        							<%if(pagedList.get(i).getProductQuantity()<=0){ %>
        							
	        							<a class="col-lg-12 btn btn-default" role="button" >품절</a>
	        							
        							 <%} else {%>
        							 
        							 	<%if(!pagedList.get(i).getProductTypeName().equals("디저트")&&
	        									!pagedList.get(i).getProductTypeName().equals("메시지태그")&&
	        									!pagedList.get(i).getProductTypeName().equals("카드")) {%>
	        							 <a class="col-lg-4 col-md-5 col-sm-4 col-xs-4 btn btn-default" role="button" onclick="addToBasket('<%=pagedList.get(i).getProductNum()%>');">장바구니</a> 
	        							<a class="col-lg-7 col-lg-offset-1 col-md-6 col-md-offset-1 col-sm-7 col-sm-offset-1 col-xs-7 col-xs-offset-1 btn btn-primary" role="button" 
	        							onclick="location.href='<%=request.getContextPath()%>/productDetail.do?productNum=+<%=pagedList.get(i).getProductNum()%>'">바로구매</a>
	        							<%}else{ %>
	        							 <a class="col-lg-12 btn btn-default" role="button" onclick="addToBasket('<%=pagedList.get(i).getProductNum()%>');">장바구니</a> 
	        							
	        							<%} %>
        							 
        							 <%} %>
        							
      							</div>	 
      						</div>
    					</div>
  					</div>
  					<%} %>
  					<%} %>
  					
				<!-- </div> -->
			
			</div>
			

			
		</div>
		
   		
   	   
	</div>
	
	<!--페이지 네이션  -->
	
	<div class="container align-center-outer" >
		<%if(pi!=null){ %>
		<div class="col-lg-12 align-center-inner" >
			<ul class="pagination">
   				<li>
      				<a href="<%=request.getContextPath()%>/productList.do?currPage=<%=pi.getStartPage() %>" aria-label="Previous">
        				<span aria-hidden="true">&laquo;</span>
      				</a>
    			</li>
    	
    	
    			<%if(pi.getCurrPage()<=pi.getStartPage()){ %>
    				<li class="disabled"><a >&lt;</a></li>
    			<%} else{ %>
    				<li><a href="<%=request.getContextPath()%>/productList.do?&currPage=<%=pi.getCurrPage()-1%>">&lt;</a></li>
    			<%} %>
    			
    				<%for(int i=pi.getStartPage();i<=pi.getEndPage();++i){ %>
    			
    					<%if(i==pi.getCurrPage()){ %>
    						<li class="active"><a><%=i%></a></li>
    					<%} else { %>
    						<li><a href="<%=request.getContextPath()%>/productList.do?&currPage=<%=i%>"><%=i%></a></li>
    				<%} %>
    			<%} %>
    			
    			<%if(pi.getCurrPage()>=pi.getMaxPage()){ %>
    				<li class="disabled"><a >&gt;</a></li>
    			<%}else{ %>
    				<li><a href="<%=request.getContextPath()%>/productList.do?&currPage=<%=pi.getCurrPage()+1%>">&gt;</a></li>
    			<% } %>
    			<li>
     				<a href="<%=request.getContextPath()%>/productList.do?&currPage=<%=pi.getEndPage()%>" aria-label="Next">
        				<span aria-hidden="true">&raquo;</span>
      				</a>
    			</li>
  			</ul>
		
		
		</div>
		<%} %>
		<div class="row ">
			<div class="col-lg-12">
			    <form class="form-inline" action="<%=request.getContextPath()%>/searchProduct.do" id="searchProduct">
			    	<div class="form-group">
			    		<label for="search" class='sr-only'>검색</label>
			    		<input type="text" class="form-control" placeholder="내용" id="search" name="keyword"/>
			    		<button type="button" class="btn btn-default" onclick="onSearch();">검색하기</button>
			    	</div>
			    </form>
			</div><!-- /.col-lg-6 -->
		</div>
	</div>
	
   
 
 
    
   
   

<%@include file="../common/footer.jsp"%>

<script>

function addToBasket(productNum){
	

	
	if(!checkLogin())
	{
		$('#myModal').modal({"show":true});
		
		return;
	}
		$.ajax({
			url:"addBasket.do",
			data:{pNum:productNum},
			success:function(data){
				
				if(data>0)
					alert("장바구니에 성공적으로 추가!!");
				
			},error:function(data){
				alert("장바구니에 추가 실패!!");
			}
		
		});
	
	}
	
	function checkLogin(){
		
		<%if(request.getSession(false).getAttribute("memberNum")==null){%>
			 return false;
		<%}else{%>
			return true;
		<%}%>
	}
	
	function onSearch(){
		if($('#searchProduct input').val().length>0&&$('#searchProduct input').val()!=" ")
			$('#searchProduct').submit();
		else
			alert("검색어를 입력 해 주세요");
		
	}

		
</script>


</body>
</html>