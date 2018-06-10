package com.fr.jsp.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fr.jsp.board.model.service.ReviewBoardService;
import com.fr.jsp.common.PageInfo;
import com.fr.jsp.product.model.service.ProductService;
import com.fr.jsp.product.model.vo.ProductSimple;
import com.google.gson.Gson;

/**
 * Servlet implementation class SelectProductListServlet
 */
@WebServlet("/productList.do")
public class SelectProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectProductListServlet() {
        super();
        // TODO Auto-generated constructor stub 
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String event =null;
		String category =null;
		HttpSession session  = request.getSession(false);
		ArrayList<ProductSimple> sessionList =(ArrayList<ProductSimple>)session.getAttribute("sessionList");
		ArrayList<ProductSimple> currList = new ArrayList<ProductSimple>();
		ArrayList<ProductSimple> pagedList = new ArrayList<ProductSimple>();
		ProductService ps = new ProductService();
		int currPage=1; 		//현재 페이지
		int limit=9; 			//한 페이지당 게시글을 몇개 보여줄건지
		String page ="";
		PageInfo pi =null;
		
		event  = request.getParameter("event");
		category = request.getParameter("category");
	
		if(event==null)
			event="none";
		if(category==null)
			category="none";
		
		if(!event.equals("none")||!category.equals("none"))
		{
			sessionList = ps.getProductList(event,category);
			session.setAttribute("sessionList", sessionList);
			
			currList = (ArrayList<ProductSimple>) sessionList.clone();
			session.setAttribute("list", currList);
		}
		
		if(request.getParameter("currPage")!=null)
			currPage = Integer.parseInt(request.getParameter("currPage"));
		
		
		int listSize = currList.size();
		
		
		pi = new PageInfo(currPage,listSize,limit);
		
		int loopEnd = listSize-1<pi.getEndRow()-1?listSize-1:pi.getEndRow()-1;
		
		for(int i=pi.getStartRow()-1;i<loopEnd+1;++i){
			pagedList.add(currList.get(i));
		}
		
		
		if(pagedList.size()>0){
			page ="views/product/productList.jsp";			
			request.setAttribute("pagedList", pagedList);		
			request.setAttribute("pi", pi);
			request.setAttribute("event", event);
			request.setAttribute("category", category);
			
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "상품 리스트를 불러올 수 없습니다.");
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
