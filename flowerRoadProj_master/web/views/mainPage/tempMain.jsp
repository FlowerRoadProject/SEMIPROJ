<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>Login Demo - Kakao JavaScript SDK</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="477566022295-va6h7acae97e1sfavcdnbrfcii3g7r8s.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
<link rel="stylesheet"href="<%=request.getContextPath()%>/resources/css/bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>
<script>
$(document).ready(function() {
	
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
		      // Logged into your app and Facebook.
		      //console.log('statusChangeCallback');
		    //console.log(response);
		    //console.log(response.authResponse.userID);//id 찾음!
		    location.href="<%=request.getContextPath()%>/snsLoginservlet.me?memberNum=facebook"+response.authResponse.userID;
		      //testAPI();
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

</head>
<body>
	

   
	<div class="container" >
		<div class="row" >
	        <form id="loginForm" class="form-Member" action="<%=request.getContextPath()%>/login.me" method="post">
	            <div class="form-group ">
	                <input type="text" class="form-control" name="userId" id="userId" placeholder="아이디">
	            </div>
	            <div class="form-group ">
	                <input type="password" class="form-control" name="userPwd" id="userPwd" placeholder="비밀번호">
	            </div>
	            <div class="form-group ">
	                <input type="checkbox" id="id_hold_check" name="IdSave">
	                <label for="Id_hold_check">아이디 저장</label>
	            </div>
	
	            <div class="SNSbtn">
	                <div class="form-group " style="width:100;" >
	                    <button type="button" class=" login"  onclick='login()'>회원 로그인</button>
	                </div>
	                <div class="form-group " >
	                    <a id="kakao-login-btn" style="width:200px; height:100px;"></a>
	                </div>
	                
	               <div class="form-group " >
	                    <div class="fb-login-button " 
	                    data-max-rows="1" data-size="large" data-button-type="login_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="true" onlogin="checkLoginState();"></div>
	                </div>
	                <div class="form-group " >
	                    <div id="naverIdLogin" class=""></div>
	                </div>
	                <div class="form-group " >
	                    <div class="g-signin2 " onclick="GoogleLogin()" data-onsuccess="onSignIn" data-theme="dark"></div>
	                </div>
	            </div>
	            <div class="find_account" id="find">
	                <a href="<%=request.getContextPath()%>/views/mainPage/findUser.jsp">아이디 찾기</a><span class="txt_bar">ㅣ</span><a href="<%=request.getContextPath()%>/views/mainPage/findUser.jsp">비밀번호 찾기</a>
	            </div>
	
	            <div class="find_account form-group ">
	                <button type="button" class="btn " id="signUp">회원가입</button>
	            </div>
	        </form>
       </div>
</div>
	
	
<script type='text/javascript'>
		//<![CDATA[
		// 사용할 앱의 JavaScript 키를 설정해 주세요.
		
		
			Kakao.init('8a0eb548cc8e4502f32642ba5c48cb47');
			
			
			// 카카오 로그인 버튼을 생성합니다.
		Kakao.Auth.createLoginButton({
			container : '#kakao-login-btn',
			success : function(authObj) {
				alert(JSON.stringify(authObj));
			},
			fail : function(err) {
				alert(JSON.stringify(err));
			}
		});
	
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