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

@WebServlet("/login.me")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public loginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("userId");
		String pwd = request.getParameter("userPwd");
		
		Member m = new Member(id,pwd);
		
		MemberService ms = new MemberService();
		
		m=ms.loginSelectMember(m);
		
		
		if(m!=null){//로그인성공
			HttpSession session = request.getSession();
			if(m.getMemberNum().charAt(0)=='A'){
					session.setAttribute("adminNum", m.getMemberNum());
					System.out.println("관리자 로그인성공");
					RequestDispatcher view = request.getRequestDispatcher("/adminFirstMain");
					view.forward(request, response);
			}else{
				if(ms.accessMember(m) !=0){
					//액세스 로그 가 성공햇을때
					System.out.println("액세스 로그 삽입 성공");
					session.setAttribute("memberNum", m.getMemberNum());
					System.out.println("로그인성공");
					RequestDispatcher view = request.getRequestDispatcher("main.jsp");
					view.forward(request, response);	
				}else{
					request.setAttribute("msg", "액세스로그 접속 실패");
					RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
					view.forward(request, response);
				}
				
			}
		}else{//로그인 실패
			System.out.println("아이디비번틀림");
			request.setAttribute("msg", "로그인 실패 아이디나 비밀번호를 다시 확인하세요");
			RequestDispatcher view = request.getRequestDispatcher("views/mainPage/login.jsp");
			view.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
