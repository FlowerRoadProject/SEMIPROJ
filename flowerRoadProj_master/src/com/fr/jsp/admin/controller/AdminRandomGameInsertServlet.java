package com.fr.jsp.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fr.jsp.admin.model.service.AdminService;
import com.fr.jsp.admin.model.vo.AdminRandomGameLeaderBoard;
import com.google.gson.Gson;

@WebServlet("/insertRandomGameScore.admin")
public class AdminRandomGameInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminRandomGameInsertServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String adminNum = (String) session.getAttribute("memberNum");
		
		int clickCount = Integer.parseInt(request.getParameter("finalCount"));
		String difficulty = (request.getParameter("difficulty"));
		
		AdminRandomGameLeaderBoard randomGameLeaderBoard = new AdminRandomGameLeaderBoard();
		
		randomGameLeaderBoard.setAdminNum(adminNum);
		randomGameLeaderBoard.setClickCount(clickCount);
		randomGameLeaderBoard.setDifficulty(difficulty);
		
		AdminService as = new AdminService();
		// 메인 랜덤게임 점수 입력
		as.admin_insertRandomGameScore(randomGameLeaderBoard);
		
		// 랜덤 게임 리스트
		ArrayList<AdminRandomGameLeaderBoard> adminLeaderBoard = new ArrayList<AdminRandomGameLeaderBoard>();
		adminLeaderBoard = as.admin_selectLeaderBoard(difficulty);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(adminLeaderBoard, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
