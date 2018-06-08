package com.fr.jsp.admin.model.service;

import static com.fr.jdbc.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.fr.jsp.admin.model.dao.AdminMemberDao;
import com.fr.jsp.admin.model.vo.AdminAdmin;
import com.fr.jsp.admin.model.vo.AdminMember;
import com.fr.jsp.member.model.vo.Member;

public class AdminMemberService {
	private Connection con;
	private AdminMemberDao amDao;
	
	public AdminMemberService() {
		super();
		con = getConnection();
		amDao = new AdminMemberDao();
	}
	// Connection close Method
	public void closeCon(){
		close(con);
	}
	// 관리자 2차 보안
	public Member adminSecondPwCheck(String adminNum) {
		Member admin = amDao.adminSecondPwCheck(con,adminNum);
		return admin;
	}
	// 관리자 메인 이름, 사진
	public Member adminData(String adminNum) {
		Member admin = amDao.adminData(con,adminNum);
		return admin;
	}
	// 관리자 메시지 알림
	public int admin_uncheckedMessage(String adminNum) {
		int admin_messageCount = amDao.admin_uncheckedMessage(con,adminNum);
		return admin_messageCount;
	}
	// 모든 회원 수 조회
	public int admin_allMemberCount() {
		int admin_allMemberCount = amDao.admin_allMemberCount(con);
		return admin_allMemberCount;
	}
	// 오늘 등록한 회원 리스트
	public ArrayList<AdminMember> admin_todayEnrollMemberList() {
		ArrayList<AdminMember> admin_todayEnrollMemberList = amDao.admin_todayEnrollMemberList(con);
		return admin_todayEnrollMemberList;
	}
	// 탈퇴한 회원 수 조회
	public int admin_withdrawMemberCount() {
		int admin_withdrawMemberCount = amDao.admin_withdrawMemberCount(con);
		return admin_withdrawMemberCount;
	}
	// 회원 리스트
	public ArrayList<AdminMember> admin_memberList() {
		ArrayList<AdminMember> admin_memberList = amDao.admin_memberList(con);
		return admin_memberList;
	}
	// 관리자 리스트
	public ArrayList<AdminAdmin> admin_adminList() {
		ArrayList<AdminAdmin> admin_adminList = amDao.admin_adminList(con);
		return admin_adminList;
	}
	// 관리자 정보 수정
	public void admin_updateAdmin(AdminAdmin admin) {
		int updateAdminCount = amDao.admin_updateAdmin(con, admin);
		if(updateAdminCount>0) commit(con);
		else rollback(con);
		
	}
	// 관리자 사진 받아오기
	public String admin_selectAdminImage(String aNum) {
		String admin_selectAdminImage = amDao.admin_selectAdminImage(con, aNum);
		return admin_selectAdminImage;
	}
	// 관리자 등록
	public void admin_insertAdmin(AdminAdmin admin) {
		int insertAdminCount = amDao.admin_insertAdmin(con, admin);
		if(insertAdminCount>0) commit(con);
		else rollback(con);
	}
	

}
