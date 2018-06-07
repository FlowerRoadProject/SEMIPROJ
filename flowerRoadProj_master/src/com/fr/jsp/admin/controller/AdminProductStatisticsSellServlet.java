package com.fr.jsp.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fr.jsp.admin.model.service.AdminStatisticsService;
import com.fr.jsp.admin.model.vo.AdminStatisticsProduct;

@WebServlet("/productStatisticsSell.admin")
public class AdminProductStatisticsSellServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminProductStatisticsSellServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminStatisticsService ass = new AdminStatisticsService();
		
		// 최고 매출 상품 1위
		AdminStatisticsProduct sellP1 = new AdminStatisticsProduct();
		sellP1 = ass.admin_selectStatisticsSell(1);
		// 최고 매출 상품 2위
		AdminStatisticsProduct sellP2 = new AdminStatisticsProduct();
		sellP2 = ass.admin_selectStatisticsSell(2);
		// 최고 매출 상품 3위
		AdminStatisticsProduct sellP3 = new AdminStatisticsProduct();
		sellP3 = ass.admin_selectStatisticsSell(3);
		// 최고 매출 상품 4위
		AdminStatisticsProduct sellP4 = new AdminStatisticsProduct();
		sellP4 = ass.admin_selectStatisticsSell(4);
		// 최고 매출 상품 5위
		AdminStatisticsProduct sellP5 = new AdminStatisticsProduct();
		sellP5 = ass.admin_selectStatisticsSell(5);
		
		request.setAttribute("sellP1", sellP1);
		request.setAttribute("sellP2", sellP2);
		request.setAttribute("sellP3", sellP3);
		request.setAttribute("sellP4", sellP4);
		request.setAttribute("sellP5", sellP5);
		
		request.getRequestDispatcher("views/admin_views/admin_Statistics_Product_Sell.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
