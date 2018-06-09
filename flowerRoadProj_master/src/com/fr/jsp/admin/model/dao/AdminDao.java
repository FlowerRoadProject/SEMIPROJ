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
	// 폰트 테마 저장
	public int admin_updateThemeFont(Connection con, AdminTheme adminTheme) {
		PreparedStatement pstmt = null;
		int rset = 0;
		
		try { 
			String query = prop.getProperty("admin_updateThemeFont");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,adminTheme.getFontFamily());
			pstmt.setString(2,adminTheme.getFontSize());
			pstmt.setString(3,adminTheme.getFontWeight());
			pstmt.setString(4,adminTheme.getAdminNum());
			rset = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return rset;
	}
	// 배경 테마 저장
	public int admin_updateThemeBgc(Connection con, AdminTheme adminTheme) {
		PreparedStatement pstmt = null;
		int rset = 0;
		try { 
			String query = prop.getProperty("admin_updateThemeBgc");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,adminTheme.getNavTitleBbc());
			pstmt.setString(2,adminTheme.getNavCenterBgc());
			pstmt.setString(3,adminTheme.getNavChildBgc());
			pstmt.setString(4,adminTheme.getNavBottomBgc());
			pstmt.setString(5,adminTheme.getTopMenuBgc());
			pstmt.setString(6,adminTheme.getTopChildBgc());
			pstmt.setString(7,adminTheme.getMainBgc());
			pstmt.setString(8,adminTheme.getAdminNum());
			
			rset = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return rset;
	}
	// 폰트 색상 테마 저장
	public int admin_updateThemeFontColor(Connection con, AdminTheme adminTheme) {
		PreparedStatement pstmt = null;
		int rset = 0;
		try { 
			String query = prop.getProperty("admin_updateThemeFontColor");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,adminTheme.getNavTitleColor());
			pstmt.setString(2,adminTheme.getNavProfileColor());
			pstmt.setString(3,adminTheme.getNavSideTitleColor());
			pstmt.setString(4,adminTheme.getNavSideColor());
			pstmt.setString(5,adminTheme.getNavChildColor());
			pstmt.setString(6,adminTheme.getTopMenuColor());
			pstmt.setString(7,adminTheme.getMainColor());
			pstmt.setString(8,adminTheme.getAdminNum());
			
			rset = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return rset;
	}
	// 관리자 테마 등록
	public int admin_insertTheme(Connection con) {
		PreparedStatement pstmt = null;
		int rset = 0;
		try { 
			String query = prop.getProperty("admin_insertTheme");
			pstmt = con.prepareStatement(query);			
			rset = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return rset;
	}
	// 프리셋 테마 저장
	public int admin_updateThemePreset(Connection con, AdminTheme adminTheme) {
		PreparedStatement pstmt = null;
		int rset = 0;
		try { 
			String query = prop.getProperty("admin_updateThemePreset");
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
	// 관리자 테마 불러오기
	public AdminTheme admin_selectTheme(Connection con, String memberNum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		AdminTheme adminTheme = null;
		
		try { 
			String query = prop.getProperty("admin_selectTheme");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memberNum);
			rset = pstmt.executeQuery();
			while(rset.next()){
				adminTheme = new AdminTheme();
				
				adminTheme.setFontFamily((rset.getString("FONT_FAMILY")));
				adminTheme.setFontSize((rset.getString("FONT_SIZE")));
				adminTheme.setFontWeight((rset.getString("FONT_WEIGHT")));
				adminTheme.setNavTitleBbc((rset.getString("NAV_TITLE_BGC")));
				adminTheme.setNavCenterBgc((rset.getString("NAV_CENTER_BGC")));
				adminTheme.setNavChildBgc((rset.getString("NAV_CHILD_BGC")));
				adminTheme.setNavBottomBgc((rset.getString("NAV_BOTTOM_BGC")));
				adminTheme.setTopMenuBgc((rset.getString("TOP_MENU_BGC")));
				adminTheme.setTopChildBgc((rset.getString("TOP_CHILD_BGC")));
				adminTheme.setMainBgc((rset.getString("MAIN_BGC")));
				adminTheme.setNavTitleColor((rset.getString("NAV_TITLE_COLOR")));
				adminTheme.setNavProfileColor((rset.getString("NAV_PROFILE_COLOR")));
				adminTheme.setNavSideTitleColor((rset.getString("NAV_SIDE_TITLE_COLOR")));
				adminTheme.setNavSideColor((rset.getString("NAV_SIDE_COLOR")));
				adminTheme.setNavChildColor((rset.getString("NAV_CHILD_COLOR")));
				adminTheme.setTopMenuColor((rset.getString("TOP_MENU_COLOR")));
				adminTheme.setMainColor((rset.getString("MAIN_COLOR")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return adminTheme;
	}

}
