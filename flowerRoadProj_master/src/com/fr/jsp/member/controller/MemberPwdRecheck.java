package com.fr.jsp.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fr.jsp.member.model.service.MemberService;

@WebServlet("/pwdRechk.me")
public class MemberPwdRecheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemberPwdRecheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		String num = (String)session.getAttribute("memberNum");
		String pwd = (String)request.getParameter("pwd");
		int sel = Integer.parseInt(request.getParameter("sel"));
		System.out.println(pwd);
		System.out.println("sel"+sel);
		int result = new MemberService().pwdRecheck(num, pwd);
		System.out.println("last"+result);
		if(result != 0){
			switch(sel){
			case 1 : response.sendRedirect("views/myPage/myPage_pwdChange.jsp"); break;
			case 2 : response.sendRedirect("views/myPage/myPage_infoModify.jsp"); break;
			case 3 : response.sendRedirect("views/myPage/myPage_memberWithdrawal.jsp"); break;
			} 
		} else {
			response.sendRedirect("views/common/errorPage.jsp");
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
