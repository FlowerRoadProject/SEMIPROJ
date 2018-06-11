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

import com.fr.jsp.board.model.vo.NoticeBoard;

public class AdminNoticeBoardDao {
	private Properties prop;
	
	public AdminNoticeBoardDao() {
		super();
		prop = new Properties();
		String fileName = AdminReviewBoardDao.class.getResource("/config/admin/noticeBoard_query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	// 전체 공지사항 게시판 게시글
	public ArrayList<NoticeBoard> admin_noticeBoardAllList(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<NoticeBoard> admin_noticeBoardAllList = null;
		
		try { 
			String query = prop.getProperty("admin_noticeBoardAllList");
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			admin_noticeBoardAllList = new ArrayList<NoticeBoard>();
			while(rset.next()){
				NoticeBoard noticeBoard = new NoticeBoard();
				
				noticeBoard.setMemberNum(rset.getString("MEMBER_NUM"));
				noticeBoard.setbNum(Integer.parseInt(rset.getString("BNUM")));
				noticeBoard.setbTitle(rset.getString("BTITLE"));
				noticeBoard.setbContent(rset.getString("BCONTENT"));
				noticeBoard.setViewNum(Integer.parseInt(rset.getString("VIEW_NUM")));
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		        Date u_date = format.parse(rset.getString("SUBMIT_DATE"));
		        java.sql.Date s_date = new java.sql.Date(u_date.getTime());
		        noticeBoard.setSubmitDate(s_date);
				
				admin_noticeBoardAllList.add(noticeBoard);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return admin_noticeBoardAllList;
	}
	// 공지사항 등록
	public int admin_insertNoticeBoard(Connection con, NoticeBoard noticeBoard) {
		PreparedStatement pstmt = null;
		int rset = 0;
		
		try { 
			String query = prop.getProperty("admin_insertNoticeBoard");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,noticeBoard.getbTitle());
			pstmt.setString(2,noticeBoard.getbContent());
			pstmt.setString(3,noticeBoard.getMemberNum());
			rset = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return rset;
	}
	// 공지사항 수정
	public int admin_updateNoticeBoard(Connection con, NoticeBoard noticeBoard) {
		PreparedStatement pstmt = null;
		int rset = 0;
		
		try { 
			String query = prop.getProperty("admin_updateNoticeBoard");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,noticeBoard.getMemberNum());
			pstmt.setString(2,noticeBoard.getbTitle());
			pstmt.setString(3,noticeBoard.getbContent());
			pstmt.setInt(4,noticeBoard.getbNum());
			rset = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return rset;
	}
	// 공지사항 한 개 조회
	public NoticeBoard admin_selectNoticeBoard(Connection con, int getbNum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		NoticeBoard admin_selectNoticeBoard = null;
		
		try { 
			String query = prop.getProperty("admin_selectNoticeBoard");
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, getbNum);
			rset = pstmt.executeQuery();
			admin_selectNoticeBoard = new NoticeBoard();
			while(rset.next()){
				admin_selectNoticeBoard.setMemberNum(rset.getString("MEMBER_NUM"));
				admin_selectNoticeBoard.setbNum(Integer.parseInt(rset.getString("BNUM")));
				admin_selectNoticeBoard.setbTitle(rset.getString("BTITLE"));
				admin_selectNoticeBoard.setbContent(rset.getString("BCONTENT"));
				admin_selectNoticeBoard.setViewNum(Integer.parseInt(rset.getString("VIEW_NUM")));
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		        Date u_date = format.parse(rset.getString("SUBMIT_DATE"));
		        java.sql.Date s_date = new java.sql.Date(u_date.getTime());
		        admin_selectNoticeBoard.setSubmitDate(s_date);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return admin_selectNoticeBoard;
	}
	// 공지사항 삭제
	public int admin_deleteNoticeBoard(Connection con, int noticeNum) {
		PreparedStatement pstmt = null;
		int rset = 0;
		
		try { 
			String query = prop.getProperty("admin_deleteNoticeBoard");
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1,noticeNum);
			rset = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return rset;
	}

}
