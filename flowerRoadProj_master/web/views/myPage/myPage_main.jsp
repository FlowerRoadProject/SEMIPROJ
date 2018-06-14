
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.fr.jsp.member.model.vo.*,
    						java.util.*"%>
<%
	Member m = (Member)session.getAttribute("m");
	String addrArr[] = {"","",""};
	if(m.getMemberAddress() != null){
	addrArr = m.getMemberAddress().split("/");
	} else {
	addrArr = null;	
	}
%>

<!DOCTYPE>
<html>
    <head>
        <title>꽃길-마이페이지</title>
        <meta charset="utf-8">
         <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/myInfo.css">
        <script src="<%=request.getContextPath() %>/resources/js/myPage.js?ver=1"></script>
        <script>
        	var mainPath = '<%=request.getContextPath() %>';
        </script>
    </head>
    <!-- <body onload="testCommand();"> -->
    <body>
    
    	<%@ include file="/views/common/header.jsp" %>
    	<%@ include file="/views/myPage/couponModal.jsp" %>
    	<%
        String sns="";
        for(int i=0; i<memberNum.length(); i++){
          
                 
           if(memberNum.charAt(i)>= '0' && memberNum.charAt(i)<='9'){
              
           }else{
              sns+=memberNum.charAt(i);
           }
              
        }
        %>
        
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

        <br><br><br><br><br>
        <!-- 내 정보 창 -->
        <div class="container-fluid">
            <div class="col-sm-2 col-md-2 col-lg-2"><h4><i>내 정보</i></h4></div>
            <div class="col-sm-10 col-md-10 col-lg-10"></div>
        </div>
        <div>
            <div class="info">
                	<% if(m != null) { %>
                    <br>
                    <% if(memberNum.substring(0,1).equals("A")||memberNum.substring(0,1).equals("M")){%>
                    <div class="col-sm-1 col-md-1 col-lg-1"></div>
                    <div class="col-sm-2 col-md-2 col-lg-2"><b>아이디</b></div>
                    <div class="col-sm-2 col-md-2 col-lg-2"></div>
                    <div class="col-sm-2 col-md-2 col-lg-2"><p class="text-muted" style="font-weight:bold;" id="memId"><%= m.getMemberId() %></p></div>  <br><br><br>

                    <div class="col-sm-1 col-md-1 col-lg-1"></div>
                    <div class="col-sm-2 col-md-2 col-lg-2"><b>이름</b></div>
                    <div class="col-sm-2 col-md-2 col-lg-2"></div>
                    <div class="col-sm-2 col-md-2 col-lg-2"><p class="text-muted" style="font-weight:bold;">
					<%= m.getMemberName() %></p></div>
					<div class="col-sm-2 col-md-2 col-lg-2">
					<button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal">
					  쿠폰 확인하기</button>
					</div>
					<div class="col-sm-2 col-md-2 col-lg-2"></div> 
					<br><br><br>
					
					<div class="col-sm-1 col-md-1 col-lg-1"></div>
                    <div class="col-sm-2 col-md-2 col-lg-2"><b>이메일</b></div>
                    <div class="col-sm-2 col-md-2 col-lg-2"></div>
                    <div class="col-sm-2 col-md-2 col-lg-2"><p class="text-muted" style="font-weight:bold;">
					<%=m.getMemberEmail() %></p></div> <br><br><br>

                    <div class="col-sm-1 col-md-1 col-lg-1"></div>
                    <div class="col-sm-2 col-md-2 col-lg-2"><b>주소</b></div>
                    <div class="col-sm-2 col-md-2 col-lg-2"></div>
                    <% if(addrArr != null) { %>
                    <div class="col-sm-3 col-md-3 col-lg-3"><p class="text-muted" style="font-weight:bold;">
					<%= addrArr[0]+" "+addrArr[1]+" "+addrArr[2] %></p></div><br><br><br>
					<% } else { %>
					 <div class="col-sm-3 col-md-3 col-lg-3"><p class="text-muted" style="font-weight:bold;">
					null</p></div><br><br><br>
					<% } %>

                    <div class="col-sm-1 col-md-1 col-lg-1"></div>
                    <div class="col-sm-2 col-md-2 col-lg-2"><b>전화번호</b></div>
                    <div class="col-sm-2 col-md-2 col-lg-2"></div>
                    <div class="col-sm-2 col-md-2 col-lg-2"><p class="text-muted" style="font-weight:bold;">
					<%= m.getMemberPhone() %></p></div> <br><br><br>

                    <div class="col-sm-1 col-md-1 col-lg-1"></div>
                    <div class="col-sm-2 col-md-2 col-lg-2"><b>가입날짜</b></div>
                    <div class="col-sm-2 col-md-2 col-lg-2"></div>
                    <div class="col-sm-2 col-md-2 col-lg-2"><p class="text-muted" style="font-weight:bold;">
                    <%= m.getEnrollDate() %></p></div> <br><br><br>
					
					<!-- sns 유저 -->
					<% } else { %>
					<div class="col-sm-1 col-md-1 col-lg-1"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"><b>아이디</b></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"><p class="text-muted" style="font-weight:bold;">
                        <%= sns %>로 로그인 한 아이디</p></div>  <br><br><br>
    
                        <div class="col-sm-1 col-md-1 col-lg-1"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"><b>이름</b></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2">
                        <p class="text-muted" style="font-weight:bold;">
                        <%= sns %>로 로그인 한 회원</p></div><br><br><br>
                        
                        <div class="col-sm-1 col-md-1 col-lg-1"></div>
                    <div class="col-sm-2 col-md-2 col-lg-2"><b>이메일</b></div>
                    <div class="col-sm-2 col-md-2 col-lg-2"></div>
                    <% if(m.getMemberEmail() != null) { %>
                    <div class="col-sm-2 col-md-2 col-lg-2"><p class="text-muted" style="font-weight:bold;">
					<%=m.getMemberEmail() %></p></div>
                    <% } else { %>
                    <div class="col-sm-2 col-md-2 col-lg-2"><p class="text-muted" style="font-weight:bold;">
					정보없음</p></div><% } %> <br><br><br>

                    <div class="col-sm-1 col-md-1 col-lg-1"></div>
                    <div class="col-sm-2 col-md-2 col-lg-2"><b>주소</b></div>
                    <div class="col-sm-2 col-md-2 col-lg-2"></div>
                    <% if(addrArr != null) { %>
                    <div class="col-sm-3 col-md-3 col-lg-3"><p class="text-muted" style="font-weight:bold;">
					<%= addrArr[0]+" "+addrArr[1]+" "+addrArr[2] %></p></div><br><br><br>
					<% } else { %>
					 <div class="col-sm-3 col-md-3 col-lg-3"><p class="text-muted" style="font-weight:bold;">
					정보없음</p></div><br><br><br>
					<% } %>

                    <div class="col-sm-1 col-md-1 col-lg-1"></div>
                    <div class="col-sm-2 col-md-2 col-lg-2"><b>전화번호</b></div>
                    <div class="col-sm-2 col-md-2 col-lg-2"></div>
                    <% if(m.getMemberPhone() != null) { %>
                    <div class="col-sm-2 col-md-2 col-lg-2"><p class="text-muted" style="font-weight:bold;">
					<%=m.getMemberPhone() %></p></div>
                    <% } else { %>
                    <div class="col-sm-2 col-md-2 col-lg-2"><p class="text-muted" style="font-weight:bold;">
					정보없음</p></div><% } %> <br><br><br>

                    <div class="col-sm-1 col-md-1 col-lg-1"></div>
                    <div class="col-sm-2 col-md-2 col-lg-2"><b>가입날짜</b></div>
                    <div class="col-sm-2 col-md-2 col-lg-2"></div>
                    <div class="col-sm-2 col-md-2 col-lg-2"><p class="text-muted" style="font-weight:bold;">
                    <%= m.getEnrollDate() %></p></div> <br><br><br>
					<% } %>

                    
                	
                	<% } %>
            </div>
        </div>

        <!-- 수정 및 탈퇴 버튼 -->
        <div class="container-fluid">
            <div class="col-sm-1 col-md-1 col-lg-1"></div>
            <div class="col-sm-2 col-md-2 col-lg-2">
                <button type="button" class="blueBtn btn btn-Primary" data-toggle="modal" data-target="#pwd1">
					  비밀번호 변경</button>
            </div>
            <div class="col-sm-1 col-md-1 col-lg-1"></div>
            <div class="col-sm-2 col-md-2 col-lg-2">
            	<button type="button" class="blueBtn btn btn-Primary" data-toggle="modal" data-target="#modi1">
					  비밀번호 변경</button>
            </div>
            <div class="col-sm-1 col-md-1 col-lg-1"></div>
            <div class="col-sm-2 col-md-2 col-lg-2">
            <button type="button" class="blueBtn btn btn-Primary" data-toggle="modal" data-target="#withdrawal1">
					  회원 탈퇴</button>
            </div>
        </div>
        
       <!-- 비밀번호 변경 모달 -->
	<div class="modal fade" id="pwd1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog modal-sm">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel">비밀번호를 입력해주세요.</h4>
	      </div>
	      			<div class="modal-body">
		            <input type="password" size="30" id="ChangePwd" />
			      </div>
			      <div class="modal-footer">
				<button id="confirm1" type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
			      </div>
			    </div>
			  </div>
			</div>
			
	  <!-- 정보 변경 모달 -->
	<div class="modal fade" id="modi1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog modal-sm">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel">비밀번호를 입력해주세요.</h4>
	      </div>
	      			<div class="modal-body">
		            <input type="password" size="30" id="ChagneModi" />
			      </div>
			      <div class="modal-footer">
				<button id="confirm2" type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
			      </div>
			    </div>
			  </div>
			</div>
			
		<!-- 회원탈퇴 모달 -->
	<div class="modal fade" id="withdrawal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog modal-sm">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel">비밀번호를 입력해주세요.</h4>
	      </div>
	      			<div class="modal-body">
		            <input type="password" size="30" id="DeleteMember" />
			      </div>
			      <div class="modal-footer">
				<button id="confirm3" type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
			      </div>
			    </div>
			  </div>
			</div>
        <%@ include file="/views/common/footer.jsp" %>
        
        <script>
     
        // 비밀번호 변경
        $('#confirm1').on('click',function(){
        	var sel = 1;
        	var pwd = $('#ChangePwd').val();
            <%if(sns.equals("M")){%>
               if(pwd == null || pwd == "")
                  location.reload();
               else 
                  location.href = mainPath+"/pwdRechk.me?pwd="+pwd+"&sel="+sel;
            <%}else{%>
               alert('<%=sns%>로 로그인한 계정입니다.'); 
            <%}%>
        });

        // 정보 수정
        $('#confirm2').on('click',function(){
        	var sel = 2;
        	var pwd = $('#ChagneModi').val();
            <% if(memberNum.substring(0,1).equals("A")||memberNum.substring(0,1).equals("M")){%>
	        	if(pwd == null || pwd == "") {
	        		location.reload();
	        	} else {
	        		location.href = mainPath+"/pwdRechk.me?pwd="+pwd+"&sel="+sel;
	        	}
            <%}else{%>
            	 location.href = mainPath+"/views/myPage/myPage_infoModify.jsp";
            <%}%>
        });
        
     	// 탈퇴 하기
        $('#confirm3').on('click',function(){
        	var sel = 3;
        	var pwd = $('#DeleteMember').val();
            <%if(sns.equals("M")){%>
               if(pwd == null || pwd == "")
                  location.reload();
               else 
                  location.href = mainPath+"/pwdRechk.me?pwd="+pwd+"&sel="+sel;
            <%}else{%>
               alert('<%=sns%>로 로그인한 계정입니다.'); 
            <%}%>
        });
        </script>
    </body>
</html>