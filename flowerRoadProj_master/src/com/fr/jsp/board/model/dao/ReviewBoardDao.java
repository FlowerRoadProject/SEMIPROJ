package com.fr.jsp.board.model.dao;

import static com.fr.jdbc.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.fr.jsp.board.model.vo.FaqBoard;
import com.fr.jsp.board.model.vo.ReviewBoard;
import com.fr.jsp.common.PageInfo;

public class ReviewBoardDao {

	private Properties prop = null;

	public ReviewBoardDao() {
		prop = new Properties();

		String fileName = ReviewBoardDao.class.getResource("/config/board/ReviewBoard-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			System.out.println("ReviewBoard-query.properties 파일 읽기 실패");
			e.printStackTrace();
		}

	}

	public ArrayList<ReviewBoard> selectReviewList(Connection con, String pno) {

		String query = prop.getProperty("selectList");
		ResultSet rset = null;

		ArrayList<ReviewBoard> result = new ArrayList<ReviewBoard>();

		PreparedStatement pstmt = null;

		try {

			pstmt = con.prepareStatement(query);

			pstmt.setString(1, pno);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				ReviewBoard rb = new ReviewBoard();

				rb.setbNum(rset.getInt(1));
				rb.setbTitle(rset.getString(2));
				rb.setbContent(rset.getString(3));
				rb.setMemberNum(rset.getString(4));
				rb.setProductNum(rset.getString(5));
				rb.setRating(rset.getInt(6));
				rb.setSubmitDate(rset.getDate(7));

				result.add(rb);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);

		}

		return result;
	}

	public int insertReview(Connection con, ReviewBoard rb) {

		int result = 0;
		String query = prop.getProperty("insertReview");
		PreparedStatement pstmt = null;

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, rb.getbTitle());
			pstmt.setString(2, rb.getbContent());
			pstmt.setString(3, rb.getMemberNum());
			pstmt.setString(4, rb.getProductNum());
			pstmt.setInt(5, rb.getRating());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			close(pstmt);
		}

		return result;
	}

	public int getListCount(Connection con, String pno) {

		int result = 0;

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		try {
			pstmt = con.prepareStatement(prop.getProperty("getListCount"));
			pstmt.setString(1, pno);

			rset = pstmt.executeQuery();

			while (rset.next()) {

				result = rset.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);

		}

		return result;
	}

	public int getListCount(Connection con) {

		int result = 0;

		Statement stmt = null;
		ResultSet rset = null;

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(prop.getProperty("getListCount"));

			while (rset.next()) {

				result = rset.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);

		}

		return result;
	}

	public ArrayList<ReviewBoard> selectList(Connection con, String pno, PageInfo pi) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ReviewBoard> result = new ArrayList<ReviewBoard>();
		ReviewBoard rb = null;

		System.out.println("///"+pno);
		try {
			pstmt = con.prepareStatement(prop.getProperty("getpagedReviewList"));

			pstmt.setString(1, pno);
			pstmt.setInt(2, pi.getStartRow());
			pstmt.setInt(3,pi.getEndRow() );
			rset = pstmt.executeQuery();

			while (rset.next()) {

				rb = new ReviewBoard();

				rb.setbNum(rset.getInt(2));
				rb.setbTitle(rset.getString(3));
				rb.setbContent(rset.getString(4));
				rb.setMemberNum(rset.getString(5));
				rb.setProductNum(rset.getString(6));
				rb.setRating(rset.getInt(7));
				rb.setSubmitDate(rset.getDate(8));

				result.add(rb);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);

		}

	
		return result;
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
			// TODO Auto-generated method stub
			return null;
		}

}
