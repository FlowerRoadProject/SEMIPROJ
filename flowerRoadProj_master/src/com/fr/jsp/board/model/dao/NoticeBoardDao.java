package com.fr.jsp.board.model.dao;

import static com.fr.jdbc.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.fr.jsp.board.model.vo.NoticeBoard;

public class NoticeBoardDao {

	private Properties prop;
	
	public NoticeBoardDao(){
		prop = new Properties();
		String fileName = NoticeBoardDao.class.getResource("/config/board/notice.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList<NoticeBoard> showNotice(Connection con, int currentPage, int limit){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<NoticeBoard> list = new ArrayList<NoticeBoard>();
		NoticeBoard notice;
		//int bNum, String bTitle, String bContent, Date submitDate, int viewNum
		//BNUM, BTITLE, BCONTENT, VIEW_NUM, SUBMIT_DATE
		String query = prop.getProperty("showNotice");
		try {
			pstmt = con.prepareStatement(query);
						
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + (limit - 1);
			System.out.println("startRow: "+startRow);
			System.out.println("endRow: "+endRow);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();			
			
			while(rset.next()){
				notice = new NoticeBoard();
				notice.setbNum(rset.getInt("BNUM"));
				notice.setbTitle(rset.getString("BTITLE"));				
				notice.setViewNum(rset.getInt("VIEW_NUM"));
				notice.setSubmitDate(rset.getDate("SUBMIT_DATE"));
				
				list.add(notice);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public int getListCount(Connection con){
		int result = 0;
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("countNotice");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()){
				result = rset.getInt("COUNT(*)");
			}
			System.out.println("RESULT: "+result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}
					
		return result;
	}
	
	
	public NoticeBoard showContent(Connection con, int bNum){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		NoticeBoard notice = new NoticeBoard();
		
		String query = prop.getProperty("showContent");
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bNum);
			
			rset = pstmt.executeQuery();
			while(rset.next()){
				notice.setbNum(bNum);
				notice.setbContent(rset.getString("BCONTENT"));
				notice.setbTitle(rset.getString("BTITLE"));
				notice.setSubmitDate(rset.getDate("SUBMIT_DATE"));
				notice.setViewNum(rset.getInt("VIEW_NUM"));				
			}			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return notice;
	}
	
	
	
	

	public int updateCount(Connection con, int bNum) {
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateCount");
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bNum);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally{
			close(pstmt);			
		}
		
		return result;
	}
	
}
