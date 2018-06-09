package com.fr.jsp.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fr.jsp.admin.model.service.AdminService;
import com.fr.jsp.admin.model.vo.AdminRandomGameLeaderBoard;
import com.google.gson.Gson;

@WebServlet("/selectLeaderBoardList.admin")
public class AdminRandomGameSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminRandomGameSelectServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String difficulty = (request.getParameter("difficulty"));
		
		AdminService as = new AdminService();
		// 랜덤 게임 리스트
		ArrayList<AdminRandomGameLeaderBoard> adminLeaderBoard = new ArrayList<AdminRandomGameLeaderBoard>();
		adminLeaderBoard = as.admin_selectLeaderBoard(difficulty);
		// Connection close
		as.closeCon();
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(adminLeaderBoard, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
