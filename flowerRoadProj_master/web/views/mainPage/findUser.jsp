<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@include file = "/views/common/header.jsp" %>
<br /><br /><br /><br /><br /><br />
<article class="container" style="text-align:center;">
            <div class="col-lg-12 col-md-12 col-sm-12" id="container"></div>
            <div class="find_account col-lg-5 col-md-5 col-sm-5" id="find">
                <h3><a href="on" class="id">아이디 찾기</a><span class="txt_bar">ㅣ</span><a href="#">비밀번호 찾기</a></h3>

                <h2>아이디 찾기</h2>
                <form class="form-horizontal">
                    <div class="form-group" id="name">
                        <label for="inputname" class="col-lg-3 col-md-3 col-sm-3 control-label" style="text-align:left;">이름</label>
                        <div class="col-lg-9 col-md-9 col-sm-9">
                            <input type="text" class="form-control" id="inputname" placeholder="이름">
                        </div>
                    </div>
                    <div class="form-group" id="name">
                        <label for="inputname" class="col-lg-3 col-md-3 col-sm-3 control-label" style="text-align:left;">이메일</label>
                        <div class="col-lg-9 col-md-9 col-sm-9">
                            <input type="text" class="form-control" id="inputname" placeholder="이메일">
                        </div>
                    </div>

                </form>
                

                <div class="id">
                    <label for="inputPassword" class=" control-label">생년월일</label>
                    <input type="text" class="form-control" id="inputPassword" placeholder="생년월일">
                </div>
                <div class="id">
                    <label for="inputEmail" class=" control-label">이메일</label>
                    <input type="email" class="form-control" id="inputEmail" placeholder="이메일">
                </div>
                <div class="id">
                    <label for="inputNumber" class=" control-label">휴대폰번호</label>
                    <input type="text" class="form-control" id="inputNumber" placeholder="휴대폰번호">
                    <p class="help-block">- 없이 적어주세요.</p>
                    <a class="btn btn-default" href="#" role="button" id="certBtn">인증번호 전송</a>
                </div>
                <div class="id">
                    <label for="inputNumberCheck" class=" control-label">인증번호 확인</label>
                    <input type="text" class="form-control" id="inputNumberCheck" placeholder="인증번호 6자리">
                    <p class="help-block">전송된 인증번호를 입력해주세요.</p>
                    <a class="btn btn-default" href="#" role="button" id="confirmBtn">인증번호 확인</a>
                </div>
                <div class="id">
                    <label for="inputName" class=" control-label"></label>
                    <div class="">
                        <button type="submit" class="btn btn-primary" href="./login.html">확인</button>
                    </div>
                </div>

            </div>
            <div class="col-lg-2 col-md-2 col-sm-2"></div>
            <div class="find_account col-lg-5 col-md-5 col-sm-5" id="find">
                <h3><a href="on">아이디 찾기</a><span class="txt_bar">ㅣ</span><a href="#">비밀번호 찾기</a></h3>

                <h2>비밀번호 찾기</h2>
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="inputId" class=" control-label">이름</label>
                        <input type="name" class="form-control" id="inputId" placeholder="이름">
                    </div>
                    <div class="form-group">
                        <label for="inputId" class=" control-label">아이디</label>
                        <input type="Id" class="form-control" id="inputId" placeholder="아이디">
                    </div>
                    <div class="form-group">
                        <label for="inputEmail" class=" control-label">이메일</label>
                        <input type="email" class="form-control" id="inputEmail" placeholder="이메일">
                    </div>
                    <div class="form-group">
                        <label for="inputNumber" class=" control-label">휴대폰번호</label>
                        <input type="text" class="form-control" id="inputNumber" placeholder="휴대폰번호">
                        <p class="help-block">- 없이 적어주세요.</p>
                        <a class="btn btn-default" href="#" role="button" id="certBtn">인증번호 전송</a>
                    </div>
                    <div class="form-group">
                        <label for="inputNumberCheck" class=" control-label">인증번호 확인</label>
                        <input type="text" class="form-control" id="inputNumberCheck" placeholder="인증번호 6자리">
                        <p class="help-block">전송된 인증번호를 입력해주세요.</p>
                        <a class="btn btn-default" href="#" role="button" id="confirmBtn">인증번호 확인</a>
                    </div>
                    <div class="form-group">
                        <label for="inputName" class=" control-label"></label>
                        <div class="">
                            <button type="submit" class="btn btn-primary" href="./login.html">확인</button>
                        </div>
                    </div>
                </form>
            </div>
            <div id="wrap" style="grid-auto-rows:center">
                <p align="center">아이디, 비밀번호를 찾지 못한 경우, KH정보교육원 고객센터 <a href="tel:11-119" class="link_tel"><span spcid="MEMB____idsearch__centercall__">112-119</span></a>로 문의 바랍니다.</p>
                <p align="center">아이디, 비밀번호는 이메일로 발송되오니 정확하게 입력해주세요. <br>정확히 입력하지 않을경우 메일이 전송 되지 않습니다. <br>감사합니다.</p>
            </div>
        </article>
<%@include file = "/views/common/footer.jsp" %>
</body>
</html>