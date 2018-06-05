package com.fr.jsp.product.model.service;

import static com.fr.jdbc.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Collections;

import com.fr.jsp.common.PageInfo;
import com.fr.jsp.product.model.dao.ProductDao;

import com.fr.jsp.product.model.vo.ProductDetail;
import com.fr.jsp.product.model.vo.ProductSimple;

public class ProductService {

	private Connection con;
	private ProductDao pDao;
	
	public ProductService() {
		super();
		con = getConnection();
		pDao = new ProductDao();
	}
	
	//모든 상품 리스트(페이지네이션 X)
	public ArrayList<ProductDetail> getProductList() {
		
		
		ArrayList<ProductDetail> list = null;
		
		con = getConnection();
		
		list =pDao.getProductList(con); 
		
		
		if(list!=null)commit(con);
		else rollback(con);
		
		
		return list;
	}

	
	//모든 상품 숫자
	public int getListCount() {
		con = getConnection();
		
		int result= 0;
		
		result =pDao.getProductCount(con);
		
		
		return result;
	}
	
	public int getListCount(String event,String category){
		con = getConnection();
		
		int result= 0;
		
		String columnName="";
		String columnValue="";
		String tableName= "";
		
		if(!event.equals("none")){
			columnName=  "PRODUCT_EVENT";
			columnValue = event;
			tableName = "PRODUCT_SIMPLE_EVENT";
		}
		
		if(!category.equals("none")){
			columnName=  "CATEGORY_NAME";
			columnValue = category;
			tableName= "PRODUCT_SIMPLE";
		}
		
		
		return pDao.getProductCount(con,tableName,columnName,columnValue);
		
		
	}

	
	//페이지 네이션 적용 상품 리스트 가져오기
	public ArrayList<ProductSimple> getProductList(PageInfo pi) {
		ArrayList<ProductSimple> list =null;
		con = getConnection();
		
		list = pDao.getProductList(con,pi);
	
		if(list!=null)commit(con);
		else rollback(con);
		
		
		return list;
	}

	
	//상품 하나만 가져오는거
	public ProductDetail getOneProduct(String productNum) {
		
		con = getConnection();
		
		ProductDetail p =pDao.getOneProduct(con,productNum); 
		
		if(p!=null)commit(con);
		else rollback(con);
		
		return p;
	}


	
	public ArrayList<ProductSimple> getOrderdProductList(String event, String category, String order) {
		ArrayList<ProductSimple> list =null;
		con = getConnection();
		
		String columnName="";
		String columnValue="";
		String tableName= "";
		String orderQuery = null;
		if(!event.equals("none")){
			columnName=  "PRODUCT_EVENT";
			columnValue = event;
			tableName = "PRODUCT_SIMPLE_EVENT";
		}
		
		if(!category.equals("none")){
			columnName=  "CATEGORY_NAME";
			columnValue = category;
			tableName= "PRODUCT_SIMPLE";
		}
		
		if(order.equals("review"))
			orderQuery=" ORDER BY 7 DESC";
		else if(order.equals("priceDesc"))
			orderQuery=" ORDER BY 3 DESC";
		else if(order.equals("priceAsc"))
			orderQuery=" ORDER BY 3";
		else if(order.equals("byName"))
			orderQuery=" ORDER BY 2";
		else orderQuery ="";
		
		list=pDao.getOrderedProductList(con,tableName ,columnName,columnValue,orderQuery);
		
		if(list!=null)commit(con);
		else rollback(con);
		
		return list;
		
	}

	public ArrayList<ProductSimple> getProductList(String event, String category) {
		
		ArrayList<ProductSimple> list =null;
		con = getConnection();
		
		String columnName="";
		String columnValue="";
		String tableName= "";
		if(!event.equals("none")){
			columnName=  "PRODUCT_EVENT";
			columnValue = event;
			tableName = "PRODUCT_SIMPLE_EVENT";
		}
		
		if(!category.equals("none")){
			columnName=  "CATEGORY_NAME";
			columnValue = category;
			tableName= "PRODUCT_SIMPLE";
		}
		
		list=pDao.getProductList(con,tableName ,columnName,columnValue);
		
		if(list!=null)commit(con);
		else rollback(con);
		
		return list;
	}
	
	

	public ArrayList<ProductSimple> getOptionProductList() {
		con = getConnection();
		
		ArrayList<ProductSimple> list;
		
		list = new ProductDao().getOptionProductList(con);
		return list;
	}
	

	public ArrayList<ProductSimple> searchProduct(String event, String category, String keyword) {
		con = getConnection();
		
		ArrayList<ProductSimple> list;
		
		String columnName="";
		String columnValue="";
		String tableName= "";
		
		if(!event.equals("none")){
			columnName=  "PRODUCT_EVENT";
			columnValue = event;
			tableName = "PRODUCT_SIMPLE_EVENT";
		}
		
		if(!category.equals("none")){
			columnName=  "CATEGORY_NAME";
			columnValue = category;
			tableName= "PRODUCT_SIMPLE";
		}
		
		
		list = new ProductDao().searchProduct(con,tableName,columnName,columnValue,keyword);
		return list;
	}
	
	public ArrayList<ProductSimple> getTopSellingProduct(int index) {
		
		con = getConnection();
		ArrayList<ProductSimple> result =new ArrayList<ProductSimple>();
		
		
		int startRow = (index-1)*5+1;
		int endRow = index*5;
		
		if(endRow>10)
			endRow=10;
		
		result= pDao.getTopSellingProduct(con,startRow,endRow);
		
		if(result!=null)commit(con);
		else rollback(con);
		
		return result;
	}
	
	
	public ArrayList<ProductSimple> getOrderdProductList(ArrayList<ProductSimple> sessionList, String order) {
		
		
		if(order.equals("review")){
			Collections.sort(sessionList,ProductSimple.reviewComparator);
		}else if(order.equals("priceAsc")){
			Collections.sort(sessionList,ProductSimple.priceAscComparator);
		}else if(order.equals("priceDesc")){
			Collections.sort(sessionList,ProductSimple.priceDescComparator);
		}else if(order.equals("byName")){
			Collections.sort(sessionList,ProductSimple.priceNameComparator);
		}
			
		
		return sessionList;
	
	}
	
	
	
	
	// Connection close Method
		public void closeCon() {
			close(con);
		}

		


}
