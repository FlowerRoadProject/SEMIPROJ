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
		
		String receiver = request.getParameter("receiver");
		String receiveAddress = request.getParameter("receiveAddress");
		String receivePhone = request.getParameter("receivePhone");
		String anony = request.getParameter("anony");
		//메모 추가해야됨..
		String memo = request.getParameter("sendMemo");		
			
		ArrayList<Order> list = new ArrayList<Order>();
		//ArrayList<Basket> bList = new ArrayList<Basket>();		
		
		o = new Order(member_num, orderDate, receiver, receiveAddress, receivePhone, anony, memo);
		list.add(o);
				
		OrderService oService = new OrderService();		
		
		int result = oService.insertOrder(list);
		
		String message = null;
		String tag = null;
		if(request.getParameter("cardMsg") !=""){
			message = request.getParameter("cardMsg");
			
		}
		
		if(request.getParameter("tagMsg") != ""){
			tag = request.getParameter("tagMsg");
			
		}
		System.out.println("productNum[0]: "+productNum[0].substring(2, 4));
		
		//이후 셀렉트를 통해 orderNum을 가져와야한다..
		String orderNum = oService.selectOrderNum(member_num);
		System.out.println("주문번호는? : "+orderNum);
		System.out.println("메세지카드: "+message);
		System.out.println("메세지태그: "+tag);
		//orderProList에 insert
		
		
		
		int insertProList = 0;
		for(int i = 0; i< productNum.length; i++){
			
			if(Integer.parseInt(productNum[i].substring(2, 4)) >=37 && Integer.parseInt(productNum[i].substring(2, 4)) <=39){
				//메세지카드일때 메세지를 삽입
				insertProList += oService.insertOrderProList(orderNum, productNum[i], Integer.parseInt(quantity[i]), message);
				System.out.println("메세지카드있어서 실행");
			}else if(Integer.parseInt(productNum[i].substring(2, 4)) >=40 && Integer.parseInt(productNum[i].substring(2, 4)) <=43){
				//메세지태그일때 메세지를 삽입
				insertProList += oService.insertOrderProList(orderNum, productNum[i], Integer.parseInt(quantity[i]), tag);
				System.out.println("메세지태그있어서 실행");
			}else{
				insertProList += oService.insertOrderProList(orderNum, productNum[i], Integer.parseInt(quantity[i]), null);
				System.out.println("일반 상품 인서트 실행");
			}
			
		}
		
		System.out.println("insertProList(구입한 물품종류): "+insertProList);
		
		
		
		
		
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
