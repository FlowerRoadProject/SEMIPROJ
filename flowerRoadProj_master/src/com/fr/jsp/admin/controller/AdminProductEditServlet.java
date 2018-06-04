package com.fr.jsp.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import com.fr.jsp.admin.model.service.AdminProductService;
import com.fr.jsp.admin.model.vo.AdminProduct;
import com.fr.jsp.product.model.vo.Product;

@WebServlet("/editProduct.admin")
public class AdminProductEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminProductEditServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pNum = request.getParameter("pNum");
		String pImage = request.getParameter("pImage");
		String pName = request.getParameter("pName");
		String pCategory = request.getParameter("pCategory");
		String pOrigin = request.getParameter("pOrigin");
		int pStock = Integer.parseInt(request.getParameter("pStock"));
		int pCost = Integer.parseInt(request.getParameter("pCost"));
		int pPrice = Integer.parseInt(request.getParameter("pPrice"));
		String pEvent = request.getParameter("pEvent");
		
		AdminProduct product = new AdminProduct();
		product.setProductNum(pNum);
		product.setImagePath(pImage);
		product.setProductName(pName);
		product.setProductCategoryName(pCategory);
		product.setProductOriginName(pOrigin);
		product.setProductQuantity(pStock);
		product.setProductCost(pCost);
		product.setProductPrice(pPrice);
		product.setProductEvent(pEvent);
		
		AdminProductService aps = new AdminProductService();
		// 상품 정보,이미지,이벤트 수정
		Product updateProduct = aps.admin_updateProduct(product);
		// Connection close Method
		aps.closeCon();
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(updateProduct, response.getWriter());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
