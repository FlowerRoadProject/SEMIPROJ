package com.fr.jsp.admin.model.service;

import static com.fr.jdbc.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.fr.jsp.admin.model.dao.AdminDao;
import com.fr.jsp.admin.model.vo.AdminAdmin;
import com.fr.jsp.admin.model.vo.AdminMember;
import com.fr.jsp.member.model.vo.Member;

public class AdminMemberService {
	private Connection con;
	private AdminDao aDao;
	
	public AdminMemberService() {
		super();
		con = getConnection();
		aDao = new AdminDao();
	}
	// Connection close Method
	public void closeCon(){
		close(con);
	}
	// 관리자 2차 보안
	public Member adminSecondPwCheck(String adminNum) {
		Member admin = aDao.adminSecondPwCheck(con,adminNum);
		return admin;
	}
	// 관리자 메인 이름, 사진
	public Member adminData(String adminNum) {
		Member admin = aDao.adminData(con,adminNum);
		return admin;
	}
	// 관리자 메시지 알림
	public int admin_uncheckedMessage(String adminNum) {
		int admin_messageCount = aDao.admin_uncheckedMessage(con,adminNum);
		return admin_messageCount;
	}
	// 모든 회원 수 조회
	public int admin_allMemberCount() {
		int admin_allMemberCount = aDao.admin_allMemberCount(con);
		return admin_allMemberCount;
	}
	// 오늘 등록한 회원 리스트
	public ArrayList<AdminMember> admin_todayEnrollMemberList() {
		ArrayList<AdminMember> admin_todayEnrollMemberList = aDao.admin_todayEnrollMemberList(con);
		return admin_todayEnrollMemberList;
	}
	// 탈퇴한 회원 수 조회
	public int admin_withdrawMemberCount() {
		int admin_withdrawMemberCount = aDao.admin_withdrawMemberCount(con);
		return admin_withdrawMemberCount;
	}
	// 회원 리스트
	public ArrayList<AdminMember> admin_memberList() {
		ArrayList<AdminMember> admin_memberList = aDao.admin_memberList(con);
		return admin_memberList;
	}
	// 관리자 리스트
	public ArrayList<AdminAdmin> admin_adminList() {
		ArrayList<AdminAdmin> admin_adminList = aDao.admin_adminList(con);
		return admin_adminList;
	}
	// 관리자 정보 수정
	public void admin_updateAdmin(AdminAdmin admin) {
		int updateAdminCount = aDao.admin_updateAdmin(con, admin);
		if(updateAdminCount>0) commit(con);
		else rollback(con);
		
	}
	// 관리자 사진 받아오기
	public String admin_selectAdminImage(String aNum) {
		String admin_selectAdminImage = aDao.admin_selectAdminImage(con, aNum);
		return admin_selectAdminImage;
	}
	// 관리자 등록
	public void admin_insertAdmin(AdminAdmin admin) {
		int insertAdminCount = aDao.admin_insertAdmin(con, admin);
		if(insertAdminCount>0) commit(con);
		else rollback(con);
	}
	

}
