package com.fr.jsp.myShoppingBasket.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fr.jsp.myShoppingBasket.model.service.BasketService;
import com.fr.jsp.myShoppingBasket.model.vo.*;

/**
 * Servlet implementation class BasketSelectServlet
 */
@WebServlet("/select.bk")
public class BasketSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BasketSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		HttpSession session = request.getSession(false);
		String member_num = (String)session.getAttribute("memberNum");
		session.setAttribute("member_num", member_num);	
		
		System.out.println("서블릿에서 멤버넘버 받은 것: "+member_num);
		
		ArrayList<Basket> list = new BasketService().selectBasket(member_num);
		ArrayList<Basket> oList = new BasketService().selectOption();				
		
		//재고보다 많이 들어온 상품은 장바구니에서 제거하기			
		Basket excess = new BasketService().selectExcess(member_num);
		String excessRemoveMsg = null;
		String excessPName = null;
		if(excess != null){
			int remove = new BasketService().deleteBasket(excess.getProduct_num());
			excessRemoveMsg = remove+"개의 상품이 재고가 부족해 장바구니에서 제거되었습니다.";
			excessPName = "재고부족 상품 : "+excess.getProduct_name();
			System.out.println(remove+"개의 물량초과 상품이 제거됨");
			
		}
		
		
		//화면에 표시
		String page="";
			
		if(list != null){
			page="/views/myShoppingBasket/basket-menu.jsp";
			request.setAttribute("list",list);
			request.setAttribute("oList", oList);
			request.setAttribute("excessRemoveMsg", excessRemoveMsg);
			request.setAttribute("excessPName", excessPName);
		}else{
			page="/views/myShoppingBasket/test.jsp";
			request.setAttribute("msg", "select.bk 실패");
		}
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
