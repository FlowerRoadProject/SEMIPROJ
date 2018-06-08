package com.fr.jsp.admin.model.service;

import static com.fr.jdbc.common.JDBCTemplate.close;
import static com.fr.jdbc.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.fr.jsp.admin.model.dao.AdminDao;
import com.fr.jsp.admin.model.vo.AdminFortuen;
import com.fr.jsp.admin.model.vo.AdminRandomGame;

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
	
}
