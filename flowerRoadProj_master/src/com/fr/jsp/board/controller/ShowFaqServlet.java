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
		System.out.println("서블릿입장");
		ArrayList<FaqBoard> list = new FaqBoardService().showFaq();
		
		
		request.setAttribute("list",list);
		request.getRequestDispatcher("/views/faq/faqBoard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
