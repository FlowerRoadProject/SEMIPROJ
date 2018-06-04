package com.fr.jsp.board.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Properties;

import com.fr.jsp.board.model.vo.FaqBoard;

public class NoticeBoardDao {
	private Properties prop;
	
	public NoticeBoardDao() {
		super();
		prop = new Properties();
		String fileName = ReviewBoardDao.class.getResource("/config/board/noticeBoard_query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	// 전체 공지사항 게시판 게시글
	public ArrayList<FaqBoard> admin_noticeBoardAllList(Connection con) {
		// TODO Auto-generated method stub
		return null;
	}

}
