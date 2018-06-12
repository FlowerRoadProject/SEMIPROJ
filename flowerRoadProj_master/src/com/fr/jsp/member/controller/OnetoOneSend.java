package com.fr.jsp.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fr.jsp.member.model.service.MemberService;
import com.fr.jsp.member.model.vo.MemberBoard;

/**
 * Servlet implementation class OnetoOneSend
 */
@WebServlet("/oneSend.me")
public class OnetoOneSend extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OnetoOneSend() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		MemberBoard mb = new MemberBoard();
		mb.setMemberNum((String)session.getAttribute("memberNum"));
		mb.setMemberSendPhone(request.getParameter("email"));
		mb.setMemberSendPhone(request.getParameter("phone"));
		mb.setBoardTitle(request.getParameter("title"));
		mb.setBoardContent(request.getParameter("content"));
		
		MemberService ms = new MemberService();
		
		if(ms.sendBoard(mb) != 0){
			response.sendRedirect("oneBoard.me");
		} else {
			request.setAttribute("msg", "메세지를 보낼수 없습니다!");
			response.sendRedirect("views/common/errorPage.jsp");
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
