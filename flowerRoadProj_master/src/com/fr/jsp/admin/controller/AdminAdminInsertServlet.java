package com.fr.jsp.admin.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fr.jsp.admin.model.service.AdminMemberService;
import com.fr.jsp.admin.model.service.AdminService;
import com.fr.jsp.admin.model.vo.AdminAdmin;
import com.google.gson.Gson;

@WebServlet("/insertAdmin.admin")
public class AdminAdminInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminAdminInsertServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String insertAImage = request.getParameter("insertAImage");
		String insertAID = request.getParameter("insertAID");
		String insertAPW = request.getParameter("insertAPW");
		String insertAName = request.getParameter("insertAName");
		String insertAGender = request.getParameter("insertAGender");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date u_date = null;
		try {
			u_date = sdf.parse(request.getParameter("insertABirthDate"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
        java.sql.Date insertABirthDate = new java.sql.Date(u_date.getTime());
		String insertAPhone = request.getParameter("insertAPhone");
		String insertAEmail = request.getParameter("insertAEmail");
		String insertAAddress = request.getParameter("insertAAddress");
		String insertASecondPW = request.getParameter("insertASecondPW");
		
		AdminAdmin admin = new AdminAdmin();
		admin.setImagePath(insertAImage);
		admin.setAdminId(insertAID);
		admin.setAdminPw(insertAPW);
		admin.setAdminName(insertAName);
		admin.setAdminGender(insertAGender);
		admin.setAdminBirthDate(insertABirthDate);
		admin.setAdminPhone(insertAPhone);
		admin.setAdminEmail(insertAEmail);
		admin.setAdminAddress(insertAAddress);
		admin.setSecondPw(insertASecondPW);
		
		AdminMemberService ams = new AdminMemberService();
		// 관리자 등록
		ams.admin_insertAdmin(admin);
		// Connection close Method
		ams.closeCon();
		
		AdminService as = new AdminService();
		// 관리자 테마 등록
		as.admin_insertTheme();
		// Connection close Method
		as.closeCon();
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(admin, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
