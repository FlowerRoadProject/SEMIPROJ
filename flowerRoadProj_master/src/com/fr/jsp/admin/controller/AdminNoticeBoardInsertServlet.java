package com.fr.jsp.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fr.jsp.admin.model.service.AdminNoticeBoardService;
import com.fr.jsp.board.model.vo.NoticeBoard;
import com.google.gson.Gson;

@WebServlet("/insertNoticeBoard.admin")
public class AdminNoticeBoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminNoticeBoardInsertServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		String adminNum = (String) session.getAttribute("adminNum");
		String noticeTitle = request.getParameter("noticeTitle");
		String noticeContent = request.getParameter("noticeContent");
		
		NoticeBoard noticeBoard = new NoticeBoard();
		noticeBoard.setMemberNum(adminNum);
		noticeBoard.setbTitle(noticeTitle);
		noticeBoard.setbContent(noticeContent);
		
		AdminNoticeBoardService anbs = new AdminNoticeBoardService();
		// 공지사항 등록
		anbs.admin_insertNoticeBoard(noticeBoard);
		
		// 공지사항 게시판 게시글 수
		int admin_noticeBoardCount = anbs.admin_noticeBoardAllList().size();
		
		// Connection close Method
		anbs.closeCon();
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(admin_noticeBoardCount, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
