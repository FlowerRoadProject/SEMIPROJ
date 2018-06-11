package com.fr.jsp.admin.model.service;

import static com.fr.jdbc.common.JDBCTemplate.close;
import static com.fr.jdbc.common.JDBCTemplate.commit;
import static com.fr.jdbc.common.JDBCTemplate.getConnection;
import static com.fr.jdbc.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.fr.jsp.admin.model.dao.AdminDao;
import com.fr.jsp.admin.model.vo.AdminFortuen;
import com.fr.jsp.admin.model.vo.AdminRandomGameLeaderBoard;
import com.fr.jsp.admin.model.vo.AdminTheme;

public class AdminService {
	private Connection con;
	private AdminDao aDao;
	
	public AdminService() {
		super();
		con = getConnection();
		aDao = new AdminDao();
	}
	// Connection close Method
	public void closeCon(){
		close(con);
	}
	// 오늘의 명언
	public AdminFortuen admin_randomFortuen() {
		AdminFortuen adminFortuen = new AdminFortuen();
		int fortuenNum = (int)(Math.random()*418)+1;
		adminFortuen = aDao.admin_randomFortuen(con, fortuenNum);
		return adminFortuen;
	}
	// 폰트 테마 저장
	public void admin_updateThemeFont(AdminTheme adminTheme) {
		int updateThemeCount = aDao.admin_updateThemeFont(con, adminTheme);
		if(updateThemeCount>0) commit(con);
		else rollback(con);
	}
	// 배경 테마 저장
	public void admin_updateThemeBgc(AdminTheme adminTheme) {
		int updateThemeCount = aDao.admin_updateThemeBgc(con, adminTheme);
		if(updateThemeCount>0) commit(con);
		else rollback(con);
	}
	// 폰트 색상 테마 저장
	public void admin_updateThemeFontColor(AdminTheme adminTheme) {
		int updateThemeCount = aDao.admin_updateThemeFontColor(con, adminTheme);
		if(updateThemeCount>0) commit(con);
		else rollback(con);
	}
	// 관리자 테마 등록
	public void admin_insertTheme() {
		int insertAdminThemeCount = aDao.admin_insertTheme(con);
		if(insertAdminThemeCount>0) commit(con);
		else rollback(con);
		
	}
	// 프리셋 테마 저장
	public void admin_updateThemePreset(AdminTheme adminTheme) {
		int updateThemeCount = aDao.admin_updateThemePreset(con, adminTheme);
		if(updateThemeCount>0) commit(con);
		else rollback(con);
	}
	// 관리자 테마 불러오기
	public AdminTheme admin_selectTheme(String memberNum) {
		AdminTheme adminTheme = new AdminTheme();
		adminTheme = aDao.admin_selectTheme(con, memberNum);
		return adminTheme;
	}
	// 메인 랜덤게임 점수 입력
	public void admin_insertRandomGameScore(AdminRandomGameLeaderBoard randomGame) {
		int insertRandomGameCount = aDao.admin_insertRandomGameScore(con, randomGame);
		if(insertRandomGameCount>0) commit(con);
		else rollback(con);
	}
	// 랜덤 게임 리스트
	public ArrayList<AdminRandomGameLeaderBoard> admin_selectLeaderBoard(String difficulty) {
		ArrayList<AdminRandomGameLeaderBoard> admin_LeaderBoardList = aDao.admin_selectLeaderBoard(con, difficulty);
		return admin_LeaderBoardList;
	}
	
}
