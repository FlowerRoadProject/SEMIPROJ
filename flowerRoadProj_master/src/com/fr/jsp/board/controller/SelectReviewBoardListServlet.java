package com.fr.jsp.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.fr.jsp.board.model.service.ReviewBoardService;
import com.fr.jsp.board.model.vo.ReviewBoard;
import com.fr.jsp.common.PageInfo;
import com.google.gson.Gson;

/**
 * Servlet implementation class SelectReviewBoardListServlet
 */
@WebServlet("/selectReviewList.do")
public class SelectReviewBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectReviewBoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<ReviewBoard> list = null;
		
		
		String pno = request.getParameter("pno");
		ReviewBoardService rbs = new ReviewBoardService();
		
		 
		 String page = "";
		 
			int currPage=1; 		//현재 페이지
			int limit=5; 			//한 페이지당 게시글을 몇개 보여줄건지
			
			//currPage 가 있으면 currPage를 수정
			if(request.getParameter("currPage")!=null){
				currPage = Integer.parseInt(request.getParameter("currPage"));
			}
		
			
		
			System.out.println(currPage);
			//페이지 관련 변수 전달용 VO 생성
			PageInfo pi = new PageInfo(currPage,rbs.getListCount(pno),limit);
			
			list  = rbs.selectList(pno,pi);
			
			
			

			JSONObject myJson = new JSONObject();
			
			myJson.put("pi", pi);
			myJson.put("list",list);
			
			
			
			response.setContentType("application/json;charset=UTF-8");
			
			if(list!=null){
				
				new Gson().toJson(myJson,response.getWriter());
				 
			 }else{
				 page = "views/common/errorPage.jsp";
				 request.setAttribute("msg", "리뷰 리스트 조회 실패");
				 request.getRequestDispatcher(page).forward(request, response);
			 }
			
			
			
		/* if(list!=null){
		
			 
			 request.setAttribute("list", list);
			 request.setAttribute("pi", pi);
			 page = "views/product/product.jsp";
			 
		 }else{
			 page = "views/common/errorPage.jsp";
			 request.setAttribute("msg", "리뷰 리스트 조회 실패");
		 }
		 
		
		 */
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
