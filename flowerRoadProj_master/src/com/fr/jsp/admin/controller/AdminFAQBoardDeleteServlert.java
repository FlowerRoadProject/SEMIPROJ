package com.fr.jsp.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fr.jsp.admin.model.service.AdminMemberService;
import com.fr.jsp.admin.model.service.AdminFaqBoardService;
import com.fr.jsp.member.model.vo.Member;
import com.google.gson.Gson;

@WebServlet("/deleteFAQBoard.admin")
public class AdminFAQBoardDeleteServlert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdminFAQBoardDeleteServlert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		String adminNum = (String) session.getAttribute("adminNum");
		int faqNum = Integer.parseInt(request.getParameter("faqNum"));
		String faqAnswerPw = request.getParameter("faqAnswerPw");
		
		AdminMemberService ams = new AdminMemberService();
		// 2차 비밀번호 조회
		Member admin = ams.adminSecondPwCheck(adminNum);
		// Connection close Method
		ams.closeCon();
		
		boolean faqCheck;
		if(admin.getSecondPw().equals(faqAnswerPw)){
			AdminFaqBoardService afbs = new AdminFaqBoardService();
			
			// FAQ 삭제
			afbs.admin_deleteFAQBoard(faqNum);
			
			// Connection close Method
			afbs.closeCon();
			
			faqCheck=true;
		}else{
			faqCheck=false;
		}
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(faqCheck, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
