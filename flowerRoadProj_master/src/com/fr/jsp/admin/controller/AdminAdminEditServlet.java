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

@WebServlet("/editAdmin.admin")
public class AdminAdminEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminAdminEditServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String adminNum = (String) session.getAttribute("adminNum");
		
		String aNum = request.getParameter("aNum");
		String aImage = request.getParameter("aImage");
		String aPw = request.getParameter("aPw");
		String aPhone = request.getParameter("aPhone");
		String aEmail = request.getParameter("aEmail");
		String aAddress = request.getParameter("aAddress");
		String aSecurity = request.getParameter("aSecurity");
		
		AdminMemberService ams = new AdminMemberService();
		
		
		AdminAdmin admin = new AdminAdmin();
		admin.setAdminNum(aNum);
		if(aImage==""){
			// 관리자 사진 받아오기
			String adminImage = ams.admin_selectAdminImage(aNum);
			admin.setImagePath(adminImage);
		}else{
			admin.setImagePath(aImage);
		}
		
		admin.setAdminPw(aPw);
		admin.setAdminPhone(aPhone);
		admin.setAdminEmail(aEmail);
		admin.setAdminAddress(aAddress);
		admin.setSecondPw(aSecurity);
		
		boolean check;
		if(adminNum.equals(aNum)){
			// 관리자 정보 수정
			ams.admin_updateAdmin(admin);
			// connection close
			ams.closeCon();
			check = true;
		}else check=false;
		
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(check, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
