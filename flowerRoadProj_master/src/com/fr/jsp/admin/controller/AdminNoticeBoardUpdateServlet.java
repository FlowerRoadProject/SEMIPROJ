package com.fr.jsp.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fr.jsp.admin.model.service.AdminNoticeBoardService;
import com.fr.jsp.board.model.vo.NoticeBoard;
import com.google.gson.Gson;

@WebServlet("/updateNoticeBoard.admin")
public class AdminNoticeBoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminNoticeBoardUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int noticeNum = Integer.parseInt(request.getParameter("noticeNum"));
		String noticeTitle = request.getParameter("noticeTitle");
		String noticeContent = request.getParameter("noticeContent");
		
		NoticeBoard noticeBoard = new NoticeBoard();
		noticeBoard.setbNum(noticeNum);
		noticeBoard.setbTitle(noticeTitle);
		noticeBoard.setbContent(noticeContent);
		
		AdminNoticeBoardService anbs = new AdminNoticeBoardService();
		// 공지사항 수정
		anbs.admin_updateNoticeBoard(noticeBoard);
		
		// Connection close Method
		anbs.closeCon();
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(noticeBoard, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
