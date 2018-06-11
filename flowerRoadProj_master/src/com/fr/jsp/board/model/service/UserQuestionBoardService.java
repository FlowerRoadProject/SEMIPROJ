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

}
