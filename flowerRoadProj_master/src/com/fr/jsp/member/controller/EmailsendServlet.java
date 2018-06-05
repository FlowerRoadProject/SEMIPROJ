package com.fr.jsp.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fr.jsp.member.model.service.MemberService;

@WebServlet("/emailSend.me")
public class EmailsendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EmailsendServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");

		
		MemberService ms = new MemberService();
		
		String result = ms.emailSendNum(email);
		
		request.setAttribute("to", email);
		request.setAttribute("content", "이메일 인증번호는 "+result+"입니다");
		request.setAttribute("url", "emailSend");
		request.setAttribute("result", result);
		RequestDispatcher view = request.getRequestDispatcher("/views/common/sendMail.jsp");
		view.forward(request, response);

		/*System.out.println("result : "+result);
		PrintWriter out = response.getWriter();
		out.print(result);
		out.close();*/
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
