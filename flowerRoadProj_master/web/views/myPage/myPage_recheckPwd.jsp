<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
    <head>
        <title>꽃길-회원 재확인</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" href="<%=request.getContextPath() %>/images/title_image.png" type="image/ico" />
         <link rel="stylesheet" href="<%=request.getContextPath() %>/resource/css/bootstrap.min.css">
         <link rel="stylesheet" href="<%=request.getContextPath() %>/resource/css/myInfo.css">
        <script src="<%=request.getContextPath() %>/resource/js/jquery-1.12.2.min.js"></script>
        <script src="<%=request.getContextPath() %>/resource/js/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath() %>/resource/js/myPage.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <style>
            /*네비바 배경색 조정*/
             .navbar-default { background-color: rgba(255, 254, 254,0.9); }
             /*네비바 가운데 정렬*/
            .navbar .navbar-nav {
            display: inline-block;
            float: none;
            }
            .product_img{
            display: block;
            max-width: 100%;
            height: 400px;
            }

            
        </style>
    </head>
    <body>
        <!-- 상단의 nav 바 -->
        <nav class="navbar navbar-fixed-top navbar-default">
            <div class="container-fluid">
                    <div class="col-xs-3">
                      <ul class="nav navbar-nav navbar-left">
                        <li><a href="#">즐겨찾기</a></li>
                        <!-- 즐겨찾기가 가능한가? 주소는 어디로 해야되나-->
                      </ul>
                    </div>
                      <div class="col-xs-6" style="text-align:center; display:inline-block;">
                          <img src="<%=request.getContextPath() %>/resources/images/mainImage2.jpg" style="width:120px; height:80px"alt="">
                      </div>
                    <div class="col-xs-3">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="#">로그인</a></li>
                            <li><a href="#">회원가입</a></li>
                            <li><a href="#">장바구니</a></li>
                            <li><a href="#">고객센터</a></li>
                          </ul>
                    </div>
                  </div>
        </nav>
        <!-- 마이페이지 카테고리  -->
        <br><br><br><br><br><br><br><br><br><br>
        <div class="container-fluid">
            <div class="col-sm-1 col-md-1 col-lg-1"></div>
            <div class="category col-sm-2 col-md-2 col-lg-2" 
                style="font-weight:bold; text-decoration: underline;" id="info" onclick="info();">내 정보</div>
            <div class="category col-sm-2 col-md-2 col-lg-2" id="check" onclick="orderChk();">주문 조회</div>
            <div class="category col-sm-2 col-md-2 col-lg-2" id="favarite" onclick="favorite();">관심 상품</div>
            <div class="category col-sm-2 col-md-2 col-lg-2" id="1on1" onclick="oneToOne();">1:1 문의</div>
            <div class="col-sm-3 col-md-3 col-lg-3"></div> 
        </div>

        <br><br>
        <!-- 비밀번호 재확인 창 -->
        <div class="container-fluid">
                <div class="col-sm-4 col-md-4 col-lg-4"></div>
                <div class="col-sm-4 col-md-4 col-lg-4">
                    <p class="text-center"  style="font-size: 13pt; color:midnightblue;">저희 쇼핑몰에서는 회원님의 소중한 개인정보를 안전하게 보호하고 <br>
                            개인정보 도용으로 인한 피해를 예방하기 위하여 비밀번호를 확인합니다. <br>
                            비밀번호는 타인에게 노출되지 않도록 주의해주세요.</p>
                </div>
                <div class="col-sm-4 col-md-4 col-lg-4"></div>
                
        </div>
        <br><br>
        <div>
                <div class="info">
                    <br><br><br><br>
                        <div class="col-sm-1 col-md-1 col-lg-1"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"><b>아이디</b></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"><p class="text-muted" style="font-weight:bold;">useriddd</p></div>
                        <div class="col-sm-7 col-md-7 col-lg-7"></div>  <br><br><br>
                        
    
                        <div class="col-sm-1 col-md-1 col-lg-1"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"><b>비밀번호</b></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"><input type="password" id="rechkPwd" name="rechkPwd" placeholder="내용을 입력해주세요"></div> 
                        <div class="col-sm-7 col-md-7 col-lg-7"></div>  <br><br><br>
                    <br><br>
                </div>
        </div>
        <!-- 확인 취소 버튼 -->
        <div class="container-fluid">
            <div class="col-sm-4 col-md-4 col-lg-4"></div>
            <div class="col-sm-2 col-md-2 col-lg-2">
                <button class="redBtn" id="rechk" onclick="rechk();"><b>확인</b></button>
            </div>
            
            <div class="col-sm-2 col-md-2 col-lg-2">
                <button class="grayBtn" id="rechkCancel" onclick="rechkCancle();"><b>취소</b></button>
            </div>
            <div class="col-sm-4 col-md-4 col-lg-4"></div>
        </div>
    </body>
</html>