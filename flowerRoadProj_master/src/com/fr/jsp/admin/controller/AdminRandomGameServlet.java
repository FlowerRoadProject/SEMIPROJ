package com.fr.jsp.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fr.jsp.admin.model.service.AdminMemberService;
import com.fr.jsp.admin.model.vo.AdminAdmin;
import com.google.gson.Gson;

@WebServlet("/randomGame.admin")
public class AdminRandomGameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminRandomGameServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String adminNum = (String) session.getAttribute("memberNum");
		
//		int topNum = Integer.parseInt(request.getParameter("topNum"));
//		int leftNum = Integer.parseInt(request.getParameter("leftNum"));
//		int goalTopNum = Integer.parseInt(request.getParameter("goalTopNum"));
//		int goalLeftNum = Integer.parseInt(request.getParameter("goalLeftNum"));
//		
//		AdminMemberService ams = new AdminMemberService();
//		
//		
//		AdminAdmin admin = new AdminAdmin();
//		admin.setAdminNum(aNum);
//		if(aImage==""){
//			// 관리자 사진 받아오기
//			String adminImage = ams.admin_selectAdminImage(aNum);
//			admin.setImagePath(adminImage);
//		}else{
//			admin.setImagePath(aImage);
//		}
//		
//		admin.setAdminPw(aPw);
//		admin.setAdminPhone(aPhone);
//		admin.setAdminEmail(aEmail);
//		admin.setAdminAddress(aAddress);
//		admin.setSecondPw(aSecurity);
//		
//		boolean check;
//		if(adminNum.equals(aNum)){
//			// 관리자 정보 수정
//			ams.admin_updateAdmin(admin);
//			// connection close
//			ams.closeCon();
//			check = true;
//		}else check=false;
//		
//		
//		response.setContentType("application/json; charset=UTF-8");
//		new Gson().toJson(check, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
