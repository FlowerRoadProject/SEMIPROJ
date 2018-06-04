package com.fr.jsp.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fr.jsp.admin.model.service.AdminOrderService;
import com.fr.jsp.order.model.vo.Order;
import com.google.gson.Gson;

@WebServlet("/editOrderState.admin")
public class AdminOrderStateEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminOrderStateEditServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oNum = request.getParameter("oNum");
		String stateCode = request.getParameter("stateCode");
		String alterStateCode = request.getParameter("alterStateCode");
		
		boolean check;
		if(stateCode=="" || alterStateCode==""){
			check = false;
		}else{
			Order order = new Order();
			order.setOrder_num(oNum);
			order.setOrder_state_code(alterStateCode);
			
			AdminOrderService aos = new AdminOrderService();
			// 상품 주문 코드 변경
			aos.admin_updateOrderState(order);
			// Connection close Method
			aos.closeCon();
			
			check=true;
		}
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(check, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
