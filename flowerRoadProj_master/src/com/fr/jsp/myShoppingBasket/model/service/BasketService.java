package com.fr.jsp.myShoppingBasket.model.service;

import static com.fr.jdbc.common.JDBCTemplate.close;
import static com.fr.jdbc.common.JDBCTemplate.commit;
import static com.fr.jdbc.common.JDBCTemplate.getConnection;
import static com.fr.jdbc.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.fr.jsp.member.model.vo.Member;
import com.fr.jsp.myShoppingBasket.model.dao.BasketDao;
import com.fr.jsp.myShoppingBasket.model.vo.*;
import com.fr.jsp.myShoppingBasket.model.vo.Coupon;

public class BasketService {
	
	private Connection con;
	
	public BasketService(){
		con = getConnection();
	}
	
	

	public ArrayList<Basket> selectBasket(String member_num){				
		Connection con = getConnection();
		ArrayList<Basket> list = new ArrayList<Basket>();
		
		
		list = new BasketDao().selectBasket(con, member_num);
		close(con);		
		return list;
		
	}
	
	public ArrayList<Basket> selectOption(){
		Connection con = getConnection();
		ArrayList<Basket> list = new ArrayList<Basket>();
		
		list = new BasketDao().selectOption(con);
		close(con);	
		return list;
	}
	
	public int insertOption(Basket bk){
		Connection con = getConnection();	
		int result =0;
		result = new BasketDao().insertOption(con, bk);
		
		if(result >0) commit(con);
		else rollback(con);
		close(con);	
		return result;
	}
	
	public int updateQuantity(Basket bk){
		Connection con = getConnection();		
		int result = 0;
		result = new BasketDao().updateQuantity(con, bk);
		
		if(result >0) commit(con);
		else rollback(con);
		close(con);	
		return result;
	}
	
	public int deleteBasket(String product_num){
		Connection con = getConnection();
		int result = 0;
		result = new BasketDao().deleteProduct(con, product_num);
		
		if(result >0) commit(con);
		else rollback(con);
		
		close(con);	
		return result;
		
	}
	
	public ArrayList<Basket> sendPayPage(String member_num){
		Connection con = getConnection();
		ArrayList<Basket> list = new BasketDao().sendPayPage(con, member_num);
		
		return list;
		
	}
	
	public Member sendInfoToPayPage(String member_num){
		Connection con = getConnection();
		Member m = new BasketDao().sendInfoToPayPage(con, member_num);
		
		
		return m;
	}



	public int insertToBasket(String memberNum, String productNum) {
		Connection con = getConnection();
		int result = new BasketDao().insertToBasket(con,memberNum,productNum);
		
		if(result>0)
			commit(con);
		else
			rollback(con);
		close(con);	
		return result;
	}
	
	public int isExistProduct(String memberNum, String productNum){
		Connection con = getConnection();
		int result = new BasketDao().isExistProduct(con,memberNum,productNum);
		
		if(result>=0)
			commit(con);
		else
			rollback(con);
		close(con);	
		return result;
		
	}

	public int increseQuantityByOne(String memberNum, String productNum) {
		Connection con = getConnection();
		int result = new BasketDao().increseQuantityByOne(con,memberNum, productNum);
		
		if(result >0) commit(con);
		else rollback(con);
		close(con);	
		return result;
	}
	public ArrayList<Coupon> selectCoupon(String member_num){
		Connection con = getConnection();
		ArrayList<Coupon> list = new BasketDao().selectCoupon(con, member_num);
		close(con);
		return list;
	}
	
	public Basket selectExcess(String memberNum){
		Connection con = getConnection();
		Basket excessProduct = new BasketDao().selectExcess(con, memberNum);
		close(con);
		return excessProduct;
	}
	
	
}
