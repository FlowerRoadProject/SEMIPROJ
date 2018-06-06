<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import= "com.fr.jsp.myShoppingBasket.model.vo.*, java.util.*, javax.servlet.http.*" %>
    
<%
	ArrayList<Basket> list = (ArrayList<Basket>)request.getAttribute("list");	
	ArrayList<Basket> oList = (ArrayList<Basket>)request.getAttribute("oList");
	
	String member_num = (String)session.getAttribute("member_num");
	
	int length = list.size();
%>

<!DOCTYPE html>
<html>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
    <head>
    	
        <title>장바구니메뉴</title>
        <%-- <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css">
        
        <script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 --%>
 
 		<%-- <script src="<%=request.getContextPath() %>/resources/js/jquery-1.12.2.min.js"></script>
         --%>
        <style>           
            .price-gray{
                color: rgb(177, 176, 176); 
            }            
            .option-product{                          
                display: inline-block;
                margin-bottom: 1.5em;                
            }            
            .dis-inlineblock{
                display: inline-block;
            }  
            .align-right{
                text-align: right;
            }
            .buy-btn{
                margin-top: 17px;
            }
            
            .bottom-margin{
                margin-bottom: 1.5em;
            }
            .top-margin{
                margin-top: 1.5em;
            }
            
            /*border관련 클래스*/
            .test-border{
                border: 1px solid lightgray;
            }
            .top-border{
                border-top: 1px solid lightgray;
            }
            .bottom-border{
                border-bottom: 1px solid lightgray;
            }
            .align-right{
            	text-align: right;
            }
           
            
            @media (min-width: 992px) and (max-width: 1920px) {
                .right-border{
                border-right: 1px solid lightgray;
                }
            }
            
            @media (max-width: 767px){ 
                .container{
                    width: 750px;
                }
            }
        </style>

    </head>
    <body>      
        <%@include file="/views/common/header.jsp" %>
   		
        <br><br><br><br><br><br><br>
		
		
		
		
        <div class="container">
              <div class="col-xs-10 col-xs-offset-1 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 bottom-margin">
                    <span><strong>장바구니</strong></span>&nbsp;&gt;&nbsp; <span>주문/결제</span>&nbsp;&gt;&nbsp; <span>주문완료</span>&nbsp;&gt;&nbsp;                
              </div>
        <div class="col-xs-10 col-xs-offset-1 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1" id="frame"> <!--선택한 상품 리스트 프레임-->
            <h4><b class="col-xs-3 col-sm-3 col-md-3">장바구니</b></h4>
            <hr class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="inputing" style="background:black;">
            
            <input type="hidden" name="length" value="<%=length%>"/>
            
           
            
                        
            <%for(int i = 0; i< list.size(); i++){ %>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 product-each"> <!--제품 한개-->
            	<input type="hidden" name="productNum" class="productNum" value="<%=list.get(i).getProduct_num()%>"/>            	
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-2 top-margin bottom-margin"> <!--사진 칸-->
                    <img src="<%=request.getContextPath() %>/resources/images/product/<%=list.get(i).getImage() %>" class="image img-responsive product-img" alt="">
               		<input type="hidden" class="product-image" value="<%=list.get(i).getImage() %>"/>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-0 bottom-margin"><!--정보칸-->
                
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"><h3 class="product-name"><%=list.get(i).getProduct_name() %></h3></div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"><br /></div>
                    
                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 price-gray">판매가 : </div>
                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-4 col-md-offset-4 col-lg-offset-4 price-gray product-price align-right"><%=list.get(i).getProduct_price() %>원</div>
                    
                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">합계 : </div>
                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-4 col-sm-offset-0 col-md-offset-4 col-lg-offset-4 total-price align-right"><%=list.get(i).getProduct_price()*list.get(i).getQuantity() %>원</div>
     
            </div>
            <div class="col-xs-7 col-sm-7 col-md-7 col-lg-2 col-xs-offset-3 col-sm-offset-3 col-md-offset-3 col-lg-offset-0 button-group top-margin bottom-margin"><!--버튼칸-->
                    <div class="col-xs-5 col-sm-5 col-md-5 col-lg-8">
                        <input type="number" class="form-control product-number" value="<%=list.get(i).getQuantity() %>" min=1 >
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-4">
                        <button class="btn btn-default update-btn">수정하기</button>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-4 col-xs-offset-5 col-sm-offset-5 col-md-offset-5 col-lg-offset-8">
                        <button class="btn btn-default delete-btn">삭제하기</button>
                    </div>
            </div>
            <hr class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        </div>
        <%} %>
        <!-- 얘는 추가하게될 틀이다 -->
        <div style="display:none">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 optionPlus" name="addProduct"> <!--제품 한개-->
             <input type="hidden" name="productNum" class="productNum" value="" />
             <div class="col-xs-12 col-sm-12 col-md-12 col-lg-2 top-margin bottom-margin"> <!--사진 칸-->
                    <img src="" class="image img-responsive product-img" alt="">
               		<input type="hidden" class="product-image" value=""/>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-0 bottom-margin"><!--정보칸-->
                
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"><h3 class="product-name"></h3></div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"><br /></div>
                    
                    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 price-gray">판매가 : </div>
                    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-4 col-md-offset-4 col-lg-offset-4 price-gray product-price align-right">원</div>
                    
                    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">합계 : </div>
                    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-4 col-sm-offset-0 col-md-offset-4 col-lg-offset-4 total-price align-right">16000원</div>
     
            </div>
            <div class="col-xs-7 col-sm-7 col-md-7 col-lg-2 col-xs-offset-3 col-sm-offset-3 col-md-offset-3 col-lg-offset-0 button-group top-margin bottom-margin"><!--버튼칸-->
                    <div class="col-xs-5 col-sm-5 col-md-5 col-lg-8">
                        <input type="number" class="form-control product-number" value=1 min=1 >
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-4">
                        <button class="btn btn-default update-btn">수정하기</button>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-4 col-xs-offset-5 col-sm-offset-5 col-md-offset-5 col-lg-offset-8">
                        <button class="btn btn-default delete-btn">삭제하기</button>
                    </div>
            </div>
            <hr class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        </div>
        </div>
    	<!-- 얘는 추가하게될 틀이다 -->
   
    </div>
    </div>
       
    
    
    <!--상품리스트에 대한 스크립트!!!!-->
    <script>
    	//상품갯수 수정하면 갯수와 총가격이 변하는 함수                  
       	$('.product-each .product-number').change(function(){         		
       		var sum =0;
       		for(var i = 0 ; i < $('.product-each .product-name').length; i++){
       			$('.product-each .total-price').eq(i).text(  parseInt($('.product-each .product-price').eq(i).text()) * $('.product-each .product-number').eq(i).val()  +"원");
          		
      			$('.product-each1 .outputName').eq(i).text( $('.product-each .product-name').eq(i).text()  );
       			$('.product-each1 .outputPrice').eq(i).text( $('.product-each .total-price').eq(i).text()  );  
           			
       			//최종합계를 밑으로 보낸다
       			sum += parseInt($('.product-each1 .outputPrice').eq(i).text());           			
       		}       
       		$('#finalPrice').text(sum+"원");   
           		
				
      	});
    	//수정하기 버튼을 누르면 수정된 상품갯수가 DB에 저장된다
    	$('.update-btn').click(function(){
    		var product_num= $(this).parent().parent().parent().find('.productNum').val();
    		var quantity = $(this).parent().siblings().find('.product-number').val();
    		console.log('업데이트 버튼을 눌렀다');
    		
    		$.ajax({
    			url: "update.bk",
    			type: "GET",
    			data: {
    				pNum: product_num,
    				pQuantity: quantity    					
    			},   				
    			success: function(){
    				console.log('update성공');
    			},error: function(){
    				console.log('update실패');
    			}
    		});
    			 
    	});

        //삭제하기 버튼을 누르면 상품이 사라지는 함수. DB에서도 DELETE를 시킨다
        $('.delete-btn').click(function(){
        	
        	if(confirm('선택한 물품을 장바구니에서 삭제하시겠습니까?')){
           		console.log("삭제해!");
           		//var thisPrice = $(this).parents('.product-each').children().children().children().children().children('.total-price');
               	//console.log(thisPrice.text());            	
               	
               	var $oName = $(this).parent().parent().siblings().find('.product-name').text();
               	console.log("상품이름 : "+$oName);   
               	
               	//티라미슈, 휘낭시에, 당근케이크, 초콜릿 케이크
               	//바로지우지 않고 willRemove라는 성질을 준것은
               	//버튼이 속한 칸을 지우는것 뿐만 아니라 아래쪽의 가격표시줄의 정보도 함께 지우기 위해서다
               
               	
               	$(this).parents('.product-each').attr("willRemove","y");            	
               	var productEach = $('.product-each');
               	var productEach1 = $('.product-each1');            	            	
               	var sum = 0;
               	
               	for(var i = 0 ; i < productEach.length; i++){
                   	if(productEach.eq(i).attr("willRemove") == "y"){
                   		productEach.eq(i).remove();
               			productEach1.eq(i).remove();
               		}
               	}               	
               	
               	var outputPrice = $('.product-each1 .outputPrice');
               	for(var i = 0; i< outputPrice.length; i++){
               		sum += parseInt(outputPrice.eq(i).text());
               	}         	
               	
               	console.log(sum);            
               	$('#finalPrice').text(sum+"원");   
               	
               	var product_num= $(this).parent().parent().parent().find('.productNum').val();
        		//var quantity = $(this).parent().siblings().find('.product-number').val();            	
               	
               	$.ajax({
               		url: "delete.bk",
               		type: "GET",
               		data:{pNum: product_num},
               		success: function(){console.log("delete성공");},
               		error: function(){console.log("delete실패");}
               		});
               	
               
           	}else{
           		console.log("노삭제!");
           	}
        	
        	
           	
           	
        });
    	    </script>
   
    <!-- 옵션상품 -->
    <div class="container">
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-xs-offset-0 col-sm-offset-0 col-md-offset-1 col-lg-offset-1 top-margin">
        <h4><b class="col-xs-3 col-sm-3 col-md-3 col-lg-3 ">추가선물</b><small class="col-xs-1 col-sm-1 col-md-1 col-lg-1 col-sm-offset-8 col-md-offset-8 col-lg-offset-8 ">more</small></h4> <!--한글로 더보기를 쓰고싶었는데.. col-1에 한줄로 들어가지 않는다..-->
        <hr class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        
        <%for(int i =0; i< 4; i++){ %>
        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 option-product right-border"><!--옵션상품 한칸-->
        	<input type="hidden" name="option-productNum" class="option-productNum" value="<%=oList.get(i).getProduct_num()%>"/>           
           <div class="col-xs-12 col-sm-12 col-md-4 col-lg-5 col-md-offset-0"><!--사진이 들어갈 공간-->               
               <img src="<%=request.getContextPath() %>/resources/images/product/<%=oList.get(i).getImage() %>" alt="티라미슈" name="picture" class="img-responsive option-image">
           		<input type="hidden" class="opImg" value="<%=oList.get(i).getImage() %>"/>
            </div>            
            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-7 "> <!--설명이 들어갈 공간-->
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <span class="label label-primary dis-inlineblock">당일배송</span>
                    <span class="label label-success dis-inlineblock">택배배송</span>
                    <h4><b class="option-name"><%=oList.get(i).getProduct_name() %></b></h4>
                </div>
                <div class="col-lg-12 visible-lg"><br></div><!--lg사이즈일 때만 <br>을 적용한다-->
                <br>
                <h4 class="col-xs-8 col-sm-8 col-md-7 col-lg-7 dis-inlineblock option-price"><%=oList.get(i).getProduct_price() %>원</h4>
                 
                <button class="col-xs-8 col-sm-4 col-md-5 col-lg-5 btn btn-default dis-inlineblock addBasket">장바구니</button>
            </div>            
        </div>
        <%} %>
                
    </div>
    </div>
    
    
    <div class="container">
    <div class="col-md-10 col-md-offset-1 col-xs-12 top-margin"><!--최종 주문 버튼과 배송지 안내 구문-->
        <div class="col-md-6 col-xs-12 top-margin"><!--배송지 안내 구문-->
            <b>배송비 안내</b>
            <hr><br>
            <mark>결제시 배송지 주소를 입력하시면 요금이 자동추가됩니다.</mark><br><br>

            <mark>서울 전지역 무료</mark><br><br>

            <mark>1만원 추가지역</mark><br>
           	 구리 / 하남 / 성남 / 과천 / 의왕 / 군포 / 안양 / 광명 / 부천<br><br>

            <mark>2만원 추가지역</mark><br>
           	김포 / 고양 / 파주 / 양주 / 광주 / 용인 / 수원 / 오산 / 화성 / 안산 / 시흥 / 인천 / 남양주 / 의정부<br>
        </div>
        
        <div class="col-md-6 col-xs-12 top-margin"><!--최종 결제 부분-->
                
            <b>결제정보</b>
            <hr>
            <!-- 복사할 아이 -->
            <div style="display: none">
               	<div name="downProduct">
                    <div class="col-md-6 col-xs-6 price-gray outputName">이건</div>
                    <div class="col-md-6 col-xs-6 price-gray align-right outputPrice">이건</div>
                </div> 
            </div>
            <!-- 복사할 아이 -->
            
            <div class="col-md-12 col-xs-12" id="inputTo">
                <%for(int i = 0; i< list.size(); i++){ %>
                <div class="product-each1">
                    <div class="col-md-6 col-xs-6 price-gray outputName"><%=list.get(i).getProduct_name()%></div>
                    <div class="col-md-6 col-xs-6 price-gray align-right outputPrice"><%=list.get(i).getProduct_price() * list.get(i).getQuantity()%>원</div>
                </div> 
                <%} %>
                
            </div>
           			<div class="col-md-6 col-xs-6"><h3>총합계</h3></div>
                    <div class="col-md-6 col-xs-6 align-right"><h3><b id="finalPrice">원</b></h3></div>
              
              <script>
              	$(function(){
              		
              		var sumPrice = 0;
              		for(var i = 0 ; i< $('.product-each1').length; i++){
              			sumPrice += parseInt($('.product-each1 .outputPrice').eq(i).text());
              		}
              		$('#finalPrice').text(sumPrice+"원");
              	});
              </script>
                    
             
            	<form action="<%=request.getContextPath() %>/basketPay.bk" method="post">            		
            	<button class="col-md-12 col-xs-12 btn btn-primary btn-lg buy-btn" id="pay" type="submit">결제하기</button>
       			</form>     			     
         </div>
    </div>
