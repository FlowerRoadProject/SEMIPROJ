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

@WebServlet("/bgcThemaUpdate.admin")
public class AdminThemaBgcUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdminThemaBgcUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String adminNum = (String) session.getAttribute("memberNum");
		
		String navTitleBgc = (String) request.getParameter("navTitleBgc");
		String navCenterBgc = (String) request.getParameter("navCenterBgc");
		String childMenuBgc = (String) request.getParameter("childMenuBgc");
		String navBottomBgc = (String) request.getParameter("navBottomBgc");
		String topMenuBgc = (String) request.getParameter("topMenuBgc");
		String topChildBgc = (String) request.getParameter("topChildBgc");
		String mainBgc = (String) request.getParameter("mainBgc");
		
		AdminTheme adminTheme = new AdminTheme();
		adminTheme.setAdminNum(adminNum);
		if(navTitleBgc.equals("")) adminTheme.setNavTitleBbc("#2a3f54");
		else adminTheme.setNavTitleBbc(navTitleBgc);
		if(navCenterBgc.equals("")) adminTheme.setNavCenterBgc("#2a3f54");
		else adminTheme.setNavCenterBgc(navCenterBgc);
		if(childMenuBgc.equals("")) adminTheme.setNavChildBgc("#425668");
		else adminTheme.setNavChildBgc(childMenuBgc);
		if(navBottomBgc.equals("")) adminTheme.setNavBottomBgc("#2a3f54");
		else adminTheme.setNavBottomBgc(navBottomBgc);
		if(topMenuBgc.equals("")) adminTheme.setTopMenuBgc("#ededed");
		else adminTheme.setTopMenuBgc(topMenuBgc);
		if(topChildBgc.equals("")) adminTheme.setTopChildBgc("#ffffff");
		else adminTheme.setTopChildBgc(topChildBgc);
		if(mainBgc.equals("")) adminTheme.setMainBgc("#f7f7f7");
		else adminTheme.setMainBgc(mainBgc);
		
		AdminService as = new AdminService();
		// 배경 테마 저장
		as.admin_updateThemeBgc(adminTheme);
		
		request.getRequestDispatcher("views/admin_views/admin_Thema.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
