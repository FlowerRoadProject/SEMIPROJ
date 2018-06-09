package com.fr.jsp.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fr.jsp.admin.model.service.AdminStatisticsService;
import com.fr.jsp.admin.model.vo.AdminStatisticsMember;

@WebServlet("/memberStatisticsPurchase.admin")
public class AdminMemberStatisticsPurchaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminMemberStatisticsPurchaseServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminStatisticsService ass = new AdminStatisticsService();
		
		// 최고 구입 회원 1위
		AdminStatisticsMember purchaseM1 = new AdminStatisticsMember();
		purchaseM1 = ass.admin_selectStatisticsPurchase(1);
		// 최고 구입 회원 2위
		AdminStatisticsMember purchaseM2 = new AdminStatisticsMember();
		purchaseM2 = ass.admin_selectStatisticsPurchase(2);
		// 최고 구입 회원 3위
		AdminStatisticsMember purchaseM3 = new AdminStatisticsMember();
		purchaseM3 = ass.admin_selectStatisticsPurchase(3);
		// 최고 구입 회원 4위
		AdminStatisticsMember purchaseM4 = new AdminStatisticsMember();
		purchaseM4 = ass.admin_selectStatisticsPurchase(4);
		// 최고 구입 회원 5위
		AdminStatisticsMember purchaseM5 = new AdminStatisticsMember();
		purchaseM5 = ass.admin_selectStatisticsPurchase(5);
		
		// Connection close Method
		ass.closeCon();
		
		request.setAttribute("purchaseM1", purchaseM1);
		request.setAttribute("purchaseM2", purchaseM2);
		request.setAttribute("purchaseM3", purchaseM3);
		request.setAttribute("purchaseM4", purchaseM4);
		request.setAttribute("purchaseM5", purchaseM5);
		
		request.getRequestDispatcher("views/admin_views/admin_Statistics_Member_Purchase.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
