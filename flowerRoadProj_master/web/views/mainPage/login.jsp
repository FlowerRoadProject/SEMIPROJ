<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%
	String msg = (String)request.getAttribute("msg");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<head>
<title>로그인</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="477566022295-va6h7acae97e1sfavcdnbrfcii3g7r8s.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <%@include file = "/views/common/header.jsp" %>
<style>

        .login {
            background-color: lightpink;
        }


        #SignUp {
            background-color: orange;
        }

        #find {
            text-align: center;
        }
        #Contents {
	width: 30%;
	margin: auto;
	padding: auto;
}
        </style>
<script>

$(document).ready(function() {
var msg = "<%=msg%>";
if(msg != "null"){
	alert(msg);	
}

$("input[name=userPwd]").keydown(function (key) {
	 
    if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
    	login();
    }

});

});
//페이스북 스크립트
  var facebookClicked=false;
  function statusChangeCallback(response) {
    
    if(facebookClicked){
	    if (response.status === 'connected') {
	      //console.log('statusChangeCallback');
	    //console.log(response);
	    //console.log(response.authResponse.userID);//id 찾음!
	    location.href="<%=request.getContextPath()%>/snsLoginservlet.me?memberNum=facebook"+response.authResponse.userID;
	   
	    } else {
	    
	    }
    }
  }

  function checkLoginState() {
	  facebookClicked=true;
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }

  window.fbAsyncInit = function() {
    FB.init({
      appId      : '183432759043224',
      cookie     : true,  // enable cookies to allow the server to access 
                          // the session
      xfbml      : true,  // parse social plugins on this page
      version    : 'v2.8' // use graph api version 2.8
    });


    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });

  };

  // Load the SDK asynchronously
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "https://connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

</script>
</head>
<body>


<br /><br /><br /><br />
<div id="Contents">
		<h2 class="header" style="text-align: center">로그인</h2>
		<form id="loginForm" class="form-Member"
			action="<%=request.getContextPath()%>/login.me" method="post">
			<div class="form-group">
				<input type="text" class="form-control" name="userId" id="userId"
					placeholder="아이디">
			</div>
			<div class="form-group">
				<input type="password" class="form-control" name="userPwd"
					id="userPwd" placeholder="비밀번호">
			</div>
			<div class="form-group">
				<table class="form-group" style="width: 100%">
					<tr style="width: 100%">
						<td style="align: left;"><a
							href="<%=request.getContextPath()%>/views/mainPage/findUser.jsp">아이디
								찾기<span class="txt_bar">ㅣ</span> 비밀번호
								찾기</a></td>

						<td style="float: right;"><a href="<%=request.getContextPath()%>/views/mainPage/signUp.jsp">회원가입
						</a></td>
					</tr>
				</table>
			</div>
			<div class="form-group" style="text-align : center">
				<button type="button" class="btn btn-warning" onclick='login();' style="font-size:30px">회원로그인</button><br><br>
				<div class="form-group" >
                    <a id="kakao-login-btn"></a>
                </div>
                <div class="form-group" >
                    <div class="fb-login-button" 
                    data-max-rows="1" data-size="large" data-button-type="login_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="true" onlogin="checkLoginState();"></div>
                </div>
                <div class="form-group">
                    <div id="naverIdLogin"></div>
                </div>
                <div style="text-align : center">
				<div class="form-group col-sm-3 col-md-3 col-lg-3 col-sm-offset-3 col-md-offset-3 col-lg-offset-3" >
					<div class="g-signin2" onclick="GoogleLogin()"
						data-width="220" data-height="50" data-onsuccess="onSignIn"
						data-theme="dark"></div>
				</div>
				</div>
			</div>
		</form>
          
           
       
    </div>
    
  <br><br><br>
<%@include file = "/views/common/footer.jsp" %>
<script type='text/javascript'>
function login(){
	if ($("#userId").val() == "") {
		alert("아이디를 꼭 입력하세요!");
        $("#userId").focus();
    }else if($("#userPwd").val() == "") {
		alert("비밀번호를 꼭 입력하세요!");
        $("#userPwd").focus();
    }else{
		$('#loginForm').submit();
    }
}
$('#signUp').click(function(){
	location.href="<%=request.getContextPath()%>/views/mainPage/signUp.jsp";
});
//카카오 스크립트
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('ffe240f1f5d43606e139b9ca607a0597');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
        var auth = JSON.stringify(authObj);
        //console.log(auth);
        Kakao.API.request({
            url: '/v1/user/me',
            success: function(res) {
            	//console.log(JSON.stringify(res));
              //console.log(JSON.stringify(res.kaccount_email));
              //console.log(JSON.stringify(res.id));
              //console.log(JSON.stringify(res.properties.profile_image));
              //console.log(JSON.stringify(res.properties.nickname));
              location.href="<%=request.getContextPath()%>/snsLoginservlet.me?memberNum=kakao"+JSON.stringify(res.id);
            },
            fail: function(error) {
              alert(JSON.stringify(error));
            }
          });
      },
      fail: function(err) {
         alert(JSON.stringify(err));
      }
    });
  //]]>
//카카오 스크립트
  
  //네이버 스크립트
  var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "ctuF5pktgpuwbay7zj12",
				callbackUrl: "http://" + window.location.hostname + ((location.port==""||location.port==undefined)?"":":" + location.port) + "<%=request.getContextPath()%>/navercall.jsp",
				isPopup: false,
				loginButton: {color: "green", type: 3, height: 50}
			}
		);
		/* (4) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
		naverLogin.init();
		
		

	//구글 스크립트
var googleClicked=false;//Global Variable
function GoogleLogin()
{
	googleClicked=true;
}
function onSignIn(googleUser) {
    if (googleClicked) {
    	// Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
    	
        //console.log("ID: " + profile.getId()); // Don't send this directly to your server!
   
        //console.log("Email: " + profile.getEmail());

        location.href="<%=request.getContextPath()%>/snsLoginservlet.me?memberNum=google"+profile.getId();
      };
    }
	   
		
</script>
</body>
</html>