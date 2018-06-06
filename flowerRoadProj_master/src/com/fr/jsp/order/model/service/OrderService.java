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
		
	public ArrayList<Order> selectDT(String memberNum, int length){
		ArrayList<Order> list = oDao.selectDT(con, memberNum, length);
		return list;	
	}
	public ArrayList<Order> selectCD(String memberNum, int length){
		ArrayList<Order> list = oDao.selectDT(con, memberNum, length);
		return list;	
	}
	public ArrayList<Order> selectTG(String memberNum, int length){
		ArrayList<Order> list = oDao.selectDT(con, memberNum, length);
		return list;	
	}


	public String selectOrderNum(String memberNum) {
		String orderNum = oDao.selectOrderNum(con, memberNum);
		return orderNum;
	}
	
	public int insertOrderProList(String orderNum, String productNum, int quantity, String message){
		int result = 0;
		result = oDao.insertOrderProList(con,orderNum, productNum, quantity, message);
		
		if(result >0) commit(con);
		else rollback(con);	
		
		
		return result;
	}
		
}
