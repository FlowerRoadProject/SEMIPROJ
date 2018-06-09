package com.fr.jsp.admin.model.service;

import static com.fr.jdbc.common.JDBCTemplate.close;
import static com.fr.jdbc.common.JDBCTemplate.commit;
import static com.fr.jdbc.common.JDBCTemplate.getConnection;
import static com.fr.jdbc.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.fr.jsp.admin.model.dao.AdminDao;
import com.fr.jsp.admin.model.vo.AdminFortuen;
import com.fr.jsp.admin.model.vo.AdminTheme;

public class AdminService {
	private Connection con;
	private AdminDao aDao;
	
	public AdminService() {
		super();
		con = getConnection();
		aDao = new AdminDao();
	}
	// Connection close Method
	public void closeCon(){
		close(con);
	}
	// 오늘의 명언
	public AdminFortuen admin_randomFortuen() {
		AdminFortuen adminFortuen = new AdminFortuen();
		int fortuenNum = (int)(Math.random()*418)+1;
		adminFortuen = aDao.admin_randomFortuen(con, fortuenNum);
		return adminFortuen;
	}
	// 테마 저장
	public void admin_updateTheme(AdminTheme adminTheme) {
		int updateThemeCount = aDao.admin_updateTheme(con, adminTheme);
		if(updateThemeCount>0) commit(con);
		else rollback(con);
	}
	
}
