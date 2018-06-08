package com.fr.jsp.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fr.jsp.admin.model.service.AdminStatisticsService;
import com.fr.jsp.admin.model.vo.AdminStatisticsMember;

@WebServlet("/memberStatisticsBuy.admin")
public class AdminMemberStatisticsBuyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminMemberStatisticsBuyServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminStatisticsService ass = new AdminStatisticsService();
		
		// 최다 구매 회원 1위
		AdminStatisticsMember buyM1 = new AdminStatisticsMember();
		buyM1 = ass.admin_selectStatisticsBuy(1);
		// 최다 구매 회원 2위
		AdminStatisticsMember buyM2 = new AdminStatisticsMember();
		buyM2 = ass.admin_selectStatisticsBuy(2);
		// 최다 구매 회원 3위
		AdminStatisticsMember buyM3 = new AdminStatisticsMember();
		buyM3 = ass.admin_selectStatisticsBuy(3);
		// 최다 구매 회원 4위
		AdminStatisticsMember buyM4 = new AdminStatisticsMember();
		buyM4 = ass.admin_selectStatisticsBuy(4);
		// 최다 구매 회원 5위
		AdminStatisticsMember buyM5 = new AdminStatisticsMember();
		buyM5 = ass.admin_selectStatisticsBuy(5);
		
		// Connection close Method
		ass.closeCon();
		
		request.setAttribute("buyM1", buyM1);
		request.setAttribute("buyM2", buyM2);
		request.setAttribute("buyM3", buyM3);
		request.setAttribute("buyM4", buyM4);
		request.setAttribute("buyM5", buyM5);
		
		request.getRequestDispatcher("views/admin_views/admin_Statistics_Member_Buy.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
