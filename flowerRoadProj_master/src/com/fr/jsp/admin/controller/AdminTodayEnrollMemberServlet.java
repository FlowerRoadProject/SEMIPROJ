package com.fr.jsp.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fr.jsp.admin.model.service.AdminMemberService;
import com.fr.jsp.admin.model.vo.AdminMember;

@WebServlet("/todayEnrollMember.admin")
public class AdminTodayEnrollMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminTodayEnrollMemberServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminMemberService ams = new AdminMemberService();
		// 모든 회원 수 조회
		int admin_allMemberCount = ams.admin_allMemberCount();
		// 회원 수 조회
		int admin_memberCount = ams.admin_memberList().size();
		// 관리자 수 조회
		int admin_adminCount = ams.admin_adminList().size();
		// 오늘 등록한 회원 수
		int admin_todayEnrollCount = ams.admin_todayEnrollMemberList().size();
		// 탈퇴한 회원 수
		int admin_withdrawMemberCount = ams.admin_withdrawMemberCount();
		
		// 회원 리스트
		ArrayList<AdminMember> admin_memberList = ams.admin_todayEnrollMemberList();

		// connection close
		ams.closeCon();
		
		request.setAttribute("admin_allMemberCount", admin_allMemberCount);
		request.setAttribute("admin_memberCount", admin_memberCount);
		request.setAttribute("admin_adminCount", admin_adminCount);
		request.setAttribute("admin_todayEnrollCount", admin_todayEnrollCount);
		request.setAttribute("admin_withdrawMemberCount", admin_withdrawMemberCount);
		
		request.setAttribute("admin_memberList", admin_memberList);
		
		request.getRequestDispatcher("views/admin_views/admin_Member.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
