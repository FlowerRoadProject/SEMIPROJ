package com.fr.jsp.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fr.jsp.admin.model.service.AdminStatisticsService;
import com.fr.jsp.admin.model.vo.AdminStatisticsMember;

@WebServlet("/memberStatisticsReview.admin")
public class AdminMemberStatisticsReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminMemberStatisticsReviewServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminStatisticsService ass = new AdminStatisticsService();
		
		// 최다 댓글 회원 1위
		AdminStatisticsMember reviewM1 = new AdminStatisticsMember();
		reviewM1 = ass.admin_selectStatisticsReview(1);
		// 최다 댓글 회원 2위
		AdminStatisticsMember reviewM2 = new AdminStatisticsMember();
		reviewM2 = ass.admin_selectStatisticsReview(2);
		// 최다 댓글 회원 3위
		AdminStatisticsMember reviewM3 = new AdminStatisticsMember();
		reviewM3 = ass.admin_selectStatisticsReview(3);
		// 최다 댓글 회원 4위
		AdminStatisticsMember reviewM4 = new AdminStatisticsMember();
		reviewM4 = ass.admin_selectStatisticsReview(4);
		// 최다 댓글 회원 5위
		AdminStatisticsMember reviewM5 = new AdminStatisticsMember();
		reviewM5 = ass.admin_selectStatisticsReview(5);
		
		// Connection close Method
		ass.closeCon();
		
		request.setAttribute("reviewM1", reviewM1);
		request.setAttribute("reviewM2", reviewM2);
		request.setAttribute("reviewM3", reviewM3);
		request.setAttribute("reviewM4", reviewM4);
		request.setAttribute("reviewM5", reviewM5);
		
		request.getRequestDispatcher("views/admin_views/admin_Statistics_Member_Review.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
