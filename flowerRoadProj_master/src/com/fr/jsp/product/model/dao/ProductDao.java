package com.fr.jsp.product.model.dao;

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

import com.fr.jsp.common.PageInfo;
import com.fr.jsp.order.model.vo.Order;
import com.fr.jsp.product.model.vo.ProductDetail;
import com.fr.jsp.product.model.vo.ProductSimple;

public class ProductDao {

	private Properties prop = null;

	public ProductDao() {

		prop = new Properties();

		String fileName = ProductDao.class.getResource("/config/product/product-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			System.out.println("product-query.properties 파일을 찾을 수 없습니다.");
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	
	//모든 상품 리스트 출력(사용 안함)
	public ArrayList<ProductDetail> getProductList(Connection con) {

		ArrayList<ProductDetail> list = new ArrayList<ProductDetail>();
		Statement stmt = null;
		PreparedStatement pstmt = null;

		ResultSet rset = null;

		ProductDetail p = null;
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(prop.getProperty("selectProductList"));

			while (rset.next()) {
				p = new ProductDetail();

				p.setProductNum(rset.getString(1));
				p.setProductName(rset.getString(2));
				p.setProductPrice(rset.getInt(3));
				p.setProductOriginName(rset.getString(4));
				p.setProductCategoryName(rset.getString(5));
				p.setProductCost(rset.getInt(6));
				p.setProductQuantity(rset.getInt(7));

				list.add(p);
			}

			rset = null;

			pstmt = con.prepareStatement(prop.getProperty("getProductImages"));

			for (int i = 0; i < list.size(); ++i) {
				pstmt.setString(1, list.get(i).getProductNum());

				rset = pstmt.executeQuery();

				while (rset.next()) {
					list.get(i).getImages().add(rset.getString(2));
				}

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
			close(pstmt);
		}

		return list;
	}

	//모든 상품 갯수 출력(사용 안함)
	public int getProductCount(Connection con) {
		int result = 0;

		Statement stmt = null;
		ResultSet rset = null;

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(prop.getProperty("getListCount"));

			while (rset.next()) {

				result = rset.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);

		}

		return result;
	}

	
	//모든 상품 가져오기 페이지나누기 적용(사용 안함)
	public ArrayList<ProductSimple> getProductList(Connection con, PageInfo pi) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ProductSimple> result = new ArrayList<ProductSimple>();
		ProductSimple p = null;

		try {
			pstmt = con.prepareStatement(prop.getProperty("getpagedProductSimpleList"));

			pstmt.setInt(1, pi.getStartRow());
			pstmt.setInt(2, pi.getEndRow());

			rset = pstmt.executeQuery();

			while (rset.next()) {

				p = new ProductSimple();

				p.setProductNum(rset.getString(2));
				p.setProductName(rset.getString(3));
				p.setProductPrice(rset.getInt(4));
				p.setReviewCount(rset.getInt(5));
				p.setImage(rset.getString(6));
				p.setProductTypeName(rset.getString(7));

				result.add(p);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);

		}

		return result;
	}

	//상품 하나에 대한 정보를 가져오기
	public ProductDetail getOneProduct(Connection con, String productNum) {
		
		ProductDetail p = null;
		PreparedStatement pstmt = null;

		ResultSet rset = null;

		
		try {
			pstmt = con.prepareStatement(prop.getProperty("getOneProduct"));
			pstmt.setString(1, productNum);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				p = new ProductDetail();
				p.setProductNum(rset.getString(1));
				p.setProductName(rset.getString(2));
				p.setProductPrice(rset.getInt(3));
				p.setProductOriginName(rset.getString(4));
				p.setProductCategoryName(rset.getString(5));
				p.setProductCost(rset.getInt(6));
				p.setProductQuantity(rset.getInt(7));
			}

			
			rset = null;

			pstmt = con.prepareStatement(prop.getProperty("getProductImages"));

			
				pstmt.setString(1, productNum);

				rset = pstmt.executeQuery();

				while (rset.next()) {
					p.getImages().add(rset.getString(2));
					p.getImageDesc().add(rset.getString(4));
				}

			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return p;
	}

	

