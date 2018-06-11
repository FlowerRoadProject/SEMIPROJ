package com.fr.jsp.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fr.jsp.member.model.service.MemberService;
import com.google.gson.Gson;

@WebServlet("/favoriteDel.me")
public class MemberFavoriteDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public MemberFavoriteDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		String num = (String)session.getAttribute("memberNum");
		String pno = (String) request.getParameter("pno");
		System.out.println("num번호:"+num);
		System.out.println("pno번호:"+pno);
		int result =  new MemberService().favoriteDel(num,pno);
		if(result != 0){
			response.sendRedirect("favorite.me");
		}
		//new Gson().toJson(result, response.getWriter());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
