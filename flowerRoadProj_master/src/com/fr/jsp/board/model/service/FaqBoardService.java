package com.fr.jsp.board.model.service;

import static com.fr.jdbc.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.fr.jsp.board.model.dao.FaqBoardDao;
import com.fr.jsp.board.model.vo.FaqBoard;

public class FaqBoardService {

	private Connection con;
	private FaqBoardDao fbDao;

	public FaqBoardService() {
		con = getConnection();
		fbDao = new FaqBoardDao();
	}

	public ArrayList<FaqBoard> showFaq() {
		System.out.println("service완료");

		return new FaqBoardDao().showFaq(con);
	}

	// Connection close Method
	public void closeCon() {
		close(con);
	}
}
