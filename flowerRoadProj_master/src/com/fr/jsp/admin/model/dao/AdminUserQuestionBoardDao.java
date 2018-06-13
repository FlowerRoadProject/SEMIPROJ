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

import com.fr.jsp.board.model.vo.UserQuestionBoard;


public class AdminUserQuestionBoardDao {
	private Properties prop;

	public AdminUserQuestionBoardDao() {
		super();
		prop = new Properties();
		String fileName = AdminReviewBoardDao.class.getResource("/config/admin/userQuestionBoard_query.properties").getPath();
		
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
	public ArrayList<UserQuestionBoard> admin_userQuestionBoardAllList(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<UserQuestionBoard> admin_userQuestionBoardAllList = null;
		
		try { 
			String query = prop.getProperty("admin_userQuestionBoardAllList");
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			admin_userQuestionBoardAllList = new ArrayList<UserQuestionBoard>();
			while(rset.next()){
				UserQuestionBoard userQuestionBoard = new UserQuestionBoard();
				
				userQuestionBoard.setMemberNum(rset.getString("MEMBER_NUM"));
				userQuestionBoard.setbNum(Integer.parseInt(rset.getString("BNUM")));
				userQuestionBoard.setbTitle(rset.getString("BTITLE"));
				userQuestionBoard.setbContent(rset.getString("BCONTENT"));
				userQuestionBoard.setViewNum(Integer.parseInt(rset.getString("VIEW_NUM")));
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		        Date u_date = format.parse(rset.getString("SUBMIT_DATE"));
		        java.sql.Date s_date = new java.sql.Date(u_date.getTime());
		        userQuestionBoard.setSubmitDate(s_date);
		        if((rset.getString("ADMIN_NUM") == null)){
		        	userQuestionBoard.setManagerNum("");
			        userQuestionBoard.setReplyContent("");
			        userQuestionBoard.setReply_date(null);
		        }else{
		        	userQuestionBoard.setManagerNum(rset.getString("ADMIN_NUM"));
			        userQuestionBoard.setReplyContent(rset.getString("BOARD_REPLY_CONTENT"));
			        Date u_date1 = format.parse(rset.getString("REPLY_DATE"));
			        java.sql.Date s_date1 = new java.sql.Date(u_date1.getTime());
			        userQuestionBoard.setReply_date(s_date1);
		        }
				
				admin_userQuestionBoardAllList.add(userQuestionBoard);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return admin_userQuestionBoardAllList;
	}
	// 1:1문의 삭제
	public int admin_deleteUserQuestionBoard(Connection con, int userQuestionNum) {
		PreparedStatement pstmt = null;
		int rset = 0;
		
		try { 
			String query = prop.getProperty("admin_deleteUserQuestionBoard");
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1,userQuestionNum);
			rset = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return rset;
	}
	// 1:1문의 수정
	public int admin_updateUserQuestionBoard(Connection con, UserQuestionBoard userQuestionBoard) {
		PreparedStatement pstmt = null;
		int rset = 0;
		
		try { 
			String query = prop.getProperty("admin_updateUserQuestionBoard");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,userQuestionBoard.getManagerNum());
			pstmt.setString(2,userQuestionBoard.getReplyContent());
			pstmt.setInt(3,userQuestionBoard.getbNum());
			rset = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return rset;
	}
	// 1:1문의 한 개 조회
	public UserQuestionBoard admin_selectUserQuestionBoard(Connection con, int getbNum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		UserQuestionBoard admin_selectUserQuestionBoard = null;
		
		try { 
			String query = prop.getProperty("admin_selectUserQuestionBoard");
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, getbNum);
			rset = pstmt.executeQuery();
			admin_selectUserQuestionBoard = new UserQuestionBoard();
			while(rset.next()){
				admin_selectUserQuestionBoard.setMemberNum(rset.getString("MEMBER_NUM"));
				admin_selectUserQuestionBoard.setbNum(Integer.parseInt(rset.getString("BNUM")));
				admin_selectUserQuestionBoard.setbTitle(rset.getString("BTITLE"));
				admin_selectUserQuestionBoard.setbContent(rset.getString("BCONTENT"));
				admin_selectUserQuestionBoard.setViewNum(Integer.parseInt(rset.getString("VIEW_NUM")));
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		        Date u_date = format.parse(rset.getString("SUBMIT_DATE"));
		        java.sql.Date s_date = new java.sql.Date(u_date.getTime());
		        admin_selectUserQuestionBoard.setSubmitDate(s_date);
		        admin_selectUserQuestionBoard.setManagerNum(rset.getString("ADMIN_NUM"));
				admin_selectUserQuestionBoard.setReplyContent(rset.getString("BOARD_REPLY_CONTENT"));
				Date u_date1 = format.parse(rset.getString("REPLY_DATE"));
		        java.sql.Date s_date1 = new java.sql.Date(u_date1.getTime());
		        admin_selectUserQuestionBoard.setSubmitDate(s_date1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return admin_selectUserQuestionBoard;
	}

}
