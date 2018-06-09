package com.fr.jsp.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fr.jsp.admin.model.service.AdminStatisticsService;
import com.fr.jsp.admin.model.vo.AdminStatisticsProduct;

@WebServlet("/productStatisticsClick.admin")
public class AdminProductStatisticsClickServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminProductStatisticsClickServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminStatisticsService ass = new AdminStatisticsService();
		
		// 최다 조회 상품 1위
		AdminStatisticsProduct clickP1 = new AdminStatisticsProduct();
		clickP1 = ass.admin_selectStatisticsClick(1);
		// 최다 조회 상품 2위
		AdminStatisticsProduct clickP2 = new AdminStatisticsProduct();
		clickP2 = ass.admin_selectStatisticsClick(2);
		// 최다 조회 상품 3위
		AdminStatisticsProduct clickP3 = new AdminStatisticsProduct();
		clickP3 = ass.admin_selectStatisticsClick(3);
		// 최다 조회 상품 4위
		AdminStatisticsProduct clickP4 = new AdminStatisticsProduct();
		clickP4 = ass.admin_selectStatisticsClick(4);
		// 최다 조회 상품 5위
		AdminStatisticsProduct clickP5 = new AdminStatisticsProduct();
		clickP5 = ass.admin_selectStatisticsClick(5);
		
		request.setAttribute("clickP1", clickP1);
		request.setAttribute("clickP2", clickP2);
		request.setAttribute("clickP3", clickP3);
		request.setAttribute("clickP4", clickP4);
		request.setAttribute("clickP5", clickP5);
		
		request.getRequestDispatcher("views/admin_views/admin_Statistics_Product_Click.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
