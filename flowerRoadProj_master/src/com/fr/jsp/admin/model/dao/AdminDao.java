package com.fr.jsp.admin.model.dao;

import static com.fr.jdbc.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import com.fr.jsp.admin.model.vo.AdminFortuen;
import com.fr.jsp.admin.model.vo.AdminTheme;

public class AdminDao {
	private Properties prop;
	
	public AdminDao() {
		super();
		prop = new Properties();
		String fileName = AdminDao.class.getResource("/config/admin/admin_query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	// 오늘의 명언
	public AdminFortuen admin_randomFortuen(Connection con, int fortuenNum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		AdminFortuen adminFortuen = null;
		
		try { 
			String query = prop.getProperty("admin_randomFortuen");
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, fortuenNum);
			rset = pstmt.executeQuery();
			while(rset.next()){
				adminFortuen = new AdminFortuen();
				adminFortuen.setFortuenNum(Integer.parseInt(rset.getString("FORTUEN_NUM")));
				adminFortuen.setFortuenEnglish(rset.getString("FORTUEN_ENGLISH"));
				adminFortuen.setFortuenKorean(rset.getString("FORTUEN_KOREAN"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return adminFortuen;
	}
	// 테마 저장
	public int admin_updateTheme(Connection con, AdminTheme adminTheme) {
		PreparedStatement pstmt = null;
		int rset = 0;
		
		try { 
			String query = prop.getProperty("admin_updateTheme");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,adminTheme.getFontFamily());
			pstmt.setString(2,adminTheme.getFontSize());
			pstmt.setString(3,adminTheme.getFontWeight());
			pstmt.setString(4,adminTheme.getNavTitleBbc());
			pstmt.setString(5,adminTheme.getNavCenterBgc());
			pstmt.setString(6,adminTheme.getNavChildBgc());
			pstmt.setString(7,adminTheme.getNavBottomBgc());
			pstmt.setString(8,adminTheme.getTopMenuBgc());
			pstmt.setString(9,adminTheme.getTopChildBgc());
			pstmt.setString(10,adminTheme.getMainBgc());
			pstmt.setString(11,adminTheme.getNavTitleColor());
			pstmt.setString(12,adminTheme.getNavProfileColor());
			pstmt.setString(13,adminTheme.getNavSideTitleColor());
			pstmt.setString(14,adminTheme.getNavSideColor());
			pstmt.setString(15,adminTheme.getNavChildColor());
			pstmt.setString(16,adminTheme.getTopMenuColor());
			pstmt.setString(17,adminTheme.getMainColor());
			pstmt.setString(18,adminTheme.getAdminNum());
			rset = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return rset;
	}

}
