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
import com.fr.jsp.myShoppingBasket.model.vo.Basket;

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
		String page="";
		
		if(list != null){
			page="/views/myShoppingBasket/basket-menu.jsp";
			request.setAttribute("list",list);
			request.setAttribute("oList", oList);
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
