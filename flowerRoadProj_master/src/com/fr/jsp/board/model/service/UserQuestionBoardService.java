package com.fr.jsp.board.model.service;

import static com.fr.jdbc.common.JDBCTemplate.close;
import static com.fr.jdbc.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.fr.jsp.board.model.dao.UserQuestionBoardDao;
import com.fr.jsp.board.model.vo.FaqBoard;

public class UserQuestionBoardService {
	private Connection con;
	private UserQuestionBoardDao uqbDao;
	
	public UserQuestionBoardService() {
		super();
		con = getConnection();
		uqbDao = new UserQuestionBoardDao();
	}
	// Connection close Method
	public void closeCon(){
		close(con);
	}
	// 오늘 등록된 1:1 게시판 게시글
	public int admin_todayUserQuestion() {
		int admin_userQuestionCount = uqbDao.admin_todayUserQuestion(con);
		close(con);
		return admin_userQuestionCount;
	}
	// 전체 1:1 게시판 게시글
	public int admin_userQuestionBoardAllCount() {
		ArrayList<FaqBoard> admin_userQuestionBoardAllList = uqbDao.admin_userQuestionBoardAllList(con);
		int admin_userQuestionBoardCount = admin_userQuestionBoardAllList.size();
		return admin_userQuestionBoardCount;
	}

}
