package com.fr.jsp.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fr.jsp.member.model.service.MemberService;
import com.fr.jsp.member.model.vo.Member;


@WebServlet("/infoMain.me")
public class MemberInfoMain extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public MemberInfoMain() {
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		String num = (String)session.getAttribute("memberNum");
		System.out.println(num);
		Member m = new Member(num);
		
		MemberService ms = new MemberService();
		
		m = ms.insertInfo(num);
		System.out.println(m);
		
		if(m != null){
			System.out.println("들어오니?");
			session.setAttribute("m", m);
			request.getRequestDispatcher("views/myPage/myPage_main.jsp").forward(request, response);
		}else{
			response.sendRedirect("views/common/errorPage.jsp");
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
