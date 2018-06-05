package com.fr.jsp.order.model.service;

import static com.fr.jdbc.common.JDBCTemplate.close;
import static com.fr.jdbc.common.JDBCTemplate.commit;
import static com.fr.jdbc.common.JDBCTemplate.getConnection;
import static com.fr.jdbc.common.JDBCTemplate.rollback;


import java.sql.Connection;
import java.util.ArrayList;

import com.fr.jsp.member.model.vo.Member;
import com.fr.jsp.order.model.dao.OrderDao;
import com.fr.jsp.order.model.vo.Order;
import com.fr.jsp.order.model.vo.MyPage_Order;

public class OrderService {

	private Connection con;
	private OrderDao oDao;
	
	public OrderService(){
		con = getConnection();
		oDao = new OrderDao();
		
	}
	
	
	public int insertOrder(ArrayList<Order> list){
		
		int result = oDao.insertOrder(con, list);
		
		if(result >0) commit(con);
		else rollback(con);		
		
		
		return result;
	}
	
	public Order orderChk(Member m) {
		// TODO Auto-generated method stub
		return null;
	}
	
		public void closeCon(){
			close(con);
		}
		
		public ArrayList<MyPage_Order> orderChk(String id) {
			Connection con = getConnection();
			
			ArrayList<MyPage_Order> list = oDao.orderChk(con, id);
			
			close(con);
			
			return list;
		}
}
