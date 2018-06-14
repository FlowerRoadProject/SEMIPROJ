package com.fr.jsp.myShoppingBasket.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fr.jsp.myShoppingBasket.model.dao.BasketDao;
import com.fr.jsp.myShoppingBasket.model.service.BasketService;
import com.google.gson.Gson;

/**
 * Servlet implementation class AddBasketServlet
 */
@WebServlet("/addBasket.do")
public class AddBasketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddBasketServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String memberNum = (String) session.getAttribute("memberNum");
		String pNumString = (String) request.getParameter("pNum");
		String[] productNums=null;
		
		if(pNumString!=null)
			productNums = pNumString.split(",");
		
		for(int i=0;i<productNums.length;++i){
			//System.out.println(productNums[i]);
		}

		int result = 0;

		if (memberNum != null) {
			
			for(int i=0;i<productNums.length;++i){
			
				if ((new BasketService().isExistProduct(memberNum, productNums[i])) > 0) {
	
					result = new BasketService().increseQuantityByOne(memberNum, productNums[i]);
	
				} else {
	
					result = new BasketService().insertToBasket(memberNum, productNums[i]);
				}
				
				if(result<0)
					new Gson().toJson(-1,response.getWriter());
				
			}
			new Gson().toJson(result, response.getWriter());

		}else{
			
			new Gson().toJson(-1,response.getWriter());
			
		}
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
