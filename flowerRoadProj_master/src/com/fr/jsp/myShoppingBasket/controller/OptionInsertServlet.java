package com.fr.jsp.myShoppingBasket.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fr.jsp.myShoppingBasket.model.service.BasketService;
import com.fr.jsp.myShoppingBasket.model.vo.Basket;
import com.google.gson.Gson;

/**
 * Servlet implementation class OptionInsertServlet
 */
@WebServlet("/optionInsert.bk")
public class OptionInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OptionInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//이건 옵션상품을 장바구니로 추가했을 경우 DB의 Shopping basket에 추가되게 하기 위한 서블릿이다
		HttpSession session = request.getSession(false);
		Basket bk = new Basket();
		
		String member_num = (String)session.getAttribute("member_num");		
		String product_num[] = request.getParameterValues("productNum");
		String quantity[] = request.getParameterValues("quantity");
		
		BasketService bService = new BasketService();
		
		
		
		int length = Integer.parseInt(request.getParameter("length"));//jsp에서 모셔온 기존 상품 갯수(옵션제외)
		
		
		int result = 0;
		System.out.println("length : "+length);
		System.out.println("멤버 : "+member_num);
		System.out.println("product_num.length: "+product_num.length);		
		
		System.out.print("상품코드 : ");
		for(int i = length; i < product_num.length; i++){
			System.out.print(product_num[i]+", ");		
		}
		System.out.println();
		
		for(int i = length; i< product_num.length; i++){			
			System.out.println("product_num들은? : "+product_num[i]+",");			
			bk = new Basket(member_num, product_num[i], Integer.parseInt(quantity[i]));
			result = bService.insertOption(bk);
			
		}		
		new Gson().toJson(result,response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
