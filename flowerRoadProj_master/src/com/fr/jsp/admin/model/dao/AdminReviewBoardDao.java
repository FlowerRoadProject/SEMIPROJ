package com.fr.jsp.admin.model.dao;

import static com.fr.jdbc.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import com.fr.jsp.board.model.vo.ReviewBoard;

public class AdminReviewBoardDao {
	private Properties prop;
	
	public AdminReviewBoardDao() {
		super();
		prop = new Properties();
		String fileName = AdminReviewBoardDao.class.getResource("/config/admin/reviewBoard_query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	// 오늘 등록된 리뷰 게시판 게시글
	public int admin_todayReview(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int admin_reviewCount = 0;
		
		try { 
			String query = prop.getProperty("admin_reviewCount");
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()){
				admin_reviewCount = Integer.parseInt(rset.getString("COUNT(MEMBER_NUM)"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return admin_reviewCount;
	}
	// 전체 리뷰 게시판 게시글
	public ArrayList<ReviewBoard> admin_reviewBoardAllList(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ReviewBoard> admin_reviewBoardAllList = null;
		
		try { 
			String query = prop.getProperty("admin_reviewBoardAllList");
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			admin_reviewBoardAllList = new ArrayList<ReviewBoard>();
			while(rset.next()){
				ReviewBoard reviewBoard = new ReviewBoard();
				
				reviewBoard.setMemberNum(rset.getString("MEMBER_NUM"));
				reviewBoard.setbNum(Integer.parseInt(rset.getString("BNUM")));
				reviewBoard.setbTitle(rset.getString("BTITLE"));
				reviewBoard.setbContent(rset.getString("BCONTENT"));
				reviewBoard.setProductNum(rset.getString("PRODUCT_NUM"));
				reviewBoard.setRating(Integer.parseInt(rset.getString("BRATING")));
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		        Date u_date = format.parse(rset.getString("SUBMIT_DATE"));
		        java.sql.Date s_date = new java.sql.Date(u_date.getTime());
		        reviewBoard.setSubmitDate(s_date);
		        
				admin_reviewBoardAllList.add(reviewBoard);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return admin_reviewBoardAllList;
	}

}
