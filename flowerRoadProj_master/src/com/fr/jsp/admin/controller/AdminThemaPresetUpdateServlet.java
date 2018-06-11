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

@WebServlet("/presetThemaUpdate.admin")
public class AdminThemaPresetUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdminThemaPresetUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String adminNum = (String) session.getAttribute("memberNum");
		
		String preset = (String) request.getParameter("preset");
		
		AdminTheme adminTheme = new AdminTheme();
		adminTheme.setAdminNum(adminNum);
		
		switch(preset){
		case "BLACK_ROSE": 
			adminTheme.setFontFamily("poor story");
			adminTheme.setFontSize("14pt");
			adminTheme.setFontWeight("normal");
			adminTheme.setNavTitleBbc("#191919");
			adminTheme.setNavCenterBgc("#191919");
			adminTheme.setNavChildBgc("#1b1b1b");
			adminTheme.setNavBottomBgc("#000000");
			adminTheme.setTopMenuBgc("#191919");
			adminTheme.setTopChildBgc("#1b1b1b");
			adminTheme.setMainBgc("#272727");
			adminTheme.setNavTitleColor("#ffffff");
			adminTheme.setNavProfileColor("#8ffffa");
			adminTheme.setNavSideTitleColor("#fffac4");
			adminTheme.setNavSideColor("#ffffff");
			adminTheme.setNavChildColor("#fffac4");
			adminTheme.setTopMenuColor("#ffffff");
			adminTheme.setMainColor("#0098a0");
			break;
		case "MORNING_GRORY": 
			adminTheme.setFontFamily("cute font");
			adminTheme.setFontSize("14pt");
			adminTheme.setFontWeight("normal");
			adminTheme.setNavTitleBbc("#88fffe");
			adminTheme.setNavCenterBgc("#88fffe");
			adminTheme.setNavChildBgc("#00cac9");
			adminTheme.setNavBottomBgc("#00dbd9");
			adminTheme.setTopMenuBgc("#88fffe");
			adminTheme.setTopChildBgc("#00cac9");
			adminTheme.setMainBgc("#00cac9");
			adminTheme.setNavTitleColor("#f0ff5f");
			adminTheme.setNavProfileColor("#ae4848");
			adminTheme.setNavSideTitleColor("#ffc4c4");
			adminTheme.setNavSideColor("#4876ae");
			adminTheme.setNavChildColor("#fffac4");
			adminTheme.setTopMenuColor("#f0ff5f");
			adminTheme.setMainColor("#c1dd00");
			break;
		case "MUGUNGHWA": 
			adminTheme.setFontFamily("do hyeon");
			adminTheme.setFontSize("14pt");
			adminTheme.setFontWeight("normal");
			adminTheme.setNavTitleBbc("#fd92ff");
			adminTheme.setNavCenterBgc("#fd92ff");
			adminTheme.setNavChildBgc("#d459d6");
			adminTheme.setNavBottomBgc("#fc74ff");
			adminTheme.setTopMenuBgc("#fd92ff");
			adminTheme.setTopChildBgc("#d459d6");
			adminTheme.setMainBgc("#fecbff");
			adminTheme.setNavTitleColor("#7dff94");
			adminTheme.setNavProfileColor("#484bae");
			adminTheme.setNavSideTitleColor("#cdc4ff");
			adminTheme.setNavSideColor("#92488e");
			adminTheme.setNavChildColor("#510a4d");
			adminTheme.setTopMenuColor("#7dff94");
			adminTheme.setMainColor("#1c631e");
			break;
		default: 
			adminTheme.setFontFamily("궁서체");
			adminTheme.setFontSize("12pt");
			adminTheme.setFontWeight("400");
			adminTheme.setNavTitleBbc("#2a3f54");
			adminTheme.setNavCenterBgc("#2a3f54");
			adminTheme.setNavChildBgc("#425668");
			adminTheme.setNavBottomBgc("#2a3f54");
			adminTheme.setTopMenuBgc("#ededed");
			adminTheme.setTopChildBgc("#ffffff");
			adminTheme.setMainBgc("#f7f7f7");
			adminTheme.setNavTitleColor("#ffffff");
			adminTheme.setNavProfileColor("#ffffff");
			adminTheme.setNavSideTitleColor("#ffffff");
			adminTheme.setNavSideColor("#e7e7e7");
			adminTheme.setNavChildColor("rgba(255,255,255,0.75)");
			adminTheme.setTopMenuColor("#5a738e");
			adminTheme.setMainColor("#73879c");
			break;
		}
		
		AdminService as = new AdminService();
		// 프리셋 테마 저장
		as.admin_updateThemePreset(adminTheme);
		
		request.getRequestDispatcher("views/admin_views/admin_Thema.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
