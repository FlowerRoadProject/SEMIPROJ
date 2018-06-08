package com.fr.jsp.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fr.jsp.product.model.service.ProductService;
import com.fr.jsp.product.model.vo.ProductSimple;
import com.google.gson.Gson;

/**
 * Servlet implementation class SelectMostViewedProductServlet
 */
@WebServlet("/selectMostViewed.do")
public class SelectMostViewedProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ProductService  ps = new ProductService();   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectMostViewedProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<ProductSimple> list = ps.getMostViewedProduct();
		
		
		ArrayList<ProductSimple> subList = new ArrayList<ProductSimple>();
		
		for(int i =0;i<(list.size()>6?6:list.size());++i){
			subList.add(list.get(i));
		}
		
		new Gson().toJson(subList,response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
