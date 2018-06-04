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

import com.fr.jsp.board.model.vo.FaqBoard;
import com.fr.jsp.admin.model.dao.AdminDao;

public class AdminFaqBoardDao {
	private Properties prop;
	
	public AdminFaqBoardDao() {
		super();
		prop = new Properties();
		String fileName = AdminDao.class.getResource("/config/admin/faqBoard_query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	// 전체 FAQ 게시판 게시글
	public ArrayList<FaqBoard> admin_faqBoardAllList(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<FaqBoard> admin_faqBoardAllList = null;
		
		try { 
			String query = prop.getProperty("admin_faqBoardAllList");
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			admin_faqBoardAllList = new ArrayList<FaqBoard>();
			while(rset.next()){
				FaqBoard faqBoard = new FaqBoard();
				
				faqBoard.setMemberNum(rset.getString("MEMBER_NUM"));
				faqBoard.setbNum(Integer.parseInt(rset.getString("BNUM")));
				faqBoard.setbTitle(rset.getString("BTITLE"));
				faqBoard.setbContent(rset.getString("BCONTENT"));
				faqBoard.setContentCategory(rset.getString("CONTENT_CATEGORY"));
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		        Date u_date = format.parse(rset.getString("SUBMIT_DATE"));
		        java.sql.Date s_date = new java.sql.Date(u_date.getTime());
				faqBoard.setSubmitDate(s_date);
				
				admin_faqBoardAllList.add(faqBoard);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return admin_faqBoardAllList;
	}
	// FAQ 등록
	public int admin_insertFAQBoard(Connection con, FaqBoard faqBoard) {
		PreparedStatement pstmt = null;
		int rset = 0;
		
		try { 
			String query = prop.getProperty("admin_insertFAQBoard");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,faqBoard.getMemberNum());
			pstmt.setString(2,faqBoard.getbTitle());
			pstmt.setString(3,faqBoard.getbContent());
			pstmt.setString(4,faqBoard.getContentCategory());
			rset = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return rset;
	}
	// FAQ 수정
	public int admin_updateFAQBoard(Connection con, FaqBoard faqBoard) {
		PreparedStatement pstmt = null;
		int rset = 0;
		
		try { 
			String query = prop.getProperty("admin_updateFAQBoard");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,faqBoard.getMemberNum());
			pstmt.setString(2,faqBoard.getbTitle());
			pstmt.setString(3,faqBoard.getbContent());
			pstmt.setString(4,faqBoard.getContentCategory());
			rset = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return rset;
	}
	// FAQ 삭제
	public int admin_deleteFAQBoard(Connection con, String faqNum) {
		PreparedStatement pstmt = null;
		int rset = 0;
		
		try { 
			String query = prop.getProperty("admin_deleteFAQBoard");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,faqNum);
			rset = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return rset;
	}

}
