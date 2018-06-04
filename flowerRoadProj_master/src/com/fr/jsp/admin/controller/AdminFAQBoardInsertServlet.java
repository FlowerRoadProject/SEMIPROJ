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

@WebServlet("/insertFAQBoard.admin")
public class AdminFAQBoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminFAQBoardInsertServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		String adminNum = (String) session.getAttribute("adminNum");
		String faqCatecory = request.getParameter("faqCatecory");
		String faqQuestion = request.getParameter("faqQuestion");
		String faqAnswer = request.getParameter("faqAnswer");
		
		FaqBoard faqBoard = new FaqBoard();
		faqBoard.setMemberNum(adminNum);
		faqBoard.setContentCategory(faqCatecory);
		faqBoard.setbTitle(faqQuestion);
		faqBoard.setbContent(faqAnswer);
		
		AdminFaqBoardService afbs = new AdminFaqBoardService();
		// FAQ 등록
		afbs.admin_insertFAQBoard(faqBoard);
		
		// FAQ 게시판 게시글 수
		int admin_faqBoardCount = afbs.admin_faqBoardAllList().size();
		
		// Connection close Method
		afbs.closeCon();
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(admin_faqBoardCount, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
