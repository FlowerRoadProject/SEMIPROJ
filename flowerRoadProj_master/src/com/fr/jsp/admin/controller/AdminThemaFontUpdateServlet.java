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
		
		String fontFamily = (String) request.getParameter("fontFamily");
		String fontSize = (String) request.getParameter("fontSize");
		String fontWeight = (String) request.getParameter("fontWeight");
		
		AdminTheme adminTheme = new AdminTheme();
		adminTheme.setAdminNum(adminNum);
		if(fontFamily.equals("")) adminTheme.setFontFamily("궁서체");
		else adminTheme.setFontFamily(fontFamily);
		if(fontSize.equals("")) adminTheme.setFontSize("12pt");
		else adminTheme.setFontSize(fontSize);
		if(fontWeight.equals("")) adminTheme.setFontSize("400");
		else adminTheme.setFontWeight(fontWeight);
		
		AdminService as = new AdminService();
		// 폰트 테마 저장
		as.admin_updateThemeFont(adminTheme);
		
		request.getRequestDispatcher("views/admin_views/admin_Thema.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
