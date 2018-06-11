package com.fr.jsp.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fr.jsp.member.model.service.MemberService;
import com.fr.jsp.member.model.vo.Member;


@WebServlet("/pwSearch.me")
public class pwSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public pwSearchServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("me_id");
		String name = request.getParameter("me_name");
		String email = request.getParameter("me_email");
		MemberService ms = new MemberService();
		Member m = new Member();
		m.setMemberId(userId);
		m.setMemberName(name);
		m.setMemberEmail(email);
		String result = ms.pwSearch(m);
		
		if(result!=null&&result!=""){
			request.setAttribute("to", m.getMemberEmail());
			request.setAttribute("content", "임시비밀번호는 "+result+"입니다");
			request.setAttribute("url", "/views/mainPage/findUser.jsp");
			RequestDispatcher view = request.getRequestDispatcher("/views/common/sendMail.jsp");
			view.forward(request, response);
		}else{
			request.setAttribute("memberPwd", "비밀번호찾기 정보가 틀렸습니다");
			RequestDispatcher view = request.getRequestDispatcher("/views/mainPage/findUser.jsp");
			view.forward(request, response);
		}

		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
