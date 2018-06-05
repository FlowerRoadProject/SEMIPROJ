package com.fr.jsp.order.model.dao;

import static com.fr.jdbc.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.*;

import java.util.ArrayList;
import java.util.Properties;

import com.fr.jsp.myShoppingBasket.model.dao.BasketDao;
import com.fr.jsp.order.model.vo.MyPage_Order;
import com.fr.jsp.order.model.vo.Order;


public class OrderDao {

	private Properties prop;
	
	public OrderDao(){
		prop = new Properties();
		String fileName = BasketDao.class.getResource("/config/order/order.properties").getPath();
		
			try {
				prop.load(new FileReader(fileName));
			} catch (FileNotFoundException e) {				
				e.printStackTrace();
			} catch (IOException e) {				
				e.printStackTrace();
			}
	}
	
	public int insertOrder(Connection con, ArrayList<Order> list){
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("orderProduct");
		int result = 0;
		try {
			/*--상품코드
			--회원코드
			--상품코드
			--주문일
			--받는이
			--받는주소
			--받는사람전화번호
			*/
			pstmt = con.prepareStatement(query);
			
			for(int i = 0; i < list.size();i++){	
				pstmt.setString(1, list.get(i).getMember_num());								
				pstmt.setTimestamp(2, list.get(i).getReservation_date());				
				pstmt.setString(3, list.get(i).getDelivery_message());
				pstmt.setString(4, list.get(i).getReceiver_name());
				pstmt.setString(5, list.get(i).getReceiver_address());
				pstmt.setString(6, list.get(i).getReceiver_phone());
				pstmt.setString(7, list.get(i).getAnonymous_delivery());
				result += pstmt.executeUpdate();			
			}
			System.out.println("Dao에서의 date: "+list.get(0).getReservation_date());
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}
	  
	   public ArrayList<MyPage_Order> orderChk(Connection con, String id) {

	         ArrayList<MyPage_Order> list = null;
	         PreparedStatement pstmt = null;
	         ResultSet rset = null;
	         
	         String query = prop.getProperty("orderChk");
	         
	         try {
	            pstmt = con.prepareStatement(query);
	            pstmt.setString(1, id);
	            
	            rset = pstmt.executeQuery();
	            
	            list = new ArrayList<MyPage_Order>();
	            while(rset.next()){
	               MyPage_Order mpo = new MyPage_Order();
	               mpo.setOrdered_date(rset.getDate(1));
	               mpo.setProduct_num(rset.getString(2));
	               mpo.setProduct_cost(rset.getInt(3));
	               mpo.setAnonymous_delivery(rset.getString(4));
	               mpo.setOrder_state_code(rset.getString(5));
	               
	               list.add(mpo);
	            }
	            
	            
	         } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }
	         
	            
	         return list;
	      }
	   
	   	   
	  
	   
	  public ArrayList<Order> selectDT(Connection con, String memberNum, int length){
		   ArrayList<Order> list = null;
		   PreparedStatement pstmt = null;
		   ResultSet rset = null;
		   Order o = null;
		   String query = prop.getProperty("selectDT");
		   
		   try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memberNum);
			pstmt.setInt(2, length);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Order>();
			while(rset.next()){
				o = new Order();
				o.setOrder_num(rset.getString("ORDER_NUM"));
				o.setProduct_num(rset.getString("PRODUCT_NUM"));
				o.setQuantity(rset.getInt("PRODUCT_AMOUNT"));
				
				list.add(o);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		  
		   return list;
		   
		   
	   }
	   public ArrayList<Order> selectCD(Connection con, String memberNum, int length){
		   ArrayList<Order> list = null;
		   PreparedStatement pstmt = null;
		   ResultSet rset = null;
		   Order o = null;
		   String query = prop.getProperty("selectCD");
		   
		   try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memberNum);
			pstmt.setInt(2, length);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Order>();
			while(rset.next()){
				o = new Order();
				o.setOrder_num(rset.getString("ORDER_NUM"));
				o.setProduct_num(rset.getString("PRODUCT_NUM"));
				o.setQuantity(rset.getInt("PRODUCT_AMOUNT"));
				
				list.add(o);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		  
		   return list;
		   
		   
	   }
	   public ArrayList<Order> selectTG(Connection con, String memberNum, int length){
		   ArrayList<Order> list = null;
		   PreparedStatement pstmt = null;
		   ResultSet rset = null;
		   Order o = null;
		   String query = prop.getProperty("selectTG");
		   
		   try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memberNum);
			pstmt.setInt(2, length);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Order>();
			while(rset.next()){
				o = new Order();
				o.setOrder_num(rset.getString("ORDER_NUM"));
				o.setProduct_num(rset.getString("PRODUCT_NUM"));
				o.setQuantity(rset.getInt("PRODUCT_AMOUNT"));
				
				list.add(o);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		  
		   return list;
		   
		   
	   }

	public String selectOrderNum(Connection con, String memberNum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String orderNum = null;
		String query = prop.getProperty("selectOrderNum");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memberNum);
			rset = pstmt.executeQuery();
			if(rset.next()){
				orderNum = rset.getString("ORDER_NUM");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return orderNum;
	}
	   
	public int insertOrderProList(Connection con, String orderNum, String productNum, int quantity, String message){
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertProList");
		System.out.println("잘들어오니?");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, orderNum);
			pstmt.setString(2, productNum);
			pstmt.setInt(3, quantity);
			pstmt.setString(4, message);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}
	
	
}
