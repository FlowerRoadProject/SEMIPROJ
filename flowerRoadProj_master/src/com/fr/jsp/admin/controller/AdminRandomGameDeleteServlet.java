package com.fr.jsp.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fr.jsp.admin.model.service.AdminService;
import com.google.gson.Gson;

@WebServlet("/deleteLeaderBoardList.admin")
public class AdminRandomGameDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminRandomGameDeleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		HttpSession session = request.getSession(false);
		String adminNum = (String) session.getAttribute("memberNum");
		boolean adminCheck = false;
		if(adminNum.equals("A001")){
			AdminService as = new AdminService();
			// 랜덤 게임 점수 초기화
			as.admin_deleteLeaderBoard();
			// Connection close
			as.closeCon();
			adminCheck=true;
		}
		else{
			adminCheck=false;
		}
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(adminCheck, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
