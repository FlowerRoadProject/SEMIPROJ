<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

    
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 
	
  <style>
   @media (max-width: 900px){ 
                .container{
                    width: 890px;
                }
            }
  	footer ul li {
      display: inline;      
      height: 2em;
      font-size: 1.2em;
      border-right: 1px solid black;
      border-left: 1px solid black;
      text-align: center;
      padding-top: 0.3em;
    }
    .navbar-default {
      background-color: rgba(255, 254, 254, 0.9);
    }
    .test-border{
    	border: 1px solid black;
    }
    p{
    	text-align: center;
    }
    .highlight{
    	font-weight:700;
    }
       
    </style>  
        <footer>
            <div class="footprint">
              <hr>
              <div class="footALink">
                
                <div class="container col-xs-10 col-sm-10 col-md-10 col-lg-8 col-xs-offset-1 col-sm-offset-1 col-md-offset-1 col-lg-offset-2">
                  <ul class="col-lg-12 footList">
                    <li class="col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xs-offset-0 col-sm-offset-0 col-md-offset-1 col-lg-offset-1" style="border-left:2px solid black;">
                     	 회사 소개
                    </li>
                    <li class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                      	이용 약관
                    </li>
                    <li class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                      	오시는길
                    </li>
                    <li class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                    	FAQ
                    </li>
                    <li class="col-xs-2 col-sm-2 col-md-2 col-lg-2" style="border-right:2px solid black;">
                     	 공지사항
                    </li>
                  </ul>
                </div>
                
                <script>
                	
                $(function(){
                	console.log( $('.footList li:first-child').text());
                	
                })
               $('.footList li').hover(function(){
               		$(this).css({
               			'background':'lightcoral',
               			'color':'white',
               			'cursor': 'pointer'               			
               			})               		
               	},function(){
               		$(this).css({
               			'background':'white',
               			'color':'black'
               			});
               	})
               	$('.footList li').eq(0).click(function(){
               		/* location.href= ''; */
               	});
                $('.footList li').eq(1).click(function(){
               		/* location.href= ''; */
               	});
                $('.footList li').eq(2).click(function(){
               		/* location.href= ''; */
               	});
                $('.footList li').eq(3).click(function(){
               		location.href= '<%=request.getContextPath()%>/show.faq';
               	});
                $('.footList li').eq(4).click(function(){
               		location.href= '<%=request.getContextPath()%>/showNotice.no';
               	});
               		
                
                </script>
                
              </div>
              
              <hr>
              
              <br>
              <br>
              <div class="footInfo">
               
                <div class="col-sm-12 col-md-12 col-lg-12">
                   	<p class="col-lg-12">법인명 : (주)원제플라워  | 대표이사 :  이원제  | 사업장 소재지 :  서울시 강남구 역삼동 KH정보교육원  | 사업자등록번호 :  아직없음  | 사업자정보확인 </p>
         			<p class="col-lg-12">통신판매업신고 : 제2013-서울서초-0521호  | 개인정보보호책임자 :  이원제 | 고객센터 :  02-2222-2222
                    | 팩스 : 02-2222-2222| E-mail :  help@cultwo-flower.com</p>
                    <p class="col-lg-12">Hosting by (주)코리아센터닷컴</p>
                </div>
                <div class="col-sm-3 col-md-3 col-lg-2"></div>
              </div>
            </div>
          </footer>
   
