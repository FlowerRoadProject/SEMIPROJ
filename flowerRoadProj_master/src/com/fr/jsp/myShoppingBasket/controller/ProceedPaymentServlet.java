package com.fr.jsp.myShoppingBasket.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
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
 * Servlet implementation class ProceedPaymentServlet
 */
@WebServlet("/payment.bk")
public class ProceedPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProceedPaymentServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		String memberNum = (String) session.getAttribute("memberNum");
		String page = "";
		
		if (memberNum == null) {
			request.setAttribute("msg", "잘못된 접근입니다");
			page = "views/common/errorPage.jsp";
		} else {

			String[] pNums = request.getParameter("sub_product_num").split(",");
			String[] prices = request.getParameter("sub_product_price").split(",");
			String[] pNames = request.getParameter("sub_product_name").split(",");
			String[] pImages = request.getParameter("sub_product_image").split(",");
			ArrayList<Coupon> cList = new BasketService().selectCoupon(memberNum);
			ArrayList<Basket> pList = new ArrayList<Basket>();
			Basket b = null;

			for (int i = 0; i < pNums.length; ++i) {
				b = new Basket(pNums[i], 1, Integer.parseInt(prices[i]), pNames[i], pImages[i]);
				pList.add(b);

			}

			System.out.println((String) session.getAttribute("memberNum"));

			Member m = new BasketService().sendInfoToPayPage((String) session.getAttribute("memberNum"));
			request.setAttribute("member", m);
			request.setAttribute("pList", pList);
			request.setAttribute("cList", cList);
		}
		
		RequestDispatcher view = request.getRequestDispatcher("/views/myShoppingBasket/order&pay.jsp");
		view.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
