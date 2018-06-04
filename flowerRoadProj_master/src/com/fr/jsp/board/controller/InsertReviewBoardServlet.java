package com.fr.jsp.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.fr.jsp.board.model.service.ReviewBoardService;
import com.fr.jsp.board.model.vo.ReviewBoard;
import com.google.gson.Gson;

/**
 * Servlet implementation class InsertReviewBoard
 */
@WebServlet("/insertReview.do")
public class InsertReviewBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReviewBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int result  =0;
		ReviewBoard rb = new ReviewBoard();
		String page = "";
		
		
		
		String bTitle = request.getParameter("title");
		String bContent = request.getParameter("content");
		String memberNum = request.getParameter("member_num");
		String productNum = request.getParameter("product_num");
		
		
		int rating  = Integer.parseInt(request.getParameter("rating"));
		
		
		
		
		rb.setbTitle(bTitle);
		rb.setbContent(bContent);
		rb.setMemberNum(memberNum);
		rb.setProductNum(productNum);
		rb.setRating(rating);
		
		
		
		page = "";
		
		ReviewBoardService rbs = new ReviewBoardService();
		
		result = rbs.insertReview(rb);
		
		if(result>0){
			response.setContentType("application/json;charset=UTF-8");
			
			new Gson().toJson(result, response.getWriter());
			//request.setAttribute("productNum", rb.getbNum());
			
		}else{
			request.setAttribute("msg", "리뷰 삽입 실패!");
			page = "views/common/errorPage.jsp";
			request.getRequestDispatcher(page).forward(request, response);
			
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
