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
	
	// 오늘 등록된 주문 수
		public int admin_todayOrder() {
			int admin_orderCount = oDao.admin_todayOrder(con);
			return admin_orderCount;
		}
		// 전체 주문/배송 수
		public int admin_allDeliveryCount() {
			ArrayList<Order> admin_allDeliveryList = oDao.admin_allDeliveryList(con);
			int admin_allDeliveryCount = admin_allDeliveryList.size();
			return admin_allDeliveryCount;
		}
		// 결제 완료된 주문 수
		public int admin_paycompleteCount() {
			int admin_paycompleteCount = oDao.admin_paycompleteCount(con);
			return admin_paycompleteCount;
		}
		// 배송 출발한 주문 수
		public int admin_deliverystartCount() {
			int admin_deliverystartCount = oDao.admin_deliverystartCount(con);
			return admin_deliverystartCount;
		}
		// 배송 완료된 주문 수
		public int admin_deliverycompleteCount() {
			int admin_deliverycompleteCount = oDao.admin_deliverycompleteCount(con);
			return admin_deliverycompleteCount;
		}
		// 구매 취소된 주문 수
		public int admin_ordercancleCount() {
			int admin_ordercancleCount = oDao.admin_ordercancleCount(con);
			return admin_ordercancleCount;
		}
	
		
		public void closeCon(){
			close(con);
		}
}
