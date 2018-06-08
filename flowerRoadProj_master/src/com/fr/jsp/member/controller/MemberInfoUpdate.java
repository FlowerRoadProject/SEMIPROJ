package com.fr.jsp.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fr.jsp.member.model.service.MemberService;
import com.fr.jsp.member.model.vo.Member;

@WebServlet("/infoModi.me")
public class MemberInfoUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public MemberInfoUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String email = request.getParameter("email");
		String addr[] = request.getParameter("addr").split("/");
		String phone = request.getParameter("phone");
		
		Member m = (Member)session.getAttribute("m");
		m.setMemberEmail(email);
		m.setMemberAddress(addr[0]+addr[1]+addr[2]);
		m.setMemberPhone(phone);
		
		MemberService ms = new MemberService();
		
		if(ms.memberUpdate(m) != 0){
			response.sendRedirect("views/myPage/myPage_main.jsp");
		}else{
			System.out.println("실패!!");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
