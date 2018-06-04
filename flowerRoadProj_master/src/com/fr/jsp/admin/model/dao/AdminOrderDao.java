package com.fr.jsp.admin.model.dao;

import static com.fr.jdbc.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import com.fr.jsp.admin.model.vo.AdminOrder;
import com.fr.jsp.order.model.vo.Order;

public class AdminOrderDao {
	private Properties prop;
	
	public AdminOrderDao() {
		super();
		prop = new Properties();
		String fileName = AdminOrderDao.class.getResource("/config/admin/order_query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	// 오늘 등록된 주문 수
	public int admin_todayOrder(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int admin_orderCount = 0;
		
		try { 
			String query = prop.getProperty("admin_todayOrderCount");
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()){
				admin_orderCount = Integer.parseInt(rset.getString("COUNT(MEMBER_NUM)"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return admin_orderCount;
	}
	// 전체 주문/배송 리스트
	public ArrayList<AdminOrder> admin_allDeliveryList(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AdminOrder> admin_allDeliveryList = null;
		
		try { 
			String query = prop.getProperty("admin_allDeliveryList");
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			admin_allDeliveryList = new ArrayList<AdminOrder>();
			while(rset.next()){
				AdminOrder order = new AdminOrder();
				
				order.setOrderNum(rset.getString("ORDER_NUM"));
				order.setMemberName(rset.getString("MEMBER_NAME"));
				order.setProductName(rset.getString("PRODUCT_NAME"));
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd kk:mm");
		        Date u_date = format.parse(rset.getString("ORDERED_DATE"));
		        java.sql.Timestamp ordered_date = new java.sql.Timestamp(u_date.getTime());
		        order.setOrderedDate(ordered_date);
		        Date u_date1 = format.parse(rset.getString("RESERVATION_DATE"));
		        java.sql.Timestamp reservation_date = new java.sql.Timestamp(u_date1.getTime());
		        order.setReservationDate(reservation_date);
		        order.setReceiverName(rset.getString("RECEIVER_NAME"));
		        order.setReceiverAddress(rset.getString("RECEIVER_ADDRESS"));
		        order.setReceiverPhone(rset.getString("RECEIVER_PHONE"));
		        order.setOrderStateName(rset.getString("ORDER_STATE_NAME"));
		        order.setProductAmount(Integer.parseInt(rset.getString("PRODUCT_AMOUNT")));
		        if(rset.getString("DELIVERY_MESSAGE")==null){
		        	order.setDeliveryMessage("");
		        }else{
		        	order.setDeliveryMessage(rset.getString("DELIVERY_MESSAGE"));
		        }
		        order.setAnonymousDelivery(rset.getString("ANONYMOUS_DELIVERY"));
		        
		        admin_allDeliveryList.add(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return admin_allDeliveryList;
	}
	// 결제 완료 주문 리스트
	public ArrayList<AdminOrder> admin_paycompleteList(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AdminOrder> admin_paycompleteList = null;
		
		try { 
			String query = prop.getProperty("admin_orderList");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "PC");
			rset = pstmt.executeQuery();
			admin_paycompleteList = new ArrayList<AdminOrder>();
			while(rset.next()){
				AdminOrder order = new AdminOrder();
				
				order.setOrderNum(rset.getString("ORDER_NUM"));
				order.setMemberName(rset.getString("MEMBER_NAME"));
				order.setProductName(rset.getString("PRODUCT_NAME"));
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		        Date u_date = format.parse(rset.getString("ORDERED_DATE"));
		        java.sql.Timestamp ordered_date = new java.sql.Timestamp(u_date.getTime());
		        order.setOrderedDate(ordered_date);
		        Date u_date1 = format.parse(rset.getString("RESERVATION_DATE"));
		        java.sql.Timestamp reservation_date = new java.sql.Timestamp(u_date1.getTime());
		        order.setReservationDate(reservation_date);
		        order.setReceiverName(rset.getString("RECEIVER_NAME"));
		        order.setReceiverAddress(rset.getString("RECEIVER_ADDRESS"));
		        order.setReceiverPhone(rset.getString("RECEIVER_PHONE"));
		        order.setOrderStateName(rset.getString("ORDER_STATE_NAME"));
		        order.setProductAmount(Integer.parseInt(rset.getString("PRODUCT_AMOUNT")));
		        if(rset.getString("DELIVERY_MESSAGE")==null){
		        	order.setDeliveryMessage("");
		        }else{
		        	order.setDeliveryMessage(rset.getString("DELIVERY_MESSAGE"));
		        }
		        order.setAnonymousDelivery(rset.getString("ANONYMOUS_DELIVERY"));
		        
		        admin_paycompleteList.add(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return admin_paycompleteList;
	}
	// 상품 준비 주문 리스트
	public ArrayList<AdminOrder> admin_productReadyList(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AdminOrder> admin_productReadyList = null;
		
		try { 
			String query = prop.getProperty("admin_orderList");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "PR");
			rset = pstmt.executeQuery();
			admin_productReadyList = new ArrayList<AdminOrder>();
			while(rset.next()){
				AdminOrder order = new AdminOrder();
				
				order.setOrderNum(rset.getString("ORDER_NUM"));
				order.setMemberName(rset.getString("MEMBER_NAME"));
				order.setProductName(rset.getString("PRODUCT_NAME"));
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		        Date u_date = format.parse(rset.getString("ORDERED_DATE"));
		        java.sql.Timestamp ordered_date = new java.sql.Timestamp(u_date.getTime());
		        order.setOrderedDate(ordered_date);
		        Date u_date1 = format.parse(rset.getString("RESERVATION_DATE"));
		        java.sql.Timestamp reservation_date = new java.sql.Timestamp(u_date1.getTime());
		        order.setReservationDate(reservation_date);
		        order.setReceiverName(rset.getString("RECEIVER_NAME"));
		        order.setReceiverAddress(rset.getString("RECEIVER_ADDRESS"));
		        order.setReceiverPhone(rset.getString("RECEIVER_PHONE"));
		        order.setOrderStateName(rset.getString("ORDER_STATE_NAME"));
		        order.setProductAmount(Integer.parseInt(rset.getString("PRODUCT_AMOUNT")));
		        if(rset.getString("DELIVERY_MESSAGE")==null){
		        	order.setDeliveryMessage("");
		        }else{
		        	order.setDeliveryMessage(rset.getString("DELIVERY_MESSAGE"));
		        }
		        order.setAnonymousDelivery(rset.getString("ANONYMOUS_DELIVERY"));
		        
		        admin_productReadyList.add(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return admin_productReadyList;
	}
	// 배송 출발 주문 리스트
	public ArrayList<AdminOrder> admin_deliverystartList(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AdminOrder> admin_deliverystartList = null;
		
		try { 
			String query = prop.getProperty("admin_orderList");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "DS");
			rset = pstmt.executeQuery();
			admin_deliverystartList = new ArrayList<AdminOrder>();
			while(rset.next()){
				AdminOrder order = new AdminOrder();
				
				order.setOrderNum(rset.getString("ORDER_NUM"));
				order.setMemberName(rset.getString("MEMBER_NAME"));
				order.setProductName(rset.getString("PRODUCT_NAME"));
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		        Date u_date = format.parse(rset.getString("ORDERED_DATE"));
		        java.sql.Timestamp ordered_date = new java.sql.Timestamp(u_date.getTime());
		        order.setOrderedDate(ordered_date);
		        Date u_date1 = format.parse(rset.getString("RESERVATION_DATE"));
		        java.sql.Timestamp reservation_date = new java.sql.Timestamp(u_date1.getTime());
		        order.setReservationDate(reservation_date);
		        order.setReceiverName(rset.getString("RECEIVER_NAME"));
		        order.setReceiverAddress(rset.getString("RECEIVER_ADDRESS"));
		        order.setReceiverPhone(rset.getString("RECEIVER_PHONE"));
		        order.setOrderStateName(rset.getString("ORDER_STATE_NAME"));
		        order.setProductAmount(Integer.parseInt(rset.getString("PRODUCT_AMOUNT")));
		        if(rset.getString("DELIVERY_MESSAGE")==null){
		        	order.setDeliveryMessage("");
		        }else{
		        	order.setDeliveryMessage(rset.getString("DELIVERY_MESSAGE"));
		        }
		        order.setAnonymousDelivery(rset.getString("ANONYMOUS_DELIVERY"));
		        
		        admin_deliverystartList.add(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return admin_deliverystartList;
	}
	// 배송 완료 주문 리스트
	public ArrayList<AdminOrder> admin_deliverycompleteList(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AdminOrder> admin_deliverycompleteList = null;
		
		try { 
			String query = prop.getProperty("admin_orderList");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "DC");
			rset = pstmt.executeQuery();
			admin_deliverycompleteList = new ArrayList<AdminOrder>();
			while(rset.next()){
				AdminOrder order = new AdminOrder();
				
				order.setOrderNum(rset.getString("ORDER_NUM"));
				order.setMemberName(rset.getString("MEMBER_NAME"));
				order.setProductName(rset.getString("PRODUCT_NAME"));
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		        Date u_date = format.parse(rset.getString("ORDERED_DATE"));
		        java.sql.Timestamp ordered_date = new java.sql.Timestamp(u_date.getTime());
		        order.setOrderedDate(ordered_date);
		        Date u_date1 = format.parse(rset.getString("RESERVATION_DATE"));
		        java.sql.Timestamp reservation_date = new java.sql.Timestamp(u_date1.getTime());
		        order.setReservationDate(reservation_date);
		        order.setReceiverName(rset.getString("RECEIVER_NAME"));
		        order.setReceiverAddress(rset.getString("RECEIVER_ADDRESS"));
		        order.setReceiverPhone(rset.getString("RECEIVER_PHONE"));
		        order.setOrderStateName(rset.getString("ORDER_STATE_NAME"));
		        order.setProductAmount(Integer.parseInt(rset.getString("PRODUCT_AMOUNT")));
		        if(rset.getString("DELIVERY_MESSAGE")==null){
		        	order.setDeliveryMessage("");
		        }else{
		        	order.setDeliveryMessage(rset.getString("DELIVERY_MESSAGE"));
		        }
		        order.setAnonymousDelivery(rset.getString("ANONYMOUS_DELIVERY"));
		        
		        admin_deliverycompleteList.add(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return admin_deliverycompleteList;
	}
	// 구매 취소 주문 리스트
	public ArrayList<AdminOrder> admin_ordercancleList(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AdminOrder> admin_ordercancleList = null;
		
		try { 
			String query = prop.getProperty("admin_orderList");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "OC");
			rset = pstmt.executeQuery();
			admin_ordercancleList = new ArrayList<AdminOrder>();
			while(rset.next()){
				AdminOrder order = new AdminOrder();
				
				order.setOrderNum(rset.getString("ORDER_NUM"));
				order.setMemberName(rset.getString("MEMBER_NAME"));
				order.setProductName(rset.getString("PRODUCT_NAME"));
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		        Date u_date = format.parse(rset.getString("ORDERED_DATE"));
		        java.sql.Timestamp ordered_date = new java.sql.Timestamp(u_date.getTime());
		        order.setOrderedDate(ordered_date);
		        Date u_date1 = format.parse(rset.getString("RESERVATION_DATE"));
		        java.sql.Timestamp reservation_date = new java.sql.Timestamp(u_date1.getTime());
		        order.setReservationDate(reservation_date);
		        order.setReceiverName(rset.getString("RECEIVER_NAME"));
		        order.setReceiverAddress(rset.getString("RECEIVER_ADDRESS"));
		        order.setReceiverPhone(rset.getString("RECEIVER_PHONE"));
		        order.setOrderStateName(rset.getString("ORDER_STATE_NAME"));
		        order.setProductAmount(Integer.parseInt(rset.getString("PRODUCT_AMOUNT")));
		        if(rset.getString("DELIVERY_MESSAGE")==null){
		        	order.setDeliveryMessage("");
		        }else{
		        	order.setDeliveryMessage(rset.getString("DELIVERY_MESSAGE"));
		        }
		        order.setAnonymousDelivery(rset.getString("ANONYMOUS_DELIVERY"));
		        
		        admin_ordercancleList.add(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return admin_ordercancleList;
	}
	// 상품 주문 코드 변경
	public int admin_updateOrderState(Connection con, Order order) {
		PreparedStatement pstmt = null;
		int rset = 0;
		
		try { 
			String query = prop.getProperty("admin_updateOrderState");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,order.getOrder_state_code());
			pstmt.setString(2,order.getOrder_num());
			rset = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return rset;
	}
	// 주문/배송 환불
	public int admin_updateRefundOrder(Connection con, Order order) {
		PreparedStatement pstmt = null;
		int rset = 0;
		
		try { 
			String query = prop.getProperty("admin_updateOrderState");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,"OC");
			pstmt.setString(2,order.getOrder_num());
			rset = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return rset;
	}

}