	public ArrayList<ProductSimple> getOptionProductList(Connection con) {
	
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ProductSimple> result = new ArrayList<ProductSimple>();
		ProductSimple p = null;
		
		
		try {
			pstmt = con.prepareStatement(prop.getProperty("getOptionProductList"));
			
			pstmt.setString(1, "디저트");
			pstmt.setString(2, "메시지태그");
			pstmt.setString(3, "카드");
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				
				p = new ProductSimple();
				p.setProductNum(rset.getString(1));
				p.setProductName(rset.getString(2));
				p.setProductPrice(rset.getInt(3));
				p.setReviewCount(rset.getInt(4));
				p.setImage(rset.getString(5));
				p.setProductTypeName(rset.getString(6));
				p.setReviewAvg(rset.getInt(7));
				result.add(p);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return result;
	}


	
	
	
	
	public ArrayList<ProductSimple> getOrderedProductList(Connection con, String tableName, String columnName,
			String columnValue, String order) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ProductSimple> result = new ArrayList<ProductSimple>();
		ProductSimple p = null;

		
		try {
			
			String query = prop.getProperty("getOrderdProductList");
			query = query.replace("1", tableName);
			query = query.replace("2", columnName);
			query = query.replace("3", order);
			
			
			pstmt = con.prepareStatement(query);
			
			
			pstmt.setString(1, columnValue);
			
			
			rset = pstmt.executeQuery();

			while (rset.next()) {

				p = new ProductSimple();

				p.setProductNum(rset.getString(2));
				p.setProductName(rset.getString(3));
				p.setProductPrice(rset.getInt(4));
				p.setReviewCount(rset.getInt(5));
				p.setImage(rset.getString(6));
				p.setProductTypeName(rset.getString(7));
				p.setReviewAvg(rset.getInt(8));
				result.add(p);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);

		}

		
		return result;
	}
	
	
	public ArrayList<ProductSimple> getProductList(Connection con, String tableName, String columnName, String columnValue) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ProductSimple> result = new ArrayList<ProductSimple>();
		ProductSimple p = null;
		String query =null;
		
		try {
			if(columnValue.equals("선물")){
				query = prop.getProperty("getPresentCategoryProduct");
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, "카드");
				pstmt.setString(2, "메시지태그");
			}else{
				query = prop.getProperty("getProductList");
				query = query.replace("1", tableName);
				query = query.replace("2", columnName);
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, columnValue);
			}
		
			
			rset = pstmt.executeQuery();

			while (rset.next()) {

				p = new ProductSimple();

				p.setProductNum(rset.getString(2));
				p.setProductName(rset.getString(3));
				p.setProductPrice(rset.getInt(4));
				p.setReviewCount(rset.getInt(5));
				p.setImage(rset.getString(6));
				p.setProductTypeName(rset.getString(7));
				p.setReviewAvg(rset.getInt(8));

				result.add(p);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);

		}

		
		return result;
	}
	
	public int getProductCount(Connection con, String tableName, String columnName, String columnValue) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result =0;
		
		try {
			
			String query = prop.getProperty("getProductCount");
			query = query.replace("1", tableName);
			query = query.replace("2", columnName);
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, columnValue);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				result = rset.getInt(1);
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	
	public ArrayList<ProductSimple> searchProduct(Connection con, String tableName, String columnName, String columnValue, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ProductSimple> result = new ArrayList<ProductSimple>();
		ProductSimple p = null;

		
		try {
			
			String query = prop.getProperty("searchProductList");
			query = query.replace("1", tableName);
			query = query.replace("2", columnName);
			
		
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, columnValue);
			pstmt.setString(2,keyword);
			
			rset = pstmt.executeQuery();

			while (rset.next()) {

				p = new ProductSimple();

				p.setProductNum(rset.getString(2));
				p.setProductName(rset.getString(3));
				p.setProductPrice(rset.getInt(4));
				p.setReviewCount(rset.getInt(5));
				p.setImage(rset.getString(6));
				p.setProductTypeName(rset.getString(7));
				p.setReviewAvg(rset.getInt(8));

				result.add(p);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);

		}

		
		return result;
	}


	public ArrayList<ProductSimple> getTopSellingProduct(Connection con, int startRow, int endRow) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ProductSimple> result = new ArrayList<ProductSimple>();
		ProductSimple p = null;

		
		try {
			
			String query = prop.getProperty("getTopSelingProduct");
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, "카드");
			pstmt.setString(2, "디저트");
			pstmt.setString(3, "메시지태그");
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);
			
			rset = pstmt.executeQuery();

			while (rset.next()) {

				p = new ProductSimple();

				p.setProductNum(rset.getString(2));
				p.setProductName(rset.getString(3));
				p.setProductPrice(rset.getInt(4));
				p.setReviewCount(rset.getInt(5));
				p.setImage(rset.getString(6));
				p.setProductTypeName(rset.getString(7));
				p.setReviewAvg(rset.getInt(8));

				result.add(p);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);

		}

		
		return result;
		
		
	}

	


}
