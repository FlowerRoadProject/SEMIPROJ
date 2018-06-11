<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fr.jsp.board.model.vo.*"%>
<%
	NoticeBoard notice = (NoticeBoard)request.getAttribute("notice");
	

%>   
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
	<title>공지사항 수정하기</title>
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet">
	<link href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
	<link href="<%=request.getContextPath()%>/resources/css/notice/editor.css" type="text/css" rel="stylesheet"/>
	<script src="<%=request.getContextPath()%>/resources/js/notice/editor.js"></script>

<style>
.navbar-bottom-font {
	font-weight: bold;
}
	@media (max-width: 768px) {
		#no1,
        #no2 {
        	width: 750px;
        }
.container {
	width: 750px;
}
        }

footer ul li {
      display: inline;
    }
    .navbar-default {
      background-color: rgba(255, 254, 254, 0.9);
    }
    .test-border{
    	border: 1px solid black;
    }
    .category{
    	background: lightgray;
    	padding-top:0.47em;
    }
    .column{
    	height: 2.4em;
    	text-align: center;
    	vertical-align: middle;    	
    }
    .inputDate div{
    	border-bottom: 1px solid gray;
    }
    .btnGroup{
    	margin-top: 2em;
    }
    .left-margin{
    	margin-left: 1em;
    }
</style>

</head>
<body>
	
	<br>
    <div class="visible-md">md</div>
    <div class="visible-sm">sm</div>
    <nav class="navbar navbar-default navbar-fixed-top" id="naaaaav">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header col-xs-2 col-sm-2 col-md-2 col-lg-2">
                <a href="#" id="favorite">
                    <img src="<%=request.getContextPath() %>/resources/images/favorite.png" width="75px" height="75px">
                </a>
            </div>
            <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8"  style="text-align:center; display:inline-block;">
                <div id="no1">
                    <img src="<%=request.getContextPath() %>/resources/images/main_2/fr2_대안2.jpg" style="width:300px; height:100px">
                </div>
                <div style="text-align:center; display:inline-block;" id="no2" class="col-sm-12 col-xs-12 col-lg-12 col-md-12">

                    <ul class="nav navbar-nav navbar-bottom-font col-sm-12 col-xs-12 col-lg-12 col-md-12">
                        <li class="col-sm-2 col-xs-2 col-sm-offset-1 col-xs-offset-1">
                            <a href="#">꽃다발</a>
                        </li>
                        <li class="col-sm-2 col-xs-2">
                            <a href="#">꽃바구니</a>
                        </li>
                        <li class="col-sm-2 col-xs-2">
                            <a href="#">플랜트</a>
                        </li>
                        <li class="col-sm-2 col-xs-2">
                            <a href="#">디저트</a>
                        </li>
                        <li class="col-sm-2 col-xs-2">
                            <a href="#">카테고리</a>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                <div class="collapse navbar-collapse">
                   
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <a href="#">로그인</a>
                            </li>
                            <li>
                                <a href="#">회원가입</a>
                            </li>
                            <li>
                                <a href="#">장바구니</a>
                            </li>
                        </ul>
                    
                    <br><br><br><br>
                        <form class="navbar-form navbar-right" role="search" style="width:310px">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="검색">
                                <button type="submit" class="btn btn-default">검색</button>
                            </div>
                        </form>
                  
                </div>

            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
<!-- header -->
	
	<br />	<br />	<br />	<br />	<br />	<br />	<br />	<br />	<br />	<br />	<br />	<br />
	
	
	<div class="container">
		<div class="col-lg-12"><!-- 제목부분 -->
			<div class="col-lg-2 column category">
				<label for="title">제 목</label>    			
    		</div>
    		<div class="col-lg-10 column realInput">
    			<input type="text" class="form-control" id="title" placeholder="제목" value="<%=notice.getbTitle()%>">
    		</div>
		</div>
		<div class="col-lg-12 inputDate"><!-- 등록일과 조회수 -->
			<div class="col-lg-2 column category">등록일</div>
			<div class="col-lg-4 column category" style="background:white"><%=notice.getSubmitDate()%></div>
			<div class="col-lg-2 column category">조회수</div>
			<div class="col-lg-4 column category" style="background:white"><%=notice.getViewNum()%></div>
		</div>
		
		<div class="col-lg-12">
			<textarea id="txtEditor"></textarea>
		</div>
	</div>
	
	<div class="container">
		<div class="col-lg-12">
			<div class="col-lg-12 btnGroup" align="center">			
				
				<form action="<%=request.getContextPath()%>/update.no" method="get">
				<input type="hidden" name="bNum" value="<%=notice.getbNum() %>" id="bNum"/>
				<input type="hidden" name="bContent" value="" id="bContent"/>
				<input type="hidden" name="bTitle" value="" id="bTitle"/>
				<div class="col-lg-4"></div>
				<button class="btn btn-primary col-lg-1" id="go">수정하기</button>
				</form>
				
				<form action="<%=request.getContextPath()%>/delete.no">
					<input type="hidden" name="deletebNum" value="<%=notice.getbNum() %>"/>
					<button class="btn btn-danger col-lg-1 left-margin" id="delete">삭제하기</button>				
				</form>		
				<button class="btn btn-warning col-lg-1 left-margin" id="reset">돌아가기</button>
				
			</div>
		</div>
		
	</div>
	
	<div class="col-lg-12" id="example" style="display:none">
		<%=notice.getbContent() %>
	</div>
		
	<script type="text/javascript">
		$(document).ready( function() {
			$("#txtEditor").Editor();
		});
		
		$(function(){
			$('#menuBarDiv_txtEditor > div:nth-child(6) > a:nth-child(3)').remove();
			//이미지는 제거한다..			
			console.log($("#example").html());
			var text = $("#example").html();
			$('.Editor-editor').html($("#example").html());
		})		
		
		$('#go').click(function(){			
			console.log($('.Editor-editor').html());			
			$('#bContent').val( $('.Editor-editor').html() );
			$('#bTitle').val( $('#title').val() );
			$('#go').submit();
		});
		
		
		
		
		
		
		
		
	</script>
	
