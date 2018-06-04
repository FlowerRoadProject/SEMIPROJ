package com.fr.jsp.order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fr.jsp.member.model.vo.Member;
import com.fr.jsp.order.model.service.OrderService;
import com.fr.jsp.order.model.vo.MyPage_Order;
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
		
		ArrayList<MyPage_Order> list = null;
		
		Member m = (Member)session.getAttribute("m");
		String id = m.getMemberId();
		
		list = new OrderService().orderChk(id);
		
		String page ="";
		if(list != null && !list.isEmpty()){
			page = "/views/myPage/orderCheck.jsp";
			request.setAttribute("list", list);
		} else {
			System.out.println("실패");
		}
		request.getRequestDispatcher(page).forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
