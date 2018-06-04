package com.fr.jsp.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fr.jsp.admin.model.service.AdminProductService;
import com.fr.jsp.admin.model.vo.AdminProductOrder;
import com.google.gson.Gson;

@WebServlet("/insertProductOrder.admin")
public class AdminProductOrderInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminProductOrderInsertServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String insertPNumO = request.getParameter("insertPNumO");
		String insertPOCompany = request.getParameter("insertPOCompany");
		int insertPQO = Integer.parseInt(request.getParameter("insertPQO"));
		
		AdminProductOrder productOrder = new AdminProductOrder();
		productOrder.setProductNum(insertPNumO);
		productOrder.setProductOrderCompany(insertPOCompany);
		productOrder.setProductOrderQuantity(insertPQO);
		
		AdminProductService aps = new AdminProductService();
		// 상품 발주 등록
		aps.admin_insertProductOrder(productOrder);
		// 오늘 발주한 상품 수 변경
		int admin_todayProductOrderCount = aps.admin_todayProductOrderList().size();
		// Connection close Method
		aps.closeCon();
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(admin_todayProductOrderCount, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
