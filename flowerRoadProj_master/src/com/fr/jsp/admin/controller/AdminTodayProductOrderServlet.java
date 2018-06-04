package com.fr.jsp.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fr.jsp.admin.model.service.AdminProductService;
import com.fr.jsp.admin.model.vo.AdminProduct;
import com.fr.jsp.admin.model.vo.AdminProductOrder;

@WebServlet("/todayProductOrder.admin")
public class AdminTodayProductOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminTodayProductOrderServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminProductService aps = new AdminProductService();
		// 등록된 모든 상품 수
		int admin_allProductCount = aps.admin_allProductList().size();
		// 오늘 등록한 상품 수
		int admin_todayRegiProductCount = aps.admin_todayRegiProductList().size();
		// 재고부족 상품 수
		int admin_stockLackProductCount = aps.admin_stockLackProductList().size();
		// 오늘 발주한 상품 수
		int admin_todayProductOrderCount = aps.admin_todayProductOrderList().size();
		// 등록된 모든 상품 리스트
		ArrayList<AdminProduct> admin_allProductList = aps.admin_allProductList();
		// 상품 카테고리 리스트
		ArrayList<String> admin_productCategoryList = aps.admin_productCategoryList();
		// 상품 원산지 리스트
		ArrayList<String> admin_productOriginList = aps.admin_productOriginList();
		// 발주 현황 리스트
		ArrayList<AdminProductOrder> admin_todayProductOrderList = aps.admin_todayProductOrderList();
		
		// connection close
		aps.closeCon();
		
		request.setAttribute("admin_allProductCount", admin_allProductCount);
		request.setAttribute("admin_todayRegiProductCount", admin_todayRegiProductCount);
		request.setAttribute("admin_stockLackProductCount", admin_stockLackProductCount);
		request.setAttribute("admin_todayProductOrderCount", admin_todayProductOrderCount);
		
		request.setAttribute("admin_productList", admin_allProductList);
		request.setAttribute("admin_productCategoryList", admin_productCategoryList);
		request.setAttribute("admin_productOriginList", admin_productOriginList);
		request.setAttribute("admin_productOrderList", admin_todayProductOrderList);
		
		request.getRequestDispatcher("views/admin_views/admin_Product.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
