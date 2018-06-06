package com.fr.jsp.order.controller;

import java.io.IOException;
import java.util.ArrayList;

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
 * Servlet implementation class RemoveFromBasketServlet
 */
@WebServlet("/removeFrom.bk")
public class RemoveFromBasketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveFromBasketServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String memberNum = (String)session.getAttribute("memberNum");
		ArrayList<Basket> basketList = new BasketService().selectBasket(memberNum);
		
		ArrayList<Basket> orderList = new ArrayList<Basket>();		
		String[] pNum = request.getParameterValues("productNum");
		String[] quan = request.getParameterValues("quantity");
		
		for(int i = 0; i< pNum.length;i++){
			Basket bk = new Basket(pNum[i], Integer.parseInt(quan[i]));
			orderList.add(bk);
		}		
		
		int result = 0;
				
		for(int i = 0; i< orderList.size();i++){
			String orderPNum = orderList.get(i).getProduct_num();
			int orderQuan = orderList.get(i).getQuantity();
			
			if(basketList.get(i).getProduct_num().equals(orderPNum)){
				//basketList에서 orderList의 물품 갯수만큼 차감해야한다
				int difference = basketList.get(i).getQuantity()-orderQuan;
			
				if(difference <= 0){
					//basket에서 remove
					result += new BasketService().deleteBasket(orderPNum);
				}else{
					//basket에서 j번째의 상품의 갯수를 difference로 update
					Basket upBk = new Basket(orderPNum, difference);
					result += new BasketService().updateQuantity(upBk);
				}
						
			}
			
		}
		
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
