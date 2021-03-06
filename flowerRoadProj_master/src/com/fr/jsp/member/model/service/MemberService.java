package com.fr.jsp.member.model.service;

import static com.fr.jdbc.common.JDBCTemplate.close;
import static com.fr.jdbc.common.JDBCTemplate.commit;
import static com.fr.jdbc.common.JDBCTemplate.getConnection;
import static com.fr.jdbc.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.fr.jsp.member.model.dao.MemberDao;
import com.fr.jsp.member.model.vo.Member;
import com.fr.jsp.member.model.vo.MemberBoard;
import com.fr.jsp.member.model.vo.MemberCoupon;
import com.fr.jsp.product.model.vo.ProductFavorite;

public class MemberService {
	private MemberDao mDao;
	public MemberService(){
		mDao=new MemberDao();
	}
	public Member SelectMember(Member m) {
		Connection con = getConnection();
		Member resultM = mDao.selectMember(con,m);
		close(con);
		return resultM;
	}
	
	public int findMember(String memberNum) {
		Connection con = getConnection();
		int result = 0;
		result= mDao.findMember(con,memberNum);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result;
	}
	
	public int snsInsertMember(String memberNum) {
		Connection con = getConnection();
		int result = 0;
		result= mDao.snsInsertMember(con,memberNum);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result;
	}
	

	
	public Member insertInfo(String num) {
		Connection con = getConnection();
		Member resultM = mDao.insertInfo(con,num);
		
		close(con);
		
		return resultM;
	}

	public Member pwdChangeView(Member m) {
		Connection con = getConnection();
		
		Member resultM = mDao.pwdChangeView(con,m);
		
		close(con);
		
		return resultM;
	}

	public int pwdChange(Member m) {
		Connection con = getConnection();
		int result =0;
		result = mDao.pwdChange(con, m);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result;
	}

	public int memberUpdate(Member m) {
		Connection con = getConnection();
		int result =0;
		result = mDao.memberUpdate(con, m);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result;
	}

	public int memberDelete(Member m) {
		Connection con = getConnection();
		int result =0;
		result = mDao.memberDelete(con, m);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result;
	}
	
	public ArrayList<ProductFavorite> favorite(String num, int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<ProductFavorite> list = mDao.favorite(con,num, currentPage,limit);
		
		close(con);
		
		return list;
	}

	public ArrayList<MemberBoard> oneBoard(String num) {
		Connection con = getConnection();
		
		ArrayList<MemberBoard> list = mDao.oneBoard(con,num);
		
		close(con);
		
		return list;
	}

	public int sendBoard(MemberBoard mb) {
		Connection con = getConnection();
		int result =0;
		result = mDao.sendBoard(con, mb);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result;
	}
	
	public Member loginSelectMember(Member m) {
		Connection con = getConnection();
		Member resultM = mDao.loginSelectMember(con,m);
		close(con);
		return resultM;
	}
	
	
	public int addToFavorite(String memberNum, String productNum) {
		Connection con = getConnection();
		int result =  mDao.addToFavorite(con,memberNum,productNum);
		
		if(result>0)commit(con);
		else rollback(con);
		
		return result;
	}
	public int checkInList(String memberNum, String productNum) {
		Connection con = getConnection();
		return mDao.checkInList(con,memberNum,productNum);
		
	}
	
	public int deleteFromFavorite(String memberNum, String productNum) {
		
		Connection con = getConnection();
		
		int result = 0;
		result = mDao.deleteFromFavorite(con,memberNum,productNum);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		
		return result;
	}
	
	public int accessMember(Member m) {
		Connection con = getConnection();
		int result = 0;
		result= mDao.accessMember(con,m);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result;
	}
	public String idSearch(String name, String phone, String email) {
		Connection con = getConnection();
		String result = "";
		result= mDao.idSearch(con,name,phone,email);
		
		close(con);
		return result;
	}
	public String pwSearch(Member m) {
		Connection con = getConnection();
		int result =0;
		String pwd="";
		
		for(int i=0; i<2; i++) 
			pwd+=((char)((int)(Math.random()*26)+65));
		
		for(int i=0; i<6; i++) 
		pwd += (int) (Math.random()*10);
		//임시비밀번호
		result= mDao.pwSearch(con,m,pwd);
		if(result > 0){
			commit(con);
		}else{
			//값을 못찾았을때
			rollback(con);
			pwd="";
		}
		close(con);
		return pwd;
	}
	public int checkId(String userId) {
		Connection con = getConnection();
		int result =0;
		result=mDao.checkId(con,userId);
		return result;
	}
	public int InsertMember(Member m) {
		Connection con = getConnection();
		int result = 0;
		result= mDao.insertMember(con,m);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result;
	}
	public String emailSendNum(String email) {
		
		String Num="";
		
		for(int i=0; i<6; i++) 
		Num += (int) (Math.random()*10);
		//임시비밀번호
		//System.out.println(Num);
		
		return Num;
	}
	// 리스트 페이지
	public int getListCount(String num) {
			Connection con = getConnection();
			int result= mDao.getListCount(con, num);
			
			close(con);
			return result;
		}
	// 관심상품 전체 삭제
	public int favoriteAllDel(String num) {
		Connection con = getConnection();
		int result = 0;
		result= mDao.favoriteAllDel(con,num);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result;
	}
	// 관심상품 삭제
	public int favoriteDel(String num, String pno) {
		Connection con = getConnection();
		int result = 0;
		result= mDao.favoriteDel(con,num,pno);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result;
	}
	// 1대1 게시판 상세보기
	public MemberBoard oneView(String mNum, int bNum) {
		Connection con = getConnection();
		MemberBoard resultB = mDao.oneView(con,mNum,bNum);
		
		close(con);
		
		return resultB;
	}
	// 맴버 쿠폰
	public ArrayList<MemberCoupon> memberCoupon(String num) {
		Connection con = getConnection();
		
		ArrayList<MemberCoupon> clist = mDao.memberCoupon(con, num);
		
		close(con);
		
		return clist;
		
	}
	// 비밀번호 재확인
	public int pwdRecheck(String num, String pwd) {
		Connection con = getConnection();
		
		int result = mDao.pwdRecheck(con, num, pwd);
		
		close(con);
		
		return result;
	}
	public int insertCoupon(String memberNum) {
		Connection con = getConnection();
		int result = 0;
		result= mDao.insertCoupon(con,memberNum);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result;
	}
	public String findMemberNum(String memberId) {
		Connection con = getConnection();
		String result = "";
		result= mDao.findMemberNum(con,memberId);
		
		close(con);
		return result;
	}

}
