package com.fr.jsp.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fr.jsp.admin.model.service.AdminUserQuestionBoardService;
import com.fr.jsp.board.model.vo.UserQuestionBoard;
import com.google.gson.Gson;

@WebServlet("/updateUserQuestionBoard.admin")
public class AdminUserQuestionBoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminUserQuestionBoardUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		String adminNum = (String) session.getAttribute("memberNum");
		int userQuestionNum = Integer.parseInt(request.getParameter("userQuestionNum"));
		String userQuestionReply = request.getParameter("userQuestionReply");

		UserQuestionBoard userQuestionBoard = new UserQuestionBoard();
		userQuestionBoard.setMemberNum(adminNum);
		userQuestionBoard.setbNum(userQuestionNum);
		userQuestionBoard.setReplyContent(userQuestionReply);
		
		AdminUserQuestionBoardService auqbs = new AdminUserQuestionBoardService();
		// 1:1문의 수정
		auqbs.admin_updateUserQuestionBoard(userQuestionBoard);
		// 1:1문의 한 개 조회
		UserQuestionBoard newUserQuestionBoard = auqbs.admin_selectUserQuestionBoard(userQuestionBoard.getbNum());
		// Connection close Method
		auqbs.closeCon();
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(newUserQuestionBoard, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
