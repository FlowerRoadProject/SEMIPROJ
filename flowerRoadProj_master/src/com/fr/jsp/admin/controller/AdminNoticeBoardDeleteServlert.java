package com.fr.jsp.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fr.jsp.admin.model.service.AdminMemberService;
import com.fr.jsp.admin.model.service.AdminNoticeBoardService;
import com.fr.jsp.member.model.vo.Member;
import com.google.gson.Gson;

@WebServlet("/deleteNoticeBoard.admin")
public class AdminNoticeBoardDeleteServlert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdminNoticeBoardDeleteServlert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		String adminNum = (String) session.getAttribute("memberNum");
		int noticeNum = Integer.parseInt(request.getParameter("noticeNum"));
		String noticeAnswerPw = request.getParameter("noticeAnswerPw");
		
		AdminMemberService ams = new AdminMemberService();
		// 2차 비밀번호 조회
		Member admin = ams.adminSecondPwCheck(adminNum);
		// Connection close Method
		ams.closeCon();
		
		boolean noticeCheck;
		if(admin.getSecondPw().equals(noticeAnswerPw)){
			AdminNoticeBoardService anbs = new AdminNoticeBoardService();
			
			// 공지사항 삭제
			anbs.admin_deleteNoticeBoard(noticeNum);
			
			// Connection close Method
			anbs.closeCon();
			
			noticeCheck=true;
		}else{
			noticeCheck=false;
		}
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(noticeCheck, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
