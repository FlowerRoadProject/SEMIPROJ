package com.fr.jsp.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fr.jsp.board.model.service.FaqBoardService;
import com.fr.jsp.board.model.vo.FaqBoard;


/**
 * Servlet implementation class ShowFaqServlet
 */
@WebServlet("/show.faq")
public class ShowFaqServlet extends HttpServlet {
	private static final long serialVersionUID = 1132354L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowFaqServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<FaqBoard> list = new FaqBoardService().showFaq();
		String page ="";
		if(list == null){
			request.setAttribute("msg", "FAQ정보를 읽어오지 못했습니다");
			page = "views/common/errorPage.jsp";
		}else{
			page = "/views/faq/faqBoard.jsp";
			request.setAttribute("list",list);
		}	
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
