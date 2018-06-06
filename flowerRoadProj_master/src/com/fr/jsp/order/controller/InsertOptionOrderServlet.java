package com.fr.jsp.order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fr.jsp.order.model.service.OrderService;
import com.fr.jsp.order.model.vo.Order;

/**
 * Servlet implementation class InsertOptionOrderServlet
 */
@WebServlet("/InsertOptionOrder.bk")
public class InsertOptionOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertOptionOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String member_num = (String)session.getAttribute("memberNum");
				
		String[] productNum = request.getParameterValues("productNum");		
		String[] quantity = request.getParameterValues("quantity");		
		String[] category = request.getParameterValues("pCategory");
		 
		/*ArrayList<String> orderNumDT = new ArrayList<String>();
		ArrayList<String> orderNumCD = new ArrayList<String>();
		ArrayList<String> orderNumTG = new ArrayList<String>();*/
		
		int length = productNum.length;
		//인서트 한 이후에는 dt cd tg를 걸러내서 따로 또 인서트를 시켜야 한다
		
		//주문 들어온 갯수중에서 dt를 걸러낸다
		ArrayList<Order> DTList = new OrderService().selectDT(member_num, length);
		
		//주문 들어온 갯수중에서 cd를 걸러낸다
		ArrayList<Order> CDList = new OrderService().selectCD(member_num, length);
		
		//주문 들어온 갯수중에서 tg를 걸러낸다
		ArrayList<Order> TGList = new OrderService().selectTG(member_num, length);
		
		if(DTList != null){
			for(int i = 0; i< DTList.size(); i++){
				/*String oNum = DTList.get(i).getOrder_num();
				String pNum = DTList.get(i).getProduct_num();
				int quan = DTList.get(i).getQuantity();
				String message = null;*/
			}
		}
		if(CDList != null){
			for(int i = 0; i< CDList.size(); i++){
				
			}
		}		
		if(TGList != null){
			for(int i = 0; i< TGList.size(); i++){
				
			}
		}
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
