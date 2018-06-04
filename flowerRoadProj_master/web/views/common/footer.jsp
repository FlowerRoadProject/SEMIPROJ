<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

    
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <style>
  	footer ul li {
      display: inline;
    }
    .navbar-default {
      background-color: rgba(255, 254, 254, 0.9);
    }
    .test-border{
    	border: 1px solid black;
    }
    </style>
  
   
        <footer>
            <div class="footprint">
              <hr>
              <div class="footALink">
                <div class="col-sm-3 col-md-3 col-lg-4"></div>
                <div class="col-sm-6 col-md-6 col-lg-5">
                  <ul>
                    <li>
                      <a href="#" style="color:black;">회사 소개</a>&nbsp;&nbsp;&nbsp;
                    </li>
                    <li>
                      <a href="#" style="color:black;">이용 약관</a>&nbsp;&nbsp;&nbsp;
                    </li>
                    <li>
                      <a href="#" style="color:black;">오시는길</a>&nbsp;&nbsp;&nbsp;
                    </li>
                    <li>
                      <a href="#" style="color:black;">FAQ</a>&nbsp;&nbsp;&nbsp;
                    </li>
                    <li>
                      <a href="#" style="color:black;">공지사항</a>&nbsp;&nbsp;&nbsp;
                    </li>
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
                      <img style="width:50px; height: 50px" src="<%=request.getContextPath()%>/resources/images/twitter.png" alt="Share on Twitter">트위터버튼</a>
                    <a href="#" onclick="javascript:window.open('https://www.facebook.com/sharer/sharer.php?u=' +encodeURIComponent(document.URL)+'&t='+encodeURIComponent(document.title), 'facebooksharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;"
                      target="_blank">
                      <img style="width:50px; height: 50px" src="<%=request.getContextPath()%>/resources/images/facebook.png" alt="Share on Facebook">페이스북버튼</a>
                    <a href="#" onclick="javascript:window.open('https://plus.google.com/share?url=' +encodeURIComponent(document.URL), 'googleplussharedialog','menubar=no,toolbar=no,resizable=yes, scrollbars=yes,height=350,width=600');return false;"
                      target="_blank">
                      <img style="width:50px; height: 50px" src="<%=request.getContextPath()%>/resources/images/googlePlus.png" alt="Share on Google+">구글플러스버튼</a>
                    <a href="#" onclick="javascript:window.open('https://story.kakao.com/s/share?url=' +encodeURIComponent(document.URL), 'kakaostorysharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes, height=400,width=600');return false;"
                      target="_blank">
                      <img style="width:50px; height: 50px" src="<%=request.getContextPath()%>/resources/images/kakaoStory.jpg" alt="Share on kakaostory">카카오스토리버튼</a>
                    <a href="#" onclick="javascript:window.open('http://share.naver.com/web/shareView.nhn?url=' +encodeURIComponent(document.URL)+'&title='+encodeURIComponent(document.title), 'naversharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;"
                      target="_blank">
                      <img style="width:50px; height: 50px" src="<%=request.getContextPath()%>/resources/images/naver.jpg" alt="Share on Naver">네이버버튼</a>
                  </div>
                </div>
                <div class="col-sm-3 col-md-3 col-lg-2"></div>
              </div>
            </div>
          </footer>
   
