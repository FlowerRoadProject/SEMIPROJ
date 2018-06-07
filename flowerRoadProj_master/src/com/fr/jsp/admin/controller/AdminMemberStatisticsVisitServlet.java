package com.fr.jsp.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fr.jsp.admin.model.service.AdminStatisticsService;
import com.fr.jsp.admin.model.vo.AdminStatisticsMember;

@WebServlet("/memberStatisticsVisit.admin")
public class AdminMemberStatisticsVisitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminMemberStatisticsVisitServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminStatisticsService ass = new AdminStatisticsService();
		
		// 최다 방문 회원 1위
		AdminStatisticsMember visitM1 = new AdminStatisticsMember();
		visitM1 = ass.admin_selectStatisticsVisit(1);
		// 최다 방문 회원 2위
		AdminStatisticsMember visitM2 = new AdminStatisticsMember();
		visitM2 = ass.admin_selectStatisticsVisit(2);
		// 최다 방문 회원 3위
		AdminStatisticsMember visitM3 = new AdminStatisticsMember();
		visitM3 = ass.admin_selectStatisticsVisit(3);
		// 최다 방문 회원 4위
		AdminStatisticsMember visitM4 = new AdminStatisticsMember();
		visitM4 = ass.admin_selectStatisticsVisit(4);
		// 최다 방문 회원 5위
		AdminStatisticsMember visitM5 = new AdminStatisticsMember();
		visitM5 = ass.admin_selectStatisticsVisit(5);
		
		// Connection close Method
		ass.closeCon();
		
		request.setAttribute("visitM1", visitM1);
		request.setAttribute("visitM2", visitM2);
		request.setAttribute("visitM3", visitM3);
		request.setAttribute("visitM4", visitM4);
		request.setAttribute("visitM5", visitM5);
		
		request.getRequestDispatcher("views/admin_views/admin_Statistics_Member_Visit.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
