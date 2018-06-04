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
	// 전체 공지사항 게시판 게시글
	public int admin_noticeBoardAllCount() {
		ArrayList<FaqBoard> admin_noticeBoardAllList = nbDao.admin_noticeBoardAllList(con);
		int admin_noticeBoardCount = admin_noticeBoardAllList.size();
		return admin_noticeBoardCount;
	}
	


}
