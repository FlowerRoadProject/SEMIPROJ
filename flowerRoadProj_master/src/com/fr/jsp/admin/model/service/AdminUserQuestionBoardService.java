package com.fr.jsp.admin.model.service;

import static com.fr.jdbc.common.JDBCTemplate.close;
import static com.fr.jdbc.common.JDBCTemplate.commit;
import static com.fr.jdbc.common.JDBCTemplate.getConnection;
import static com.fr.jdbc.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.fr.jsp.admin.model.dao.AdminUserQuestionBoardDao;
import com.fr.jsp.board.model.vo.UserQuestionBoard;

public class AdminUserQuestionBoardService {
	private Connection con;
	private AdminUserQuestionBoardDao auqbDao;
	
	public AdminUserQuestionBoardService() {
		super();
		con = getConnection();
		auqbDao = new AdminUserQuestionBoardDao();
	}
	// Connection close Method
	public void closeCon(){
		close(con);
	}
	// 오늘 등록된 1:1 게시판 게시글
	public int admin_todayUserQuestion() {
		int admin_userQuestionCount = auqbDao.admin_todayUserQuestion(con);
		close(con);
		return admin_userQuestionCount;
	}
	// 전체 1:1 게시판 게시글
	public int admin_userQuestionBoardAllCount() {
		ArrayList<UserQuestionBoard> admin_userQuestionBoardAllList = auqbDao.admin_userQuestionBoardAllList(con);
		int admin_userQuestionBoardCount = admin_userQuestionBoardAllList.size();
		return admin_userQuestionBoardCount;
	}
	// 1:1 게시판 리스트
	public ArrayList<UserQuestionBoard> admin_userQuestionBoardList() {
		ArrayList<UserQuestionBoard> admin_userQuestionBoardAllList = auqbDao.admin_userQuestionBoardAllList(con);
		return admin_userQuestionBoardAllList;
	}
	// 1:1문의 삭제
	public void admin_deleteUserQuestionBoard(int userQuestionNum) {
		int deleteUserQuestionBoardCount = auqbDao.admin_deleteUserQuestionBoard(con, userQuestionNum);
		if(deleteUserQuestionBoardCount>0) commit(con);
		else rollback(con);
	}
	// 1:1문의 수정
	public void admin_updateUserQuestionBoard(UserQuestionBoard userQuestionBoard) {
		int updateUserQuestionBoardCount = auqbDao.admin_updateUserQuestionBoard(con, userQuestionBoard);
		if(updateUserQuestionBoardCount>0) commit(con);
		else rollback(con);
	}
	// 1:1문의 한 개 조회
	public UserQuestionBoard admin_selectUserQuestionBoard(int getbNum) {
		UserQuestionBoard admin_selectUserQuestionBoard = auqbDao.admin_selectUserQuestionBoard(con, getbNum);
		return admin_selectUserQuestionBoard;
	}

}
