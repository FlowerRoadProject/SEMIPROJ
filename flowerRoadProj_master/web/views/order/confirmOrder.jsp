<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.fr.jsp.order.model.vo.Order, com.fr.jsp.myShoppingBasket.model.vo.*"%>
<%
   ArrayList<Order> list = (ArrayList<Order>)request.getAttribute("list");
   ArrayList<Basket> bList = (ArrayList<Basket>)request.getAttribute("bList");
   String member_num = (String)session.getAttribute("member_num");
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제목록</title>

   <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css">
    <script src="<%=request.getContextPath() %>/resources/js/jquery-1.12.2.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   
   <style>
   
   @media (max-width: 767px){ 
         .container{
             width: 750px;
         }
     } 
     
     .test-border{
        border: 1px solid black;
     }
     .bottom-margin{
        margin-bottom: 1.5em;
     }
     .right-align{
        text-align: right;
     }
     
   </style>

</head>
<body>
<%@include file="/views/common/header.jsp" %>


<br><br><br><br><br><br>
   
   <div class="container bottom-margin">
      <div class="col-xs-10 col-xs-offset-1 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 bottom-margin">
         <span><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>장바구니</span>&nbsp;&gt;&nbsp; <span><span class="glyphicon glyphicon-usd" aria-hidden="true"></span>주문/결제</span>&nbsp;&gt;&nbsp; <span style="color:rgb(51, 122, 183); font-size:1.3em;"><span class="glyphicon glyphicon-ok-circle" aria-hidden="true"></span>주문완료</span>                
       </div>
        <h4><b class="col-xs-3 col-sm-3 col-md-3 col-lg-3 col-lg-offset-1">주문완료</b></h4>
        <hr class="col-xs-12 col-sm-12 col-md-12 col-lg-10 col-lg-offset-1" id="inputing" style="background:black;">
      <%for(int i = 0;i <bList.size(); i++){ %>      
      <div class="col-lg-10 col-lg-offset-1">
         <img src="<%=request.getContextPath()%>/resources/images/product/<%=bList.get(i).getImage()%>" class="col-lg-3" />
                        
         <div class="col-lg-9">
            <div class="col-lg-12">
               <h3><b><%=bList.get(i).getProduct_name() %></b></h3>
            </div>
         </div>
         <div class="col-lg-9">
            <div class="col-lg-3">
               <h4>수량:</h4>
            </div>
            <div class="col-lg-5 right-align">
               <h4><%=bList.get(i).getQuantity() %>개</h4>
            </div>            
         </div>         
         <div class="col-lg-9">
            <div class="col-lg-3">
               <h4>총가격: </h4>      
            </div>
            <div class="col-lg-5 right-align">
               <h4><%=bList.get(i).getProduct_price()*bList.get(i).getQuantity() %>원</h4>
            </div>
         </div>
         <hr class="col-lg-12"/>
      </div>   
      <%} %>
   </div>
   
   
   <div class="container">
      <h4><b class="col-xs-3 col-sm-3 col-md-3 col-lg-3 col-lg-offset-1">주문내역</b></h4>
        <hr class="col-xs-12 col-sm-12 col-md-12 col-lg-10 col-lg-offset-1" id="inputing" style="background:black;">
      
      <div class="col-lg-10 col-lg-offset-1">
         <div class="col-lg-12">
            <div class="col-lg-4">
               <h4><span class="glyphicon glyphicon-calendar" aria-hidden="true">&nbsp;</span>배송예약날짜</h4>
            </div>
            <div class="col-lg-8">
               <h4 id="reservationDate"><%=list.get(0).getReservation_date() %></h4>
            </div>
            <hr class="col-lg-12"/>
         </div>
         
         <div class="col-lg-12">
            <div class="col-lg-4">
               <h4><span class="glyphicon glyphicon-user" aria-hidden="true">&nbsp;</span>받는분</h4>
            </div>
            <div class="col-lg-8">
               <h4><%=list.get(0).getReceiver_name() %></h4>
            </div>
            <hr class="col-lg-12"/>
         </div>
         
         <div class="col-lg-12">
            <div class="col-lg-4">
               <h4><i class="fa fa-address-card-o">&nbsp;&nbsp;&nbsp;</i>받는주소</h4>
            </div>
            <div class="col-lg-8">
               <h4><%=list.get(0).getReceiver_address() %></h4>
            </div>
            <hr class="col-lg-12"/>
         </div>
         
         <div class="col-lg-12">
            <div class="col-lg-4">
               <h4><i class="fa fa-phone">&nbsp;&nbsp;&nbsp;</i>받는분 연락처</h4>
            </div>
            <div class="col-lg-8">
               <h4 id="receiver_phone"><%=list.get(0).getReceiver_phone() %></h4>
            </div>
            <hr class="col-lg-12"/>
         </div>   
         
         <div class="col-lg-12">
            <div class="col-lg-4">
               <h4><i class="fa fa-question">&nbsp;&nbsp;&nbsp;</i>익명배송여부</h4>
            </div>
            <div class="col-lg-8">
               <h4 id="anonymous"><%=list.get(0).getAnonymous_delivery()%></h4>
            </div>
            <hr class="col-lg-12"/>
         </div>   
         
         <div class="col-lg-12">
            <div class="col-lg-4">
               <h4><i class="fa fa-commenting-o">&nbsp;&nbsp;&nbsp;</i>배송메모</h4>
            </div>
            <div class="col-lg-8">
               <h4 id="message"><%=list.get(0).getDelivery_message()%></h4>
            </div>
            <hr class="col-lg-12"/>
         </div>         
      </div>
   </div>
   
   <div class="container">
   		<div class="col-lg-12" align="center">
   			<a href="<%=request.getContextPath()%>/main.jsp"><button class="btn btn-primary">메인으로</button></a>
   		</div>
   </div>
   
   
   
   <script>
      var rDate = $('#reservationDate').text();
      var newDate = rDate.substr(0,4)+"년 "+rDate.substr(5,2)+"월 "+rDate.substr(8,2)+"일 "+ rDate.substr(11,2)+"시 "+rDate.substr(14,2)+"분";
      var phone = $('#receiver_phone').text();
      var newPhone = phone.substr(0,3)+"-"+phone.substr(3,4)+"-"+phone.substr(7,4);
      
      
      $(function(){
         $('#reservationDate').text(newDate);
         $('#receiver_phone').text(newPhone);
         if($('#anonymous').text() == 'Y'){
            $('#anonymous').text('O');
         }else{
            $('#anonymous').text('X');
         }
      })   
   </script>



   

<%@include file="/views/common/footer.jsp" %>
</body>
</html>