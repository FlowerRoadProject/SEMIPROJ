package com.fr.jsp.myShoppingBasket.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fr.jsp.member.model.vo.Member;
import com.fr.jsp.myShoppingBasket.model.service.BasketService;
import com.fr.jsp.myShoppingBasket.model.vo.Basket;
import com.fr.jsp.myShoppingBasket.model.vo.Coupon;

/**
 * Servlet implementation class BasketToPayServlet
 */
@WebServlet("/basketPay.bk")
public class BasketToPayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BasketToPayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	/*	String []name = request.getParameterValues("name");
		String []quantity = request.getParameterValues("quantity");
		String []price = request.getParameterValues("price");
		String []image = request.getParameterValues("img");
		
		System.out.println("이곳으로 들어오는 자료의 갯수 : "+name.length);
		
		//pList에 상품들 정보 넣기
		ArrayList<PayProduct> pList = new ArrayList<PayProduct>();
		for(int i =0 ; i< name.length;i++){
			if(name[i] != "" && quantity[i] != "" && price[i] != "" && image[i] != ""){
				System.out.println("자료들 넘어와요? : "+name[i]+", "+quantity[i]+", "+price[i]+", "+image[i]);
				pList.add(new PayProduct(name[i],quantity[i],price[i],image[i]));
			}
		}*/
		
		HttpSession session = request.getSession(false);
		
		String member_num = (String)session.getAttribute("member_num");
		
		BasketService bService = new BasketService();
		
		ArrayList<Basket> list = bService.sendPayPage(member_num);
				
		Member m = bService.sendInfoToPayPage(member_num);
		ArrayList<Coupon> cList = new BasketService().selectCoupon(member_num);
		
		System.out.println("cList.size(): "+cList.size());
		request.setAttribute("cList", cList);
		request.setAttribute("pList", list);
		request.setAttribute("member",m);
		request.getRequestDispatcher("/views/myShoppingBasket/order&pay.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
