package com.fr.jsp.myShoppingBasket.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fr.jsp.myShoppingBasket.model.service.BasketService;
import com.fr.jsp.myShoppingBasket.model.vo.Basket;
import com.google.gson.Gson;

/**
 * Servlet implementation class BasketUpdateServlet
 */
@WebServlet("/update.bk")
public class BasketUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BasketUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String product_num = request.getParameter("pNum");
		int quantity = Integer.parseInt(request.getParameter("pQuantity"));
		
		Basket bk = new Basket(product_num, quantity);
		
		BasketService bService = new BasketService();
		
		int result = bService.updateQuantity(bk);
		
		new Gson().toJson(result, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
