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
        </style>
<script>

$(document).ready(function() {
var msg = "<%=msg%>";
if(msg != "null"){
	alert(msg);	
}
<<<<<<< HEAD

$("input[name=userPwd]").keydown(function (key) {
	 
    if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
    	login();
    }

});
 

=======
$("input[name=userPwd]").keydown(function (key) {
    
    if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
       login();
    }

});
>>>>>>> branch 'master' of https://github.com/FlowerRoadProject/SEMIPROJ.git
});
//페이스북 스크립트
  // This is called with the results from from FB.getLoginStatus().
  var facebookClicked=false;
  function statusChangeCallback(response) {
    
    // The response object is returned with a status field that lets the
    // app know the current login status of the person.
    // Full docs on the response object can be found in the documentation
    // for FB.getLoginStatus().
    if(facebookClicked){
	    if (response.status === 'connected') {
	      // Logged into your app and Facebook.
	      console.log('statusChangeCallback');
	    console.log(response);
	    console.log(response.authResponse.userID);//id 찾음!
	    location.href="<%=request.getContextPath()%>/snsLoginservlet.me?memberNum=facebook"+response.authResponse.userID;
	      //testAPI();
	    } else {
	     /*  // The person is not logged into your app or we are unable to tell.
	      document.getElementById('status').innerHTML = 'Please log ' +
	        'into this app.'; */
	    }
    }
  }

  // This function is called when someone finishes with the Login
  // Button.  See the onlogin handler attached to it in the sample
  // code below.
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

    // Now that we've initialized the JavaScript SDK, we call 
    // FB.getLoginStatus().  This function gets the state of the
    // person visiting this page and can return one of three states to
    // the callback you provide.  They can be:
    //
    // 1. Logged into your app ('connected')
    // 2. Logged into Facebook, but not your app ('not_authorized')
    // 3. Not logged into Facebook and can't tell if they are logged into
    //    your app or not.
    //
    // These three cases are handled in the callback function.

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

  // Here we run a very simple test of the Graph API after login is
  // successful.  See statusChangeCallback() for when this call is made.
  /* function testAPI() {
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', {fields: 'email'},function(response) {
      console.log('Successful login for: ' + response.name);
      document.getElementById('status').innerHTML =
        'Thanks for logging in, ' + response.name + '!';
    });
  } */
</script>
</head>
<body>


<br /><br /><br /><br /><br /><br />
<div style="overflow:scroll;  background-color:white;" class="form-grorp">
        <h2 class="header" style="text-align: center">로그인</h2>

        <form id="loginForm" class="form-Member" action="<%=request.getContextPath()%>/login.me" method="post">
            <div class="form-group col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4">
                <input type="text" class="form-control" name="userId" id="userId" placeholder="아이디">
            </div>
            <div class="form-group col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4">
                <input type="password" class="form-control" name="userPwd" id="userPwd" placeholder="비밀번호">
            </div>
            <!-- <div class="form-group col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4">
                <input type="checkbox" id="id_hold_check" name="IdSave">
                <label for="Id_hold_check">아이디 저장</label>
            </div> -->

            <div class="SNSbtn">
                <div class="form-group col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4" >
                    <button type="button" class="btn btn-lg col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4 login"  onclick='login()'>회원 로그인</button>
                </div>
                <div class="form-group col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4" >
                    <a id="kakao-login-btn" class="col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4"></a>
                </div>
                <div class="form-group col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4" >
                    <div class="fb-login-button col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4" 
                    data-max-rows="1" data-size="large" data-button-type="login_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="true" onlogin="checkLoginState();"></div>
                </div>
                <div class="form-group col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4" >
                    <div id="naverIdLogin" class="col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4"></div>
                </div>
                <div class="form-group col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4" >
                    <div class="g-signin2 col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4" onclick="GoogleLogin()" data-onsuccess="onSignIn" data-theme="dark"></div>
                </div>
            </div>
            <div class="find_account col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4" id="find">
                <a href="<%=request.getContextPath()%>/views/mainPage/findUser.jsp">아이디 찾기</a><span class="txt_bar">ㅣ</span><a href="<%=request.getContextPath()%>/views/mainPage/findUser.jsp">비밀번호 찾기</a>
            </div>

            <div class="find_account form-group col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4">
                <button type="button" class="btn col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4" id="signUp">회원가입</button>
            </div>
        </form>
    </div>
    
  
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
        console.log(auth);
        Kakao.API.request({
            url: '/v1/user/me',
            success: function(res) {
            	console.log(JSON.stringify(res));
              console.log(JSON.stringify(res.kaccount_email));
              console.log(JSON.stringify(res.id));
              console.log(JSON.stringify(res.properties.profile_image));
              console.log(JSON.stringify(res.properties.nickname));
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
				callbackUrl: "http://" + window.location.hostname + ((location.port==""||location.port==undefined)?"":":" + location.port) + "/flowerRoadProj/navercall.jsp",
				isPopup: false,
				loginButton: {color: "green", type: 3, height: 60}
			}
		);
		/* (4) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
		naverLogin.init();
		
		/* naverLogin.getLoginStatus(function (status) {
			if (status) {
				var email = naverLogin.user.getEmail();
				var name = naverLogin.user.getNickName();
				var profileImage = naverLogin.user.getProfileImage();
				var birthday = naverLogin.user.getBirthday();			var uniqId = naverLogin.user.getId();
				var age = naverLogin.user.getAge();
				var userid = naverLogin.user.getId();
				console.log(email);
				console.log(name);
				console.log(profileImage);
				console.log(birthday);
				console.log(age);
				console.log(userid);//id
			} else {
				console.log("AccessToken이 올바르지 않습니다.");
			}
		}); */
		/* (4-1) 임의의 링크를 설정해줄 필요가 있는 경우 */
		/* $("#gnbLogin").attr("href", naverLogin.generateAuthorizeUrl()); */

		/* (5) 현재 로그인 상태를 확인 */
		/* window.addEventListener('load', function () {
			naverLogin.getLoginStatus(function (status) {
				if (status) {
					 (6) 로그인 상태가 "true" 인 경우 로그인 버튼을 없애고 사용자 정보를 출력합니다. 
					setLoginStatus();
				}
			});
		}); */

		/* (6) 로그인 상태가 "true" 인 경우 로그인 버튼을 없애고 사용자 정보를 출력합니다. */
		/* function setLoginStatus() {
			var profileImage = naverLogin.user.getProfileImage();
			var nickName = naverLogin.user.getNickName();
			$("#gnbLogin").html("Logout");
			$("#gnbLogin").attr("href", "#");
			(7) 로그아웃 버튼을 설정하고 동작을 정의합니다. 
			$("#gnbLogin").click(function () {
				naverLogin.logout();
				location.reload();
			});
		} */
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
    	
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        /* console.log('Full Name: ' + profile.getName());
        console.log('Given Name: ' + profile.getGivenName());
        console.log('Family Name: ' + profile.getFamilyName());
        console.log("Image URL: " + profile.getImageUrl()); */
        console.log("Email: " + profile.getEmail());

        // The ID token you need to pass to your backend:
        /* var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token); */
        location.href="<%=request.getContextPath()%>/snsLoginservlet.me?memberNum=google"+profile.getId();
      };
    }
	   
		
</script>
</body>
</html>