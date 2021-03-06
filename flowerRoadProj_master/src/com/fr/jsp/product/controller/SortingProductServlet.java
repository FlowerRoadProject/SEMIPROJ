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
 * Servlet implementation class SortingProductServlet
 */
@WebServlet("/sortProduct.do")
public class SortingProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SortingProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		PageInfo pi = new PageInfo();
		ArrayList<ProductSimple> currList = (ArrayList<ProductSimple>)session.getAttribute("list");
		ArrayList<ProductSimple> pagedList = new ArrayList<ProductSimple>();
		String order = null;
		String page ="";
		int listSize =0;
		
		order  =request.getParameter("order");
		if(order==null)
			order="none";
		ProductService ps = new ProductService();
		
		if(!order.equals("none")&&currList!=null){
			
			currList = ps.getOrderdProductList(currList, order);
			listSize= currList.size();
		}
		
		pi = new PageInfo(1,listSize,9);
		
		int loopEnd = listSize-1<pi.getEndRow()-1?listSize-1:pi.getEndRow()-1;
		
		for(int i=pi.getStartRow()-1;i<loopEnd+1;++i){
			pagedList.add(currList.get(i));
		}
	
		
		if(pagedList.size()>0){
			page ="views/product/productList.jsp";			
			request.setAttribute("pagedList", pagedList);		
			request.setAttribute("pi", pi);
			
			
		}else{
			page = "views/common/noResult.jsp";
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
