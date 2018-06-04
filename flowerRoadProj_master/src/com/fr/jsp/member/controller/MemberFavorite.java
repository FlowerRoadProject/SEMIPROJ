package com.fr.jsp.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fr.jsp.member.model.service.MemberService;
import com.fr.jsp.product.model.vo.ProductFavorite;

@WebServlet("/favorite.me")
public class MemberFavorite extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemberFavorite() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		ArrayList<ProductFavorite> list = null;
		
		String num = (String)session.getAttribute("memberNum");
		System.out.println("num값: "+num);
		list = new MemberService().favorite(num);
		System.out.println(list);
		String page ="";
		if(list != null && !list.isEmpty()){
			page = "views/myPage/favorite.jsp";
			request.setAttribute("pflist", list);
		} else {
			System.out.println("실패");
		}
		request.getRequestDispatcher(page).forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
