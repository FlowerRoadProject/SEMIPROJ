package com.fr.jsp.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.fr.jsp.member.model.service.MemberService;

@WebServlet("/idSearch.me")
public class idSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public idSearchServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("me_name");
		String phone1 = request.getParameter("me_hp1");
		String phone2 = request.getParameter("me_hp2");
		String phone3 = request.getParameter("me_hp3");
		String phone=phone1+phone2+phone3;
		String email = request.getParameter("me_email");
		MemberService ms = new MemberService();
		
		String id = ms.idSearch(name,phone,email);
		if(id!=null&&id!=""){
			request.setAttribute("memberId", id);
		}else{
			request.setAttribute("memberId", "해당 정보가 틀렸습니다");
		}

		RequestDispatcher view = request.getRequestDispatcher("/views/mainPage/findUser.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