<!-- footer -->	
	<footer class="col-lg-12">
            <div class="footprint">
              <hr>
              <div class="footALink">
                <div class="col-sm-3 col-md-3 col-lg-4"></div>
                <div class="col-sm-6 col-md-6 col-lg-5">
                  <ul>
                    <li>
                      <a href="#" style="color:black;">회사 소개</a>
                    </li>&nbsp;&nbsp;&nbsp;
                    <li>
                      <a href="#" style="color:black;">이용 약관</a>
                    </li>&nbsp;&nbsp;&nbsp;
                    <li>
                      <a href="#" style="color:black;">오시는길</a>
                    </li>&nbsp;&nbsp;&nbsp;
                    <li>
                      <a href="#" style="color:black;">FAQ</a>
                    </li>&nbsp;&nbsp;&nbsp;
                    <li>
                      <a href="#" style="color:black;">공지사항</a>
                    </li>&nbsp;&nbsp;&nbsp;
                  </ul>
                </div>
                <div class="col-sm-3 col-md-3 col-lg-3"></div>
              </div>
              <hr>
              <br>
              <br>
              <div class="footInfo">
                <div class="col-sm-3 col-md-3 col-lg-2"></div>
                <div class="col-sm-6 col-md-6 col-lg-8">
                  <p class="text-muted">
                    법인명 : (주)원제플라워 | 대표이사 : 이원제 사업장 소재지 : 서울시 강남구 역삼동 KH정보교육원 사업자등록번호 : 아직없음 | 사업자정보확인 | 통신판매업신고 : 제2013-서울서초-0521호 | 개인정보보호책임자
                    : 이원제 고객센터 : 02-2222-2222 | 팩스 : 02-2222-2222 | E-mail : help@cultwo-flower.com | Hosting by (주)코리아센터닷컴
                  </p>
                  <div>
                    <a href="#" onclick="javascript:window.open('https://twitter.com/intent/tweet?text=[%EA%B3%B5%EC%9C%A0]%20' +encodeURIComponent(document.URL)+'%20-%20'+encodeURIComponent(document.title), 'twittersharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;"
                      target="_blank">
                      <img style="width:50px; height: 50px" src="<%=request.getContextPath() %>/resources/images/twitter.png" alt="Share on Twitter">트위터버튼</a>
                    <a href="#" onclick="javascript:window.open('https://www.facebook.com/sharer/sharer.php?u=' +encodeURIComponent(document.URL)+'&t='+encodeURIComponent(document.title), 'facebooksharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;"
                      target="_blank">
                      <img style="width:50px; height: 50px" src="<%=request.getContextPath() %>/resources/images/facebook.png" alt="Share on Facebook">페이스북버튼</a>
                    <a href="#" onclick="javascript:window.open('https://plus.google.com/share?url=' +encodeURIComponent(document.URL), 'googleplussharedialog','menubar=no,toolbar=no,resizable=yes, scrollbars=yes,height=350,width=600');return false;"
                      target="_blank">
                      <img style="width:50px; height: 50px" src="<%=request.getContextPath() %>/resources/images/googlePlus.png" alt="Share on Google+">구글플러스버튼</a>
                    <a href="#" onclick="javascript:window.open('https://story.kakao.com/s/share?url=' +encodeURIComponent(document.URL), 'kakaostorysharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes, height=400,width=600');return false;"
                      target="_blank">
                      <img style="width:50px; height: 50px" src="<%=request.getContextPath() %>/resources/images/kakaoStory.jpg" alt="Share on kakaostory">카카오스토리버튼</a>
                    <a href="#" onclick="javascript:window.open('http://share.naver.com/web/shareView.nhn?url=' +encodeURIComponent(document.URL)+'&title='+encodeURIComponent(document.title), 'naversharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;"
                      target="_blank">
                      <img style="width:50px; height: 50px" src="<%=request.getContextPath() %>/resources/images/naver.jpg" alt="Share on Naver">네이버버튼</a>
                  </div>
                </div>
                <div class="col-sm-3 col-md-3 col-lg-2"></div>
              </div>
            </div>
          </footer>
   
	
</body>
</html>