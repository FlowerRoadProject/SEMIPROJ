package com.fr.jsp.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fr.jsp.member.model.service.MemberService;


@WebServlet("/favoriteAllDel.me")
public class MemberFavoriteAllDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public MemberFavoriteAllDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		String num = (String)session.getAttribute("memberNum");
		System.out.println(num);
		MemberService ms = new MemberService();
		
		if(ms.favoriteAllDel(num) != 0){
			response.sendRedirect("views/myPage/myPage_main.jsp");
		} else {
			System.out.println("실패");
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
