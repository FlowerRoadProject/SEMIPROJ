package com.fr.jsp.board.model.dao;

import static com.fr.jdbc.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

import com.fr.jsp.board.model.vo.FaqBoard;

public class UserQuestionBoardDao {
	private Properties prop;

	public UserQuestionBoardDao() {
		super();
		prop = new Properties();
		String fileName = ReviewBoardDao.class.getResource("/config/board/userQuestionBoard_query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	// 오늘 등록된 1:1 게시판 게시글
	public int admin_todayUserQuestion(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int admin_userQuestionCount = 0;
		
		try { 
			String query = prop.getProperty("admin_userQuestionCount");
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()){
				admin_userQuestionCount = Integer.parseInt(rset.getString("COUNT(MEMBER_NUM)"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return admin_userQuestionCount;
	}
	// 전체 1:1 게시판 게시글
	public ArrayList<FaqBoard> admin_userQuestionBoardAllList(Connection con) {
		// TODO Auto-generated method stub
		return null;
	}

}
