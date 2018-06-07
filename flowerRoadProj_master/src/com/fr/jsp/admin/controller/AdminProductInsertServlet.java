package com.fr.jsp.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fr.jsp.admin.model.service.AdminProductService;
import com.fr.jsp.admin.model.vo.AdminProduct;
import com.google.gson.Gson;

@WebServlet("/insertProduct.admin")
public class AdminProductInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminProductInsertServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String insertPImage = request.getParameter("insertPImage");
		String insertPName = request.getParameter("insertPName");
		String insertPCategory = request.getParameter("insertPCategory");
		String insertPOrigin = request.getParameter("insertPOrigin");
		int insertPStock = Integer.parseInt(request.getParameter("insertPStock"));
		int insertPCost = Integer.parseInt(request.getParameter("insertPCost"));
		int insertPPrice = Integer.parseInt(request.getParameter("insertPPrice"));
		String insertPEvent = request.getParameter("insertPEvent");
		
		AdminProduct product = new AdminProduct();
		product.setImagePath(insertPImage);
		product.setProductName(insertPName);
		product.setProductCategoryName(insertPCategory);
		product.setProductOriginName(insertPOrigin);
		product.setProductQuantity(insertPStock);
		product.setProductCost(insertPCost);
		product.setProductPrice(insertPPrice);
		product.setProductEvent(insertPEvent);
		
		AdminProductService aps = new AdminProductService();
		// 상품 정보,이미지,이벤트 등록
		aps.admin_insertProduct(product);
		
		// 오늘 등록한 상품 수 변경
		int admin_todayRegiProductCount = aps.admin_todayRegiProductList().size();
		
		// Connection close Method
		aps.closeCon();
				
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(admin_todayRegiProductCount, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
