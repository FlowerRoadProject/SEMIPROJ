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

@WebServlet("/refundOrder.admin")
public class AdminOrderRefundServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminOrderRefundServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oNum = request.getParameter("oNum");
		
		Order order = new Order();
		order.setOrder_num(oNum);
		
		AdminOrderService aos = new AdminOrderService();
		// 주문/배송 환불
		aos.admin_updateRefundOrder(order);
		String orderRefund = "구매 취소";
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(orderRefund, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
