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
 * Servlet implementation class SelectTopSellingServlet
 */
@WebServlet("/getTopSelling.do")
public class SelectTopSellingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ProductService ps = new ProductService();
	
    public SelectTopSellingServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<ProductSimple> list = null;
		int index =0;
		
		if(request.getParameter("idx")!=null)
			index= Integer.parseInt(request.getParameter("idx"));
		
		list = ps.getTopSellingProduct(index);
	
		
		new Gson().toJson(list,response.getWriter());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
