package com.fr.jsp.order.model.service;

import static com.fr.jdbc.common.JDBCTemplate.close;
import static com.fr.jdbc.common.JDBCTemplate.commit;
import static com.fr.jdbc.common.JDBCTemplate.getConnection;
import static com.fr.jdbc.common.JDBCTemplate.rollback;


import java.sql.Connection;
import java.sql.Date;
import java.sql.Timestamp;
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
		Connection con= getConnection();
		int result = oDao.insertOrder(con, list);
		
		if(result >0) commit(con);
		else rollback(con);		
		
		close(con);
		return result;
	}
	
	public Order orderChk(Member m) {
		// TODO Auto-generated method stub
		return null;
	}
	
		public void closeCon(){
			close(con);
		}
		
		public ArrayList<MyPage_Order> orderChk(String num, int currentPage, int limit) {
			Connection con = getConnection();
			
			ArrayList<MyPage_Order> list = oDao.orderChk(con, num, currentPage,limit);
			
			close(con);
			
			return list;
		}

		public int getListCount(String num) {
			Connection con = getConnection();
			int result= oDao.getListCount(con, num);
			
			close(con);
			return result;
		}
		
	

	public String selectOrderNum(String memberNum) {
		Connection con= getConnection();
		String orderNum = oDao.selectOrderNum(con, memberNum);
		close(con);
		return orderNum;
	}
	
	public int insertOrderProList(String orderNum, String productNum, int quantity, String message){
		Connection con= getConnection();
		int result = 0;
		result = oDao.insertOrderProList(con,orderNum, productNum, quantity, message);
		
		if(result >0) commit(con);
		else rollback(con);	
		
		close(con);
		return result;
	}


	public ArrayList<MyPage_Order> orderChkSearch(String num, int currentPage, int limit, String start,
			String end) {
		Connection con = getConnection();
		
		ArrayList<MyPage_Order> list = oDao.orderChkSearch(con, num, currentPage,limit, start, end);
		
		close(con);
		
		return list;
	}


	public int getChkListCount(String num, int currentPage, int limit, String start, String end) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		
		int result = oDao.chkListCount(con, num, currentPage,limit, start, end);
		
		close(con);
		
		return result;
	}
		
}
