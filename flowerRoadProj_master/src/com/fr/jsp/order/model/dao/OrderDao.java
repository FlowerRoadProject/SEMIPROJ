package com.fr.jsp.order.model.dao;

import static com.fr.jdbc.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.fr.jsp.myShoppingBasket.model.dao.BasketDao;
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
				pstmt.setString(1, list.get(i).getProduct_num());
				pstmt.setString(2, list.get(i).getMember_num());
				pstmt.setString(3, list.get(i).getProduct_num());
				pstmt.setInt(4, list.get(i).getQuantity());
				pstmt.setTimestamp(5, list.get(i).getReservation_date());				
				pstmt.setString(6, list.get(i).getDelivery_message());
				pstmt.setString(7, list.get(i).getReceiver_name());
				pstmt.setString(8, list.get(i).getReceiver_address());
				pstmt.setString(9, list.get(i).getReceiver_phone());
				pstmt.setString(10, list.get(i).getAnonymous_delivery());
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
	
	
}
