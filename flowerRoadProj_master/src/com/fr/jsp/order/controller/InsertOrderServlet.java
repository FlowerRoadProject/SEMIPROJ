package com.fr.jsp.order.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fr.jsp.myShoppingBasket.model.vo.Basket;
import com.fr.jsp.order.model.service.OrderService;
import com.fr.jsp.order.model.vo.Order;
import com.google.gson.Gson;

/**
 * Servlet implementation class InsertOrderServlet
 */
@WebServlet("/insertOrder.bk")
public class InsertOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();		
		Order o;
				
		//주문자의 정보
		String member_num = (String) session.getAttribute("memberNum");
		
		//받는사람의 정보
		
		String dt = request.getParameter("reservationDate");			
		System.out.println(dt);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd kk:mm");
		Date parsed = null;		
		try {
			parsed = format.parse(dt);					
		} catch (ParseException e) {
			e.printStackTrace();
		}
		java.sql.Timestamp orderDate = new java.sql.Timestamp(parsed.getTime());
		
		
		//주문상품정보
		String[] productNum = request.getParameterValues("productNum");		
		String[] quantity = request.getParameterValues("quantity");		
		String[] category = request.getParameterValues("pCategory");
		String receiver = request.getParameter("receiver");
		String receiveAddress = request.getParameter("receiveAddress");
		String receivePhone = request.getParameter("receivePhone");
		String anony = request.getParameter("anony");
		//메모 추가해야됨..
		String memo = request.getParameter("sendMemo");
		
		
		
			
		ArrayList<Order> list = new ArrayList<Order>();
		//ArrayList<Basket> bList = new ArrayList<Basket>();		
		
		
		
		for(int i = 0; i < productNum.length;i++){
			System.out.println("productNum: "+productNum[i]);
			o = new Order(member_num, productNum[i], orderDate, receiver, receiveAddress, receivePhone, anony, memo,Integer.parseInt(quantity[i]));
			list.add(o);
		}
		
		
		
		OrderService oService = new OrderService();		
		
		int result = oService.insertOrder(list);
		
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
