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
	
	public Member insertInfo(Member m) {
		Connection con = getConnection();
		Member resultM = mDao.insertInfo(con,m);
		
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
	
	public ArrayList<MemberBoard> oneBoard(String num) {
		Connection con = getConnection();
		
		ArrayList<MemberBoard> list = mDao.oneBoard(con,num);
		
		close(con);
		
		return list;
	}

}
