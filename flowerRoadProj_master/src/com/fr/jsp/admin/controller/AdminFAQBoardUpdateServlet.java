package com.fr.jsp.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fr.jsp.admin.model.service.AdminFaqBoardService;
import com.fr.jsp.board.model.vo.FaqBoard;
import com.google.gson.Gson;

@WebServlet("/updateFAQBoard.admin")
public class AdminFAQBoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminFAQBoardUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		String adminNum = (String) session.getAttribute("adminNum");
		int faqNum = Integer.parseInt(request.getParameter("faqNum"));
		String faqCatecory = request.getParameter("faqCatecory");
		String faqQuestion = request.getParameter("faqQuestion");
		String faqAnswer = request.getParameter("faqAnswer");
		
		FaqBoard faqBoard = new FaqBoard();
		faqBoard.setMemberNum(adminNum);
		faqBoard.setbNum(faqNum);
		faqBoard.setContentCategory(faqCatecory);
		faqBoard.setbTitle(faqQuestion);
		faqBoard.setbContent(faqAnswer);
		
		AdminFaqBoardService afbs = new AdminFaqBoardService();
		// FAQ 수정
		afbs.admin_updateFAQBoard(faqBoard);
		// FAQ 한 개 조회
		FaqBoard newFAQBoard = afbs.admin_selectFaqBoard(faqBoard.getbNum());
		// Connection close Method
		afbs.closeCon();
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(newFAQBoard, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
