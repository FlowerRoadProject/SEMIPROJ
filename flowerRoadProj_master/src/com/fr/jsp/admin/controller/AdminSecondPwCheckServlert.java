package com.fr.jsp.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fr.jsp.admin.model.service.AdminMemberService;
import com.fr.jsp.member.model.vo.Member;
import com.google.gson.Gson;

@WebServlet("/secondPwCheck.admin")
public class AdminSecondPwCheckServlert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdminSecondPwCheckServlert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String adminNum = null;

		HttpSession session = request.getSession(false);
		adminNum = (String) session.getAttribute("adminNum");
		
		AdminMemberService ams = new AdminMemberService();
		Member admin = ams.adminSecondPwCheck(adminNum);
		// Connection close
		ams.closeCon();
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(admin, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
