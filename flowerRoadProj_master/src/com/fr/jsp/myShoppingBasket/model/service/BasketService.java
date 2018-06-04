package com.fr.jsp.myShoppingBasket.model.service;

import static com.fr.jdbc.common.JDBCTemplate.commit;
import static com.fr.jdbc.common.JDBCTemplate.getConnection;
import static com.fr.jdbc.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.fr.jsp.member.model.vo.Member;
import com.fr.jsp.myShoppingBasket.model.dao.BasketDao;
import com.fr.jsp.myShoppingBasket.model.vo.Basket;

public class BasketService {
	
	private Connection con;
	
	public BasketService(){
		con = getConnection();
	}
	
	

	public ArrayList<Basket> selectBasket(String member_num){				
		ArrayList<Basket> list = new ArrayList<Basket>();
		
		
		list = new BasketDao().selectBasket(con, member_num);
				
		return list;
		
	}
	
	public ArrayList<Basket> selectOption(){
		
		ArrayList<Basket> list = new ArrayList<Basket>();
		
		list = new BasketDao().selectOption(con);
		
		return list;
	}
	
	public int insertOption(Basket bk){
				
		int result =0;
		result = new BasketDao().insertOption(con, bk);
		
		if(result >0) commit(con);
		else rollback(con);
		
		return result;
	}
	
	public int updateQuantity(Basket bk){
						
		int result = 0;
		result = new BasketDao().updateQuantity(con, bk);
		
		if(result >0) commit(con);
		else rollback(con);
		
		return result;
	}
	
	public int deleteBasket(String product_num){
					
		int result = 0;
		result = new BasketDao().deleteProduct(con, product_num);
		
		if(result >0) commit(con);
		else rollback(con);
		
		return result;
		
	}
	
	public ArrayList<Basket> sendPayPage(String member_num){
				
		return new BasketDao().sendPayPage(con, member_num);
		
	}
	
	public Member sendInfoToPayPage(String member_num){
		return new BasketDao().sendInfoToPayPage(con, member_num);
	}



	public int insertToBasket(String memberNum, String productNum) {
		
		int result = new BasketDao().insertToBasket(con,memberNum,productNum);
		
		if(result>0)
			commit(con);
		else
			rollback(con);
		
		return result;
	}
	
	public int isExistProduct(String memberNum, String productNum){
		
		int result = new BasketDao().isExistProduct(con,memberNum,productNum);
		
		if(result>=0)
			commit(con);
		else
			rollback(con);
		
		return result;
		
	}

	public int increseQuantityByOne(String memberNum, String productNum) {
		
		int result = new BasketDao().increseQuantityByOne(con,memberNum, productNum);
		
		if(result >0) commit(con);
		else rollback(con);
		
		return result;
	}
	
}
