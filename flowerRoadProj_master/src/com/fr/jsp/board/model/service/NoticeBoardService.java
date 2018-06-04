package com.fr.jsp.board.model.service;

import static com.fr.jdbc.common.JDBCTemplate.close;
import static com.fr.jdbc.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.fr.jsp.board.model.dao.NoticeBoardDao;
import com.fr.jsp.board.model.vo.FaqBoard;

public class NoticeBoardService {
	private Connection con;
	private NoticeBoardDao nbDao;
	
	public NoticeBoardService() {
		super();
		con = getConnection();
		nbDao = new NoticeBoardDao();
	}
	// Connection close Method
	public void closeCon(){
		close(con);
	}

}
