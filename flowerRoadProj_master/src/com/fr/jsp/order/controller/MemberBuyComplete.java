package com.fr.jsp.order.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fr.jsp.order.model.service.OrderService;

@WebServlet("/buyComplete.or")
public class MemberBuyComplete extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public MemberBuyComplete() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
HttpSession session = request.getSession(false);
		
		String num = (String)session.getAttribute("memberNum");
		String onum = (String)request.getParameter("onum");
		OrderService os = new OrderService();
		
		if(os.buyComplete(num, onum) != 0){
			response.sendRedirect("orderChk.or");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