</div>
	
    <script>
    $('.addBasket').on('click',function(){  
    	var duplication = true;
    	var productName = $(this).siblings().find('.option-name').text();  
    	var $form = $('[name=addProduct]');   						
    	var $downProduct = $('[name=downProduct]');
    	
    	//중복된 이름이 있는지 확인한다
    	for(var i = 0 ;i <$('.product-each').length;i++){
    		if(productName == $('.product-each .product-name').eq(i).text()){
    			duplication = false; 			
    			
    			console.log('중복되었다');
    			console.log('갯수는?: '+$('.product-each .product-number').eq(i).val());
    			$('.product-each .product-number').eq(i).val( parseInt($('.product-each .product-number').eq(i).val()) + 1);    			   			
    			
    			var product_num= $('.product-each .productNum').eq(i).val();
        		var quantity = $('.product-each .product-number').eq(i).val();
        		   			
        		 $.ajax({
        			url: "update.bk",
        			type: "GET",
        			data: {
        				pNum: product_num,
        				pQuantity: quantity    					
        			},   				
        			success: function(){
        				console.log('update성공');
        			},error: function(){
        				console.log('update실패');
        			}
        		});
    		}
    	}
    	
   		if($('.optionPlus').length < 5){    	
    		for(var i = 0; i <$('.option-product').length; i++){   
    			if(productName == $('.option-product .option-name').eq(i).text() && duplication == true){   
    				var $newForm = $form.clone(true, true);
    	   			$newForm.attr('name',productName);
    	   			$newForm.addClass('product-each');
    	    								
    				var $img = $newForm.children().find('.product-img');
    				var $valImg = $newForm.children().find('.product-image');
    				var $name = $newForm.children().find('.product-name');
    				var $price = $newForm.children().find('.product-price');
    				var $quantity = $newForm.children().find('.product-number');
    				var imgSrc = "<%=request.getContextPath()%>/resources/images/product/";
    				var $productNum = $newForm.children('.productNum');
    			
    				/* $('.option-product .option-image').eq(i).attr('src'); */
    				$img.attr('src',$('.option-product .option-image').eq(i).attr('src'));
    				$valImg.val($('.option-product .opImg').eq(i).val());
    				$name.text($('.option-product .option-name').eq(i).text());
    				$price.text($('.option-product .option-price').eq(i).text());
    				$quantity.val(1);
    				$productNum.val($('.option-product .option-productNum').eq(i).val());
    				
    				console.log('상품코드 : '+$('.option-product .option-productNum').eq(i).val());
    			
    				
    				
    				var $newDownProduct = $downProduct.clone(true, true);
    				$newDownProduct.attr('name', productName);
    				$newDownProduct.addClass('product-each1');
    									
    				var $downName = $newDownProduct.children('.outputName');
    				var $downPrice = $newDownProduct.children('.outputPrice');    									
    									    									
    				$downName.text($('.option-product .option-name').eq(i).text());
    				$downPrice.text($('.option-product .option-price').eq(i).text());    			    				
    			
    				$('#finalPrice').text(  parseInt($('#finalPrice').text()) + parseInt($downPrice.text())+"원" );
    				}		
    			}
    		} 
   				$('#frame').append($newForm);
				$('#inputTo').append($newDownProduct); 
   
    		
    			var productNumArr = new Array();
    			var productQuantityArr = new Array();
	    		for(var i = 0; i< $('.productNum').length; i++){
	    			productNumArr.push($('.product-each .productNum').eq(i).val());
	    			productQuantityArr.push( $('.product-each .product-number').eq(i).val()  );
	    		}
				
				console.log(productNumArr);
    			console.log(productQuantityArr);
    
				//여기에 ajax로 insert를 구현하자!+
				jQuery.ajaxSettings.traditional = true;
    			$.ajax({
        			url: "optionInsert.bk",
        			type: "GET",
        			data: {
        				length : '<%=length%>',
        				productNum : productNumArr,
        				quantity :productQuantityArr
        				},
        			success: function(data){	
        				console.log('INSERT에 성공하였다!'+data);
        			
       				 },error: function(data){
       				 
       				 }
       			 }); 
    			
  	  });    
    	//[START] HONG
	    	/* $(function(){
	    		// [1] State 값 확인,
	    		// [2] 그냥 db 접속,
	    	}); */
    	//[END] HONG
    
    </script>
       
    
    <%@include file="/views/common/footer.jsp" %>    
    </body>
</html>