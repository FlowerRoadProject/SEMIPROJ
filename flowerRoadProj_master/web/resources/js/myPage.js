// 비밀번호 변경
function pwd(){
	var sel = 1;
	var pwd = prompt("비밀번호를 입력해주세요");
	if(pwd == null || pwd == "") {
		location.reload();
	} else {
		location.href = mainPath+"/pwdRechk.me?pwd="+pwd+"&sel="+sel;
	}
    
}
// 정보 수정
function modify(){
	var sel = 2;
	var pwd = prompt("비밀번호를 입력해주세요");
	if(pwd == null || pwd == "") {
		location.reload();
	} else {
		location.href = mainPath+"/pwdRechk.me?pwd="+pwd+"&sel="+sel;
	}
}
// 탈퇴 하기
function withdrawal(){
	var sel = 3;
	var pwd = prompt("비밀번호를 입력해주세요");
	if(pwd == null || pwd == "") {
		location.reload();
	} else {
		location.href = mainPath+"/pwdRechk.me?pwd="+pwd+"&sel="+sel;
	}
}
// 카테고리-내 정보
function info(){
    location.href = mainPath+"/views/myPage/myPage_main.jsp"
}
// 회원 확인 취소 버튼
function cancel(){
    location.href = mainPath+"/views/myPage/myPage_main.jsp"
}
// 카테고리 - 주문조회
function orderChk(){
    location.href = mainPath+"/orderChk.or"
}
// 카테고리 - 관심상품
function favorite(){
    location.href = mainPath+"/favorite.me" 
}
// 카테고리 - 1:1 문의
function oneToOne(){
    location.href = mainPath+"/oneBoard.me"
}
// 1:1 문의하기
function question(){
    location.href = mainPath+"/views/myPage/1on1Page_Question.jsp"
}
// 1:1 게시판 목록보기
function viewBoard(){
    location.href = mainPath+"/oneBoard.me"
}
