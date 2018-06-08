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

@WebServlet("/fontThemaUpdate.admin")
public class AdminThemaFontUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdminThemaFontUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String adminNum = (String) session.getAttribute("memberNum");
		
		String fontFamily = (String) request.getAttribute("fontFamily");
		String fontSize = (String) request.getAttribute("fontSize");
		String fontWeight = (String) request.getAttribute("fontWeight");
		
		AdminTheme adminTheme = new AdminTheme();
		adminTheme.setAdminNum(adminNum);
		adminTheme.setFontFamily(fontFamily);
		adminTheme.setFontSize(fontSize);
		adminTheme.setFontWeight(fontWeight);
		System.out.println(fontFamily);
		
		AdminService as = new AdminService();
		// 테마 저장
		as.admin_updateTheme(adminTheme);
		
		request.getRequestDispatcher("views/admin_views/admin_Thema.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
