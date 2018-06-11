package com.fr.jsp.order.controller;

import java.io.IOException;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fr.jsp.myShoppingBasket.model.vo.Basket;

import com.fr.jsp.order.model.vo.Order;

/**
 * Servlet implementation class OrderMyProduct
 */
@WebServlet("/order.bk")
public class OrderMyProductServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
   
    public OrderMyProductServlet() {
        super();
       
    }
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      //이 서블릿은 결제정보를 결제 결과페이지로 단순히 데이터를 넘겨주는 역할을 한다
      
      HttpSession session = request.getSession();      
      Order o;
      Basket bk;
      //주문한 상품들의 정보
      String[] productNum = request.getParameterValues("productNum");
      String[] quantity = request.getParameterValues("quantity");
      String[] price = request.getParameterValues("price");
      String[] productName = request.getParameterValues("productName");      
      String[] image = request.getParameterValues("image");
      
      //주문자의 정보
      String member_num = (String) session.getAttribute("member_num");
      
      //받는사람의 정보
      
      String dt = request.getParameter("orderDate");        
      SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd kk:mm");
      
      Date parsed = null;      
      try {
         parsed = format.parse(dt);               
      } catch (ParseException e) {
         e.printStackTrace();
      }
      java.sql.Timestamp orderDate = new java.sql.Timestamp(parsed.getTime());      
                  
      String receiver = request.getParameter("receiver");
      String receiveAddress = request.getParameter("receiveAddress");
      String receivePhone = request.getParameter("receivePhone");
      String memo = request.getParameter("deliveryMemo");
      String anony = request.getParameter("anony");   
         
      ArrayList<Order> list = new ArrayList<Order>();
      ArrayList<Basket> bList = new ArrayList<Basket>();      
      
      for(int i = 0; i < productNum.length;i++){
         o = new Order(member_num, productNum[i], orderDate, receiver, receiveAddress, receivePhone, anony, memo, Integer.parseInt(quantity[i]));
         list.add(o);
      }            
      
      for(int i= 0; i< productNum.length; i++){         
         bk = new Basket(productNum[i], Integer.parseInt(quantity[i]), Integer.parseInt(price[i]), productName[i], image[i]);
         bList.add(bk);
      }         
      
      String page = "";
      if(member_num == null){
    	  page="views/common/errorPage.jsp";
    	  request.setAttribute("msg", "회원정보를 불러올수 없습니다");
      }else if(list == null || bList == null){
    	  page="views/common/errorPage.jsp";
    	  request.setAttribute("msg", "결제정보를 불러올 수 없습니다");     
      }else{
    	  page = "views/order/confirmOrder.jsp";
    	  request.setAttribute("list",list);
          request.setAttribute("bList", bList);
      }      
      request.getRequestDispatcher(page).forward(request, response);
     
      
      
   }

   
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}