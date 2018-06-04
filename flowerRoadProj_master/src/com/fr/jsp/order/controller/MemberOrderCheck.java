package com.fr.jsp.order.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fr.jsp.member.model.vo.Member;
import com.fr.jsp.order.model.service.OrderService;
import com.fr.jsp.order.model.vo.Order;

@WebServlet("/orderChk.or")
public class MemberOrderCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MemberOrderCheck() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		Member m = (Member)session.getAttribute("session");
		Order o = new Order();
		
		OrderService os = new OrderService();
		
		o = os.orderChk(m);
		if(o != null){
			request.getRequestDispatcher("/views/myPage/orderCheck.jsp")
			.forward(request, response);
		} else {
			System.out.println("실패");
		}
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
