<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fr.jsp.myShoppingBasket.model.vo.Basket, java.util.*, com.fr.jsp.member.model.vo.Member"%>
    
<% 
ArrayList<Basket> list = (ArrayList<Basket>)request.getAttribute("pList");

Member member = (Member)request.getAttribute("member");

%>   
 
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <head>
        <title>주문 및 결제페이지</title>
        <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap.css">
        <script src="<%=request.getContextPath() %>/resources/js/jquery-1.12.2.js"></script>
        <script src="<%=request.getContextPath() %>/resources/js/bootstrap.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css">
        
        
		 <!--부트스트랩 셀렉트피커-->
        <script src="<%=request.getContextPath() %>/resources/js/myShoppingBasket/bootstrap-select.js"></script>
        <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/myShoppingBasket/bootstrap-select.min.css">
        

        <!--우편번호찾기-->        
        <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
        <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
        
        <!-- 아임포트 라이브러리 -->
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<		<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
        
        
        
        
        
        <script>
            //load함수를 이용하여 core스크립트의 로딩이 완료된 후, 우편번호 서비스를 실행합니다.
            function sample6_execDaumPostcode() {
                                
                new daum.Postcode({                      
                    oncomplete: function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
        
                        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var fullAddr = ''; // 최종 주소 변수
                        var extraAddr = ''; // 조합형 주소 변수
                        console.log("되긴해?");
                        // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                            fullAddr = data.roadAddress;        
                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
                            fullAddr = data.jibunAddress;
                        }
        
                        // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                        if(data.userSelectedType === 'R'){
                            //법정동명이 있을 경우 추가한다.
                            if(data.bname !== ''){
                                extraAddr += data.bname;
                            }
                            // 건물명이 있을 경우 추가한다.
                            if(data.buildingName !== ''){
                                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                            }
                            // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                            fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                        }
                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        
                        document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                        document.getElementById('sample6_address').value = fullAddr;
                        
                        // 커서를 상세주소 필드로 이동한다.
                        document.getElementById('sample6_address2').focus();
                        var addr = $('#sample6_address').val().substring(3,6)
                        
                        if($('#sample6_address').val().substring(0,2) == "서울"){
                        	$('#dvPrice').text("0원");                        	
                        }else if($('#sample6_address').val().substring(0,2) == "인천"){
                        	$('#dvPrice').text("20000원"); 
                        }else if($('#sample6_address').val().substring(0,2) == "경기"){
                        	if(addr == "구리시" || addr == "하남시" || addr == "성남시" || addr == "과천시" || addr == "의왕시" || addr == "군포시" || 
                        			addr == "안양시" || addr == "광명시" || addr == "부천시"){
                        		$('#dvPrice').text("10000원"); 
                        	}else if(addr == "김포시" || addr == "고양시" || addr == "파주시" || addr == "양주시" || addr == "광주시" ||
                        			addr == "용인시" || addr == "수원시" || addr == "오산시" || addr == "화성시" || addr == "안산시" ||
                        			addr == "시흥시" || addr == "남양주" || addr == "의정부"){
                        		$('#dvPrice').text("20000원"); 
                        	}else{
                        		$('#dvPrice').text("25000원"); 
                        	}
                    	}else{                        	
                    		$('#dvPrice').text("30000원"); 
                        }                      
                        
                        $('#finalPay').text( parseInt($('#totalPrice').text()) + parseInt($('#dvPrice').text()) +"원");
                        
                    }
                }).open();
            }
        </script>
        
        

        
        
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
            .top-margin{
                margin-top: 1.5em;
            }
            .grayFont{
                color: rgb(177, 176, 176); 
            }
            .inlineblock{
                display: inline;
            }
            .red-star{
                color: red;
            }            
            .input-text-yellow{
                background: lightgoldenrodyellow;
            }
            .text-right{
            	text-align:right;
            }
            
            #message{
                border: lightgray 1px solid;
                border-radius: 5%;
                text-align: center;
                align-items: center;
                justify-content: center;
                position: relative;
                height: 18em;
                padding-top: 10%;
                padding-right: 15%;
                padding-left: 15%;
                padding-bottom: 10%;
            }
            .pay-select>button{
                background: gray;
                border: none;
            }
            .align-right{
                text-align: right;
            }
            .selectBtn{
				background: orange;				          
            }
            .pay-select .btn{
            	background: rgb(51, 122, 183);
            	color: white;
            }
          
           
        </style>

    </head>
    <body>
    
    <%@include file="/views/common/header.jsp" %>
    
        <br><br><br><br><br><br><br>
	
		<div><%=request.getAttribute("name") %></div>

        
        <div class="container">
            <div class="col-xs-10 col-xs-offset-1 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 bottom-margin"><!--상단 진행페이지 구문-->
                <span>장바구니</span>&nbsp;&gt;&nbsp; <span><strong>주문/결제</strong></span>&nbsp;&gt;&nbsp; <span>주문완료</span>&nbsp;&gt;&nbsp;                
            </div>
            <div class="col-xs-10 col-xs-offset-1 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1"><!--총 선택 상품나열 칸-->
                <h4><b class="col-xs-3 col-sm-3 col-md-3">주문내용</b></h4>
                <hr class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="background: black;">
                
                <%for(int i = 0; i< list.size(); i++){ %>
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 product-each"> <!--제품 한개-->
                    <div class="col-xs-10 col-sm-10 col-md-10 col-lg-2 top-margin bottom-margin"> <!--사진 칸-->
                        <img src="<%=request.getContextPath() %>/resources/images/product/<%=list.get(i).getImage() %>" class="image img-responsive" alt="">
                    </div>
                    <div class="col-xs-10 col-sm-10 col-md-9 col-lg-8 col-xs-offset-2 col-sm-offset-2 col-md-offset-3 col-lg-offset-0 bottom-margin"><!--정보칸-->
                        
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"><h3><%=list.get(i).getProduct_name()%></h3></div>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"><br /></div>
                            
                            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-4 grayFont">판매가 : </div>
                            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-4 col-lg-offset-3 grayFont text-right"><%=list.get(i).getProduct_price()%>원</div>
                           	<br class="col-xs-12 col-sm-12 col-md-12 col-lg-12"/>
                           
                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-4 grayFont">수량 : </div>
                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-4 col-lg-offset-3 grayFont text-right"><%=list.get(i).getQuantity()%>개</div>                           
                            <div>
                            	<%int totalPrice = list.get(i).getQuantity() * list.get(i).getProduct_price(); %>
                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-4"><b>합계 : </b></div>
                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-4 col-lg-offset-3 text-right"><b class="eachPrice"><%=totalPrice %>원</b></div>
                            </div>
                                                              
                    </div>
                    <hr class="col-xs-12 col-sm-12 col-md-12 col-lg-12">   
                 </div>
                 <%} %>                 
            </div>
        </div>
        <div class="col-md-12 visible-md"><br><br></div>
        
        
        <div class="container">
            <div class="col-xs-10 col-sm-10 col-md-10 col-lg-5 col-xs-offset-1 col-sm-offset-1 col-md-offset-1 col-lg-offset-6">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6"><h3><small>상품총합</small></h3></div>
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right"><h3><small id="payPrice">98000원</small></h3></div>
                    
                    <hr class="col-xs-6 col-sm-12 col-md-12 col-lg-12">     
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6"><h3>총합계</h3></div>
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right"><h3 id="lastPrice">98000원</h3></div>   
                </div>
            </div>
        </div>
        <script>
        	$(function(){
        		console.log($('#anonymity').val());
        		var sum = 0;
        		for(var i = 0 ; i< $('.product-each').length; i++){
        			sum += parseInt($('.eachPrice').eq(i).text());
        			console.log(sum);
        		}
        		$('#payPrice').text(sum+"원");
        		/* $('#lastPrice').text( ((100- parseInt($('#discount').text()))/100)*sum +"원"  ); 
        		console.log($('#lastPrice').text()+"원"); */
				$('#lastPrice').text($('#payPrice').text());
        		$('#totalPrice').text($('#lastPrice').text());
        	});  
        </script>
        
        
        <div class="col-lg-12" style="margin-bottom: 5em;"></div><!--두 공간 사이에 여백을 주기 위해서 넣었다-->
        
        <div class="container">
            <div class="col-xs-10 col-xs-offset-1 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 bottom-margin">
                <h4><b class="col-xs-4 col-sm-4 col-md-3 col-lg-3">배송날짜와 시간</b></h4>
                <hr class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="background: black;">
                <div class="col-xs-10 col-sm-10 col-md-10 col-lg-6 col-sm-offset-1 col-md-offset-2 col-lg-offset-0 bottom-margin">
                    <div class="col-xs-6 col-sm-6 col-md-5 col-lg-6">
                        <div class="input-group date" data-provide="datepicker"><!--날짜선택-->
                            <input type="text" class="form-control" placeholder="날짜선택" id="datepicker"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        <select class="selectpicker" placeholder="시간선택">
                            <option value= "">--시간을 선택해주세요--</option> <!--시간을 비교할수 있는 방법은 없을까?-->
                            <option value="11:00">11:00</option>
                            <option value="11:30">11:30</option>
                            <option value="12:00">12:00</option>
                            <option value="12:30">12:30</option>
                            <option value="13:00">13:00</option>
                            <option value="13:30">13:30</option>
                            <option value="14:00">14:00</option>
                            <option value="14:30">14:30</option>
                            <option value="15:00">15:00</option>
                            <option value="15:30">15:30</option>
                            <option value="16:00">16:00</option>
                            <option value="16:30">16:30</option>
                            <option value="17:00">17:00</option>
                            <option value="17:30">17:30</option>
                            <option value="18:00">18:00</option>
                            <option value="18:30">18:30</option>
                            <option value="19:00">19:00</option>
                            <option value="19:30">19:30</option>
                        </select>                        
                    </div>
                    <div class="col-xs-10 col-sm-10 col-md-8 col-lg-11 col-sm-offset-1 col-md-offset-1 col-lg-offset-1 text-center top-margin">
                        <h3 id="time-result"></h3>
                    </div>
                    <script>
                        $(function(){          	
                        	
                            //console.log($('#datepicker').change());
                            // console.log("datepicker의 val : "+$('#datepicker').val());
                            // console.log("selectpicker의 val : "+$('.selectpicker').val());
                            // console.log("ischanged?"+$('#datepicker').isChanged());
                            $('#time-result').html("날짜와 시간을 선택해주세요");
                            
                        });
                        
                        $('#datepicker').change(function(){
                            if( $('#datepicker').val() != "" && $('.selectpicker').val() != "" ){
                            	
                            	
                            	var date = new Array();
                            	date = $('#datepicker').val().split('-');
                            	var fullDate = date[0]+'년 '+date[1]+'월 '+date[2]+'일'
                            	$('#orderDate').val( $('#datepicker').val()+" "+$('.selectpicker').val());
                            
                            	$('#time-result').html( "<span style='color:blue'>배송날짜</span>"+"<br>"+fullDate+"&nbsp;"+ $('.selectpicker').val());
                            }
                            if( $('#datepicker').val() == "" || $('.selectpicker').val() == "" ){
                                $('#time-result').html("날짜와 시간을 선택해주세요");
                            }
                            
                        });
                        $('.selectpicker').change(function(){
                            if( $('#datepicker').val() != "" || $('.selectpicker').val() != "" ){
                            	
                            	
                            	var date = new Array();
                            	date = $('#datepicker').val().split('-');
                            	var fullDate = date[0]+'년 '+date[1]+'월 '+date[2]+'일'
                            	$('#orderDate').val($('#datepicker').val()+" "+$('.selectpicker').val());
                            
                            $('#time-result').html( "<span style='color:blue'>배송날짜</span>"+"<br>"+fullDate +"&nbsp;"+ $('.selectpicker').val());
                            }
                            if( $('#datepicker').val() == "" || $('.selectpicker').val() == "" ){
                                $('#time-result').html("날짜와 시간을 선택해주세요");
                            }
                        });

                       
                        
                    </script>
                                        
                </div>
                <div class="col-md-12 bottom-margin visible-md"><br><hr class="col-md-12" style="background: black;"><br></div><!--md에서만 구분선을 짓자-->
                <div class="col-sm-12 bottom-margin visible-sm"><br><hr class="col-sm-12" style="background: black;"><br></div><!--sm에서만 구분선을 짓자-->
                
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
                    <ol>
                        <li>
                            <b>날짜선택</b>
                            <br>
                            내일 - 일주일 이내
                        </li>
                        <br><br>
                        <li>
                            <b>시간선택</b>
                            <br>
                            오전 11시 - 오후 7시 30분(지역에 따라 차이가 발생할수 있습니다.)<br>
                            도로사정상 정시도착은 불가합니다.<br>
                            대체로 선택시간 전후 30분내외로 배송됩니다.<br>
                            (최대한 맞춰드리기 위해 배송협력사와 고객지원팀에서 노력하고 있습니다.)<br>
                            눈, 비가 내릴 경우 배차지연으로 도착시간이 다소 많이 지연될 수 있습니다. <br>
                            <br><br>
                            도착시간 지연으로 인한 환불 또는 반품이 불가하오니, <br class="visible-sm">참고하여 주문 부탁드리며<br>
                            중요한 사항이 있을경우 고객센터로 연락주시면 도와드리도록 하겠습니다.
                        </li>
                    </ol>
                </div>

            </div>
            
            
           
                 
                    
        </div>
        <div class="container">
            <div class="col-xs-10 col-xs-offset-1 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 bottom-margin">
                <h4><b class="col-xs-3 col-sm-3 col-md-3">보내는 분</b></h4>
                <hr class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="background: black;">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 bottom-margin">
                    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                        <h4>이름<span class="red-star">*</span></h4>
                    </div>
                    <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
                        <input type="text" class="col-lg-12 form-control input-text-yellow input-text-height1" placeholder="이름을 입력해주세요" aria-describedby="basic-addon1" id="inputName" value="<%=member.getMemberName()%>">
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 bottom-margin">
                    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                        <h4>전화번호<span class="red-star">*</span></h4>
                    </div>
                    <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
                        <input type="text" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 form-control input-text-yellow input-text-height1" placeholder="000-0000-0000" aria-describedby="basic-addon1" id="inputPhone" value="<%=member.getMemberPhone()%>">
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 bottom-margin">
                    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                        <input type="checkbox" id="anonymity" value="Y">&nbsp;&nbsp;<label for="anonymity"><h4>익명발송</h4></label><!--익명발송 hover할경우 설명문구 뜨면 좋겠다-->
                    </div>   
                </div>             
            </div>
        </div>
		<script>
    	$('#anonymity').change(function(){        		
    		if($('#anonymity').prop('checked')==true){
    			console.log('체크됨');
    			console.log($('#anonymity'));
    			$('#anony').val('Y');
    			console.log($('#anony').val());
    		}
    		if($('#anonymity').prop('checked')==false){
    			console.log('체크안됨');
    			console.log($('#anonymity'));
    			$('#anony').val('N');
    			console.log($('#anony').val());
    		}
    	});		
		</script>
        <div class="container">
            <div class="col-xs-10 col-xs-offset-1 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 bottom-margin">
                <h4><b class="col-xs-3 col-sm-3 col-md-3">받는 분</b></h4>
                <hr class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="background: black;">
                
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 bottom-margin"><!--우편번호 찾기-->
                    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                        <button class="btn btn-default inlineblock" onclick="sample6_execDaumPostcode()" >우편번호찾기</button>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <input type="text" class="form-control" id="sample6_postcode" disabled="true" placeholder="우편번호 출력되는 곳">
                    </div>
                </div>
      
                <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5"></div><!--빈공간 채우기용-->
                    
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9 col-sm-offset-3 col-md-offset-3 col-lg-offset-3 bottom-margin">
                        <input type="text" class="form-control" id='sample6_address' disabled="true" placeholder="기본주소">
                    </div>
                    <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9 col-sm-offset-3 col-md-offset-3 col-lg-offset-3 bottom-margin">
                        <input type="text" class="form-control" id="sample6_address2" placeholder="나머지 주소">
                    </div>
                </div>
                
                
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 bottom-margin">
                    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                        <h4>이름<span class="red-star">*</span></h4>
                    </div>
                    <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
                        <input type="text" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 form-control input-text-yellow" id="rInputName" placeholder="이름을 입력해주세요" aria-describedby="basic-addon1">
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 bottom-margin">
                    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                        <h4>전화번호<span class="red-star">*</span></h4>
                    </div>
                    <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
                        <input type="text" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 form-control input-text-yellow" id='rPhone' placeholder="'-'없이 입력해주세요" aria-describedby="basic-addon1">
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 bottom-margin">
                    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                        <h4>배송메모</h4>
                    </div>
                    <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
                        <input type="text" class="col-md-12 col-lg-12 form-control" id="sMemo" placeholder="배송에 관련된 요청사항이 있으면 기입해주세요" aria-describedby="basic-addon1"><br>
                        <span style="color:lightgray">메모는 최대 40자까지 가능합니다.<br>
                           	중요한 행사로 인해 배송시간 또는 특이사항이 있을 경우  <br class="visible-md">반드시 배송메모를 남겨주세요.</span>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 bottom-margin">
                    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                        <h4>메세지카드</h4>
                    </div>
                    <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7 bottom-margin" onchange="radioChange();">
                        
                        <input type="radio" name="message" value="리본" id="message-radio-ribon"><label for="리본">리본</label> <!--리본일때와 메세지카드 일때 입력가능 글자수를 변경한다-->
                        <input type="radio" name="message" value="메세지카드" id="message-radio-card"><label for="메세지카드">메세지카드</label>
                        <br>                 
                        <span style="color:lightgray">리본은 공백포함 30자, <br class="visible-md">메세지카드는 공백포함 110자 입력가능합니다</span>
                       
                    </div>
                    <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7 col-sm-offset-3 col-md-offset-3 col-lg-offset-3" id="message-option" style="display: none;">
                        <textarea name="message" id="message" cols="30" rows="10" maxlength="30" placeholder="이곳에 메세지를 적어주세요"></textarea>
                        <div class="col-lg-9 text-count">
                            <span id="text-count-current"></span>/<span id="text-count-total"></span>
                        </div>
                    </div>
                    
                  
                    
                    
                    <script>
                        function radioChange(){
                            if($('#message-radio-ribon').prop("checked") == true){                                 
                                $('#message-option').css('display','inline-block');                                
                                $('#message').val("");
                                $('#text-count-total').text(30);
                                $('#text-count-current').text(30);
                            }
                            else if($('#message-radio-card').prop("checked") == true){                                 
                                $('#message-option').css('display','inline-block');  
                                $('#message').val("");
                                $('#text-count-total').text(110);
                                $('#text-count-current').text(110);
                            }
                        };
                        
                        $(function(){
                            $('#message').keyup(function(){
                                var inputLength = $('#message').val().length;
                                var textLength = parseInt($('#text-count-total').html())- parseInt(inputLength);   
                                $('#text-count-current').html(textLength);
                            });

                        });



                    
                    </script>

                    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3"></div>
                    <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
                       <span style="color:lightgray">특수문자를 입력하실 경우 메세지 오류가 생길 수 있으니<br class="visible-md"> 결제완료페이지에서 반드시 확인해주세요.</span>
                    </div>
                </div>                             
            </div>
        </div>
        <div class="container">
            <div class="col-xs-10 col-xs-offset-1 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 bottom-margin">
                <h4><b class="col-xs-3 col-sm-3 col-md-3">결제수단</b></h4>
                <hr class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="background: black;">
                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pay-select">                      
                    <button type="button" class="btn btn-default btn-lg bottom-margin col-sm-10 col-md-8 col-lg-10" value="신용카드">신용/체크카드 결제</button><br><br /><br />
                    <button type="button" class="btn btn-default btn-lg bottom-margin col-sm-10 col-md-8 col-lg-10" value="페이팔">페이팔</button><br><br /><br />
                    <button type="button" class="btn btn-default btn-lg bottom-margin col-sm-10 col-md-8 col-lg-10" value="카카오페이">카카오페이</button><br><br /><br />
                </div>
            </div>    
        </div>
         
        <script>       	
        	$(function(){
        		console.log("버튼색깔..: "+$('#payingMe').css('background'));
        	})
        
        
        
        	$('.pay-select .btn').on('click',function(){
        		console.log($(this).val());
        		$('#payMethod').val($(this).val());
        		
        		for(var i =0; i<$('.pay-select .btn').length; i++){
        			if($('.pay-select .btn').eq(i).val() == $('#payMethod').val()){
        				$('.pay-select .btn').eq(i).css({
        					'background': 'orange',
        					'color': 'black',
        					'font-weight': 'bold'
        				});
        			}else{
        				$('.pay-select .btn').eq(i).css({
        					'background':'rgb(51, 122, 183)',
        					'color': 'white',
        					'font-weight': 'light'
        				});
        			}
        		}
        		
        	});        	
        
        </script>
        
        <div class="container">
                <div class="col-xs-10 col-xs-offset-1 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 bottom-margin">
                    <h4><b class="col-xs-3 col-sm-3 col-md-3">결제금액</b></h4>
                    <hr class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="background: black;">                
                    
                    <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 bottom-margin">
                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                            <h4>총합계</h4>                            
                        </div> 
                        <div class="col-xs-9 ol-sm-9 col-md-9 col-lg-9 align-right">
                            <h4 id="totalPrice">98000원</h4>
                        </div>         
                    </div>
                    
                    <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 bottom-margin">
                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                            <h4>쿠폰</h4>
                            <button class="btn btn-success">쿠폰선택하기</button>
                        </div> 
                        <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9 align-right">
                            <h4 style="color:red">여기에 무슨 쿠폰인지 들어가면 좋겠다</h4>
                        </div>                       
                    </div>
                    
                    <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 bottom-margin">
                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                            <h4>배송비</h4>                            
                        </div> 
                        <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9 align-right">
                            <h4 id="dvPrice">0원</h4>
                        </div>         
                    </div>
                    <hr class="col-xs-12 col-sm-12 col-md-8 col-lg-8" style="background:black;">
                    <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 bottom-margin">
                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                            <h3>총금액</h3>                            
                        </div> 
                        <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9 align-right">
                            <h3><b id="finalPay">0원</b></h3>
                        </div>                                 
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    	<form action="<%=request.getContextPath()%>/order.bk" method="POST" id="buy">
                         
                         <%for(int i = 0;i < list.size();i++){ %>
                         	<input type="hidden" name="productNum" class="productNum" value='<%=list.get(i).getProduct_num() %>'/> 
                         	<input type="hidden" name="quantity" class="quantity" value='<%=list.get(i).getQuantity()%>'/> 
                         	<input type="hidden" name="price" class="price" value='<%=list.get(i).getProduct_price()%>'/>
                         	<input type="hidden" name="productName" class="productName" value='<%=list.get(i).getProduct_name()%>' />                          	
                         	<input type="hidden" name="image" class="pImage" value='<%=list.get(i).getImage() %>' />                      	
                         <%} %>
                         <input type="hidden" name="memberNum" value='<%=member.getMemberNum() %>' />
                         <input type="hidden" name="orderDate" id="orderDate" value='' />
                         <input type="hidden" name="receiver" id="receiver" value=''/>
                         <input type="hidden" name="receiveAddress" id="receiveAddress" value=''/>
                         <input type="hidden" name="receivePhone" id="receivePhone" value=''/>
                         <input type="hidden" name="anony" id="anony" value='N'/>
                    	 <input type="hidden" name="deliveryMemo" id="deliveryMemo" value=''/>
                    	 <input type="hidden" name="payMethod" id="payMethod" value=""/>
                    		<button type="button" class="btn btn-primary btn-lg bottom-margin col-sm-8 col-md-6 col-lg-6 col-sm-offset-2 col-md-offset-1 col-lg-offset-1" id="payingMe">결제하기</button><br><br /><br />
                    		<button type="button" class="btn btn-primary btn-lg bottom-margin col-sm-8 col-md-6 col-lg-6 col-sm-offset-2 col-md-offset-1 col-lg-offset-1">취소하기</button><br> <br /><br />
                			
                		</form>
                	</div>
                </div>
        </div>       
        
       <script>
       
       $('#payingMe').on('click',function(){
    	/* 회원가입 후 생성된 가맹점 식별코드를 이용해서 window.IMP 변수를 초기화합니다.
		가맹점 식별코드는 관리자 페이지 로그인 한 뒤 시스템설정 → 내정보에서 확인할 수 있습니다. 
		IMP.init()호출은 최초 1회 이루어져야하며, 페이지 로딩 단계에서 미리 호출해두시면 보다 효율적입니다. */
		$('#receiver').val($('#rInputName').val())//받는이 
		var address = $('#sample6_address').val()+" "+$('#sample6_address2').val();
	
		$('#receiveAddress').val(address);      //받는이 주소
		$('#receivePhone').val( $('#rPhone').val() );//받는이 전번
		$('#deliveryMemo').val($('#sMemo').val());//배송메모
		
		
		if( $('#datepicker').val() == "" || $('.selectpicker').val() == "" ){
			alert('배송예약 시간과 날짜를 선택해주세요');
		}
		else if( $('#sample6_address').val() == "" || $('#sample6_address2').val() == "" || $('#sample6_postcode').val() =="" ){
			alert('주소를 모두 입력해주세요');
		}		
		else if($('#rInputName').val() == ""){
			alert('받는분의 이름을 입력해주세요');
		}	
		else if($('#rPhone').val() == ""){
			alert('받는분의 전화번호를 입력해주세요');
		}
		else if($('#payMethod').val() ==""){
			alert('결제방식을 선택해주세요.');
		}
		else if($('#payMethod').val() != "신용카드"){
			alert('아직은 신용카드결제만 가능합니다..');
		}else{
			
		
		/*
		var IMP = window.IMP; // 생략가능
       	IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
       	
       	IMP.request_pay({
       	    pg : 'inicis', // version 1.1.0부터 지원.
       	    pay_method : 'card',
       	    merchant_uid : 'merchant_' + new Date().getTime(),
       	    name : '주문명:결제테스트',
       	    amount : parseInt($('#finalPay').text()),
       	    buyer_email : 'napolreon2@naver.com',
       	    buyer_name : $('#inputName').val(),
       	    buyer_tel : $('#inputPhone').val(),
       	    buyer_addr : $('#sample6_address').text() +" "+ $('sample6_address2').text(),
       	    buyer_postcode : $('#sample6_postcode').text(),
       	    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
       	}, function(rsp) {
       	    if ( rsp.success ) {
       	        var msg = '결제가 완료되었습니다.';
       	        msg += '고유ID : ' + rsp.imp_uid;
       	        msg += '상점 거래ID : ' + rsp.merchant_uid;
       	        msg += '결제 금액 : ' + rsp.paid_amount;
       	        msg += '카드 승인번호 : ' + rsp.apply_num;        	        
       	        
       	       	console.log('완료되었니?');
       	       	$('#buy').submit();
       	        
       	    } else {
       	        var msg = '결제에 실패하였습니다.';
       	        msg += '에러내용 : ' + rsp.error_msg;
       	       
       	    }alert(msg);
       	    
       	});
       
        */
        
        pNumArr = new Array();
        quanArr = new Array();
        var priceArr = new Array();
        var pNameArr = new Array();
        var imageArr = new Array();
        
       	console.log("orderDate: "+$('#orderDate').val())
        
        for(var i = 0; i<$('.productNum').length;i++){
        	pNumArr.push($('.productNum').eq(i).val()); 
        	quanArr.push($('.quantity').eq(i).val());
        	console.log(pNumArr[i]);
        }
        
       jQuery.ajaxSettings.traditional = true;//ajax로 배열을 넘기려면 이게 필요하다.. 하..ㅠㅠ
       $.ajax({
        	url: "insertOrder.bk",
        	type:"POST",
        	data:{
        		productNum: pNumArr,
        		reservationDate: $("#orderDate").val(),
        		receiver: $("#receiver").val(),
        		receiveAddress: $("#receiveAddress").val(),
        		receivePhone: $("#receivePhone").val(),
        		sendMemo: $("#sMemo").val(),
        		anony: $('#anony').val(),
        		quantity: quanArr
        		
        	},
        	success: function(data){
        		alert('주문에 성공하였습니다!');
        		$('#buy').submit();
        	},error: function(data){
        		alert('주문에 실패하였습니다');
        	}
        });
      
        
		}
       });
       
       </script>
        
        
		
    <%@include file="/views/common/footer.jsp" %>    
    </body>
    <!--부트스트랩 데이트피커-->
        <!-- 부트 스트랩 데이트피커 관련 자료 https://bootstrap-datepicker.readthedocs.io/en/latest/#-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.css">
        <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
        <!-- <script src="/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script> -->
    
    <script type='text/javascript'>
        $(function(){
            $.fn.datepicker.dates['kr'] = {
	        days: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"],
	        daysShort: ["일", "월", "화", "수", "목", "금", "토", "일"],
	        daysMin: ["일", "월", "화", "수", "목", "금", "토", "일"],
	        months: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
	        monthsShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
            };
        }(jQuery));
        </script>
        <script>
        $(function(){
                $('.input-group.date').datepicker({
                    calendarWeeks: false,
                    todayHighlight: true,
                    autoclose: true,
                    format: "yyyy-mm-dd",
                    language: "kr",
                    daysOfWeekDisabled: ['0'], //일요일에 배송을 안할경우 선택을 못하게 할 수 있다   
                    
                    //선택가능한 날짜 지정할 수 있다
                    /* 
                    m : month
                    d: day
                    + : 현재시간으로 부터 후로
                    - : 현재시간으로 부터 전으로
                    
                    */
                    startDate: '0m', // 현재달만 선택가능
                    endDate: '+10d'  //10일 이후 까지만 선택가능                    
                });
            });     
        </script>
        
       
        
         
</html>