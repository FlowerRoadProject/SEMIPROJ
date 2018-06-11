package com.fr.jsp.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fr.jsp.admin.model.service.AdminService;
import com.fr.jsp.admin.model.vo.AdminTheme;

@WebServlet("/firstMain.admin")
public class AdminFirstMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminFirstMainServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		HttpSession session = request.getSession(false);
		String adminNum = (String) session.getAttribute("memberNum");
		
		AdminService as = new AdminService();
		// 관리자 테마 불러오기
		AdminTheme adminTheme = new AdminTheme();
		adminTheme = as.admin_selectTheme(adminNum);
		// Connection close
		as.closeCon();
		
		session.setAttribute("adminTheme", adminTheme);
		
		request.getRequestDispatcher("views/admin_views/admin_First_Main.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
