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

@WebServlet("/oneView.me")
public class OnetoOneView extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public OnetoOneView() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		String mNum = (String)session.getAttribute("memberNum");
		int bNum = Integer.parseInt(request.getParameter("bNum"));
		
		MemberBoard mb = new MemberBoard();
		
		mb = new MemberService().oneView(mNum, bNum);
		
		if(mb != null){
			request.setAttribute("mb", mb);
			request.getRequestDispatcher("views/myPage/1on1Page_View.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "1:1 게시판에 접속할수 없습니다!");
			response.sendRedirect("views/common/errorPage.jsp");
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
