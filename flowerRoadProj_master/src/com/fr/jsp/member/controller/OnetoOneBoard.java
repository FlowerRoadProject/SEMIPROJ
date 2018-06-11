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
import com.fr.jsp.member.model.vo.MemberBoard;

@WebServlet("/oneBoard.me")
public class OnetoOneBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public OnetoOneBoard() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		ArrayList<MemberBoard> list = null;
		
		String num = (String)session.getAttribute("memberNum");
		
		list = new MemberService().oneBoard(num);
		
		String page ="";
		if(list != null && !list.isEmpty()){
			page = "/views/myPage/1on1Page_board.jsp";
			request.setAttribute("mblist", list);
		} else {
			page = "/views/myPage/1on1Page_board.jsp";
			request.setAttribute("mblist", list);
		}
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
