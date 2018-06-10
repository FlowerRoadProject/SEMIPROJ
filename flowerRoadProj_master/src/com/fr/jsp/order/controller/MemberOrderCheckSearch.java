package com.fr.jsp.order.controller;

import java.io.IOException;
import java.util.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/orderChkSearch.or")
public class MemberOrderCheckSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public MemberOrderCheckSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);

		String memberNum = (String) session.getAttribute("memberNum");
		String start = (String)request.getParameter("start");
		String end = (String)request.getParameter("end");
		System.out.println(start);
		System.out.println(end);
		
		//SimpleDateFormat transFormat = new SimpleDateFormat("MM/dd/yyyy");
		
		//Date to = transFormat.parse(start);

		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
