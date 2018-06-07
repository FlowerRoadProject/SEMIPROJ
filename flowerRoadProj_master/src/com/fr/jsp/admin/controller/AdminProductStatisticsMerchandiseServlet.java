package com.fr.jsp.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fr.jsp.admin.model.service.AdminStatisticsService;
import com.fr.jsp.admin.model.vo.AdminStatisticsProduct;

@WebServlet("/productStatisticsMerchandise.admin")
public class AdminProductStatisticsMerchandiseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminProductStatisticsMerchandiseServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminStatisticsService ass = new AdminStatisticsService();
		
		// 최다 판매 상품 1위
		AdminStatisticsProduct merchandiseP1 = new AdminStatisticsProduct();
		merchandiseP1 = ass.admin_selectStatisticsMerchandise(1);
		// 최다 판매 상품 2위
		AdminStatisticsProduct merchandiseP2 = new AdminStatisticsProduct();
		merchandiseP2 = ass.admin_selectStatisticsMerchandise(2);
		// 최다 판매 상품 3위
		AdminStatisticsProduct merchandiseP3 = new AdminStatisticsProduct();
		merchandiseP3 = ass.admin_selectStatisticsMerchandise(3);
		// 최다 판매 상품 4위
		AdminStatisticsProduct merchandiseP4 = new AdminStatisticsProduct();
		merchandiseP4 = ass.admin_selectStatisticsMerchandise(4);
		// 최다 판매 상품 5위
		AdminStatisticsProduct merchandiseP5 = new AdminStatisticsProduct();
		merchandiseP5 = ass.admin_selectStatisticsMerchandise(5);
		
		request.setAttribute("merchandiseP1", merchandiseP1);
		request.setAttribute("merchandiseP2", merchandiseP2);
		request.setAttribute("merchandiseP3", merchandiseP3);
		request.setAttribute("merchandiseP4", merchandiseP4);
		request.setAttribute("merchandiseP5", merchandiseP5);
		
		request.getRequestDispatcher("views/admin_views/admin_Statistics_Product_Merchandise.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
