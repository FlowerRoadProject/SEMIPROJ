package com.fr.jsp.myShoppingBasket.model.dao;

import static com.fr.jdbc.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.fr.jsp.member.model.vo.Member;
import com.fr.jsp.myShoppingBasket.model.vo.*;



public class BasketDao {
	
	private Properties prop;
	
	public BasketDao(){
		prop = new Properties();
		String fileName = BasketDao.class.getResource("/config/myShoppingBasket/basket-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	public ArrayList<Basket> selectBasket(Connection con, String member_num){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Basket bk;
		ArrayList<Basket> list = new ArrayList<Basket>();
		String query = prop.getProperty("selectBasket");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, member_num);
			rset = pstmt.executeQuery();
			
			while(rset.next()){
			
			bk= new Basket();
			bk.setMember_num(member_num);
			bk.setProduct_num(rset.getString("PRODUCT_NUM"));
			bk.setQuantity(rset.getInt("QUANTITY"));
			bk.setProduct_price(rset.getInt("PRODUCT_PRICE"));
			bk.setProduct_name(rset.getString("PRODUCT_NAME"));
			bk.setImage(rset.getString("IMAGE_PATH"));
			bk.setCategory(rset.getString("PRODUCT_CATEGORY"));
			
			
			list.add(bk);
			}
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	
	public ArrayList<Basket> selectOption(Connection con){
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectOption");
		
		Basket bk;
		ArrayList<Basket> list = new ArrayList<Basket>();
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()){
				String num = rset.getString("PRODUCT_NUM");
				String name = rset.getString("PRODUCT_NAME");
				int price = rset.getInt("PRODUCT_PRICE");
				String image = rset.getString("IMAGE_PATH");
				bk = new Basket(num, price, name, image);
				list.add(bk);
			}
			
			
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}
		
		
		return list;
	}
	
	
	public int insertOption(Connection con, Basket bk){
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertOption");		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,bk.getMember_num());
			pstmt.setString(2,bk.getProduct_num());
			pstmt.setInt(3, bk.getQuantity());
						
			result = pstmt.executeUpdate();			
			
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
				
		return result;
	}
	
	public int updateQuantity(Connection con, Basket bk){
		PreparedStatement pstmt = null;		
		int result = 0;
		String query = prop.getProperty("updateQuantity");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(2, bk.getProduct_num());
			pstmt.setInt(1, bk.getQuantity());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteProduct(Connection con, String product_num){
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("deleteBasket");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, product_num);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
		
		
	}
	
	public ArrayList<Basket> sendPayPage(Connection con, String member_num){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("fromBasketToPayPage");
		Basket bk;
		ArrayList<Basket> list = new ArrayList<Basket>();		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, member_num);
			rset = pstmt.executeQuery();			
			
			while(rset.next()){
				bk = new Basket(rset.getString("PRODUCT_NUM"),rset.getInt("QUANTITY"), 
						rset.getInt("PRODUCT_PRICE"), rset.getString("PRODUCT_NAME"),rset.getString("IMAGE_PATH"),rset.getString("PRODUCT_CATEGORY"));
				list.add(bk);
			}
			
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public Member sendInfoToPayPage(Connection con, String member_num){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = new Member();  
		
		String query = prop.getProperty("selectInfoOfMember");
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, member_num);
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				m.setMemberName(rset.getString("MEMBER_NAME"));
				m.setMemberPhone(rset.getString("MEMBER_PHONE"));
				m.setMemberAddress(rset.getString("MEMBER_ADDRESS"));
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return m;
	}


	public int insertToBasket(Connection con ,String memberNum, String productNum) {
		PreparedStatement pstmt = null;
	
		int result = 0;
		try{
			pstmt=con.prepareStatement(prop.getProperty("addToBasket"));
			pstmt.setString(1, memberNum);
			pstmt.setString(2, productNum);
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}


	public int isExistProduct(Connection con, String memberNum, String productNum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result =  0;
		String query = prop.getProperty("isExistProduct");
			
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memberNum);
			pstmt.setString(2, productNum);
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				result=  rset.getInt(1);
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return result;
		
	}


	public int increseQuantityByOne(Connection con, String memberNum, String productNum) {
		
		PreparedStatement pstmt = null;		
		int result = 0;
		String query = prop.getProperty("increseQuantityByOne");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,memberNum);
			pstmt.setString(2, productNum);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		
		return result;
	}
	
	public ArrayList<Coupon> selectCoupon(Connection con, String member_num){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Coupon> list = new ArrayList<Coupon>();
		Coupon c;
		
		String query = prop.getProperty("selectCoupon");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, member_num);
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				c = new Coupon();
				c.setDistNum(rset.getString("DIST_NUM"));
				c.setCouponName(rset.getString("COUPON_NAME"));
				c.setAmount(rset.getInt("DISCOUNT_AMOUNT"));
				c.setExpiration(rset.getInt("EXPIRATION"));
				list.add(c);		
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
	
	public Basket selectExcess(Connection con, String memberNum){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Basket excess = null;
		String query = prop.getProperty("selectExcess");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memberNum);
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				excess = new Basket();
				excess.setProduct_name(rset.getString("PRODUCT_NAME"));
				excess.setProduct_num(rset.getString("PRODUCT_NUM"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return excess;
		
		
	}


	public int deleteOnlyOption(Connection con, String memberNum) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("deleteOnlyOption");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memberNum);
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
