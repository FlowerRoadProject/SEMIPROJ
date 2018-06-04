package com.fr.jsp.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fr.jsp.common.PageInfo;
import com.fr.jsp.product.model.service.ProductService;
import com.fr.jsp.product.model.vo.ProductSimple;

/**
 * Servlet implementation class SearchProductServlet
 */
@WebServlet("/searchProduct.do")
public class SearchProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ProductService ps = new ProductService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		PageInfo pi = new PageInfo();
		ArrayList<ProductSimple> sessionList = (ArrayList<ProductSimple>)session.getAttribute("list");
		ArrayList<ProductSimple> pagedList = new ArrayList<ProductSimple>();
		ArrayList<ProductSimple> tempList = new ArrayList<ProductSimple>();
		String keyword = request.getParameter("keyword");
		String page ="";
		
		ProductService ps = new ProductService();
	
		for(int i=0;i<sessionList.size();++i){
			
			if(sessionList.get(i).getProductName().contains(keyword))
				tempList.add(sessionList.get(i));
			
		}
		sessionList=tempList;
		session.setAttribute("list", tempList);
		
		
		
		int listSize = sessionList.size();
		
		
		pi = new PageInfo(1,listSize,9);
		
		int loopEnd = listSize-1<pi.getEndRow()-1?listSize-1:pi.getEndRow()-1;
		
		for(int i=pi.getStartRow()-1;i<loopEnd+1;++i){
			pagedList.add(sessionList.get(i));
		}
	
		
		if(pagedList.size()>0){
			page ="views/product/productList.jsp";			
			request.setAttribute("pagedList", pagedList);		
			request.setAttribute("pi", pi);
			
			
		}else{
			page = "views/common/noResult.jsp";
			request.setAttribute("keyword", keyword);
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
