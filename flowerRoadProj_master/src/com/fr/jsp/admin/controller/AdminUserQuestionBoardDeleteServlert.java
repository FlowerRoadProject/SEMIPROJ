package com.fr.jsp.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fr.jsp.admin.model.service.AdminMemberService;
import com.fr.jsp.admin.model.service.AdminUserQuestionBoardService;
import com.fr.jsp.member.model.vo.Member;
import com.google.gson.Gson;

@WebServlet("/deleteUserQuestionBoard.admin")
public class AdminUserQuestionBoardDeleteServlert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdminUserQuestionBoardDeleteServlert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		String adminNum = (String) session.getAttribute("memberNum");
		int userQuestionNum = Integer.parseInt(request.getParameter("userQuestionNum"));
		String userQuestionAnswerPw = request.getParameter("userQuestionAnswerPw");
		
		AdminMemberService ams = new AdminMemberService();
		// 2차 비밀번호 조회
		Member admin = ams.adminSecondPwCheck(adminNum);
		// Connection close Method
		ams.closeCon();
		
		boolean userQuestionCheck;
		if(admin.getSecondPw().equals(userQuestionAnswerPw)){
			AdminUserQuestionBoardService anbs = new AdminUserQuestionBoardService();
			
			// 1:1문의 삭제
			anbs.admin_deleteUserQuestionBoard(userQuestionNum);
			
			// Connection close Method
			anbs.closeCon();
			
			userQuestionCheck=true;
		}else{
			userQuestionCheck=false;
		}
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(userQuestionCheck, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
