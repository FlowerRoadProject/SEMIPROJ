package com.fr.jsp.admin.model.dao;

import static com.fr.jdbc.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import com.fr.jsp.admin.model.vo.AdminFortuen;

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

}
