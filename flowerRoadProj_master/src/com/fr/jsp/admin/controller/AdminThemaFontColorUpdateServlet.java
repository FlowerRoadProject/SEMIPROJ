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

@WebServlet("/fontColorThemaUpdate.admin")
public class AdminThemaFontColorUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdminThemaFontColorUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String adminNum = (String) session.getAttribute("memberNum");
		
		String navTitleColor = (String) request.getParameter("navTitleColor");
		String profileInfoColor = (String) request.getParameter("profileInfoColor");
		String sidebarMenuTitle = (String) request.getParameter("sidebarMenuTitle");
		String sidebarMenuColor = (String) request.getParameter("sidebarMenuColor");
		String sidebarchildmenuColor = (String) request.getParameter("sidebarchildmenuColor");
		String topMenuColor = (String) request.getParameter("topMenuColor");
		String bodyColor = (String) request.getParameter("bodyColor");
		
		AdminTheme adminTheme = new AdminTheme();
		adminTheme.setAdminNum(adminNum);
		if(navTitleColor.equals("")) adminTheme.setNavTitleColor("#ffffff");
		else adminTheme.setNavTitleColor(navTitleColor);
		if(profileInfoColor.equals("")) adminTheme.setNavProfileColor("#ffffff");
		else adminTheme.setNavProfileColor(profileInfoColor);
		if(sidebarMenuTitle.equals("")) adminTheme.setNavSideTitleColor("#ffffff");
		else adminTheme.setNavSideTitleColor(sidebarMenuTitle);
		if(sidebarMenuColor.equals("")) adminTheme.setNavSideColor("#e7e7e7");
		else adminTheme.setNavSideColor(sidebarMenuColor);
		if(sidebarchildmenuColor.equals("")) adminTheme.setNavChildColor("rgba(255,255,255,0.75)");
		else adminTheme.setNavChildColor(sidebarchildmenuColor);
		if(topMenuColor.equals("")) adminTheme.setTopMenuColor("#5a738e");
		else adminTheme.setTopMenuColor(topMenuColor);
		if(bodyColor.equals("")) adminTheme.setMainColor("#73879c");
		else adminTheme.setMainColor(bodyColor);
		
		AdminService as = new AdminService();
		// 폰트 색상 테마 저장
		as.admin_updateThemeFontColor(adminTheme);
		
		request.getRequestDispatcher("views/admin_views/admin_Thema.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
