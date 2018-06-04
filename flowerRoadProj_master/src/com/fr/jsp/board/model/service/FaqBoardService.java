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

	// 전체 FAQ 게시판 게시글
	public int admin_faqBoardAllCount() {
		ArrayList<FaqBoard> admin_faqBoardAllList = fbDao.admin_faqBoardAllList(con);
		int admin_faqBoardCount = admin_faqBoardAllList.size();
		return admin_faqBoardCount;
	}

	// Connection close Method
	public void closeCon() {
		close(con);
	}
}
