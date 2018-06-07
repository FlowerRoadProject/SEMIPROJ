package com.fr.jsp.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fr.jsp.admin.model.service.AdminStatisticsService;
import com.fr.jsp.admin.model.vo.AdminStatisticsProduct;

@WebServlet("/productStatisticsStar.admin")
public class AdminProductStatisticsStarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminProductStatisticsStarServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminStatisticsService ass = new AdminStatisticsService();
		
		// 최고 별점 상품 1위
		AdminStatisticsProduct starP1 = new AdminStatisticsProduct();
		starP1 = ass.admin_selectStatisticsStar(1);
		// 최고 별점 상품 2위
		AdminStatisticsProduct starP2 = new AdminStatisticsProduct();
		starP2 = ass.admin_selectStatisticsStar(2);
		// 최고 별점 상품 3위
		AdminStatisticsProduct starP3 = new AdminStatisticsProduct();
		starP3 = ass.admin_selectStatisticsStar(3);
		// 최고 별점 상품 4위
		AdminStatisticsProduct starP4 = new AdminStatisticsProduct();
		starP4 = ass.admin_selectStatisticsStar(4);
		// 최고 별점 상품 5위
		AdminStatisticsProduct starP5 = new AdminStatisticsProduct();
		starP5 = ass.admin_selectStatisticsStar(5);
		
		request.setAttribute("starP1", starP1);
		request.setAttribute("starP2", starP2);
		request.setAttribute("starP3", starP3);
		request.setAttribute("starP4", starP4);
		request.setAttribute("starP5", starP5);
		
		request.getRequestDispatcher("views/admin_views/admin_Statistics_Product_Star.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
