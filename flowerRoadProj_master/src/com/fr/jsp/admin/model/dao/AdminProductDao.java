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

import com.fr.jsp.admin.model.dao.AdminMemberDao;
import com.fr.jsp.admin.model.vo.AdminProduct;
import com.fr.jsp.admin.model.vo.AdminProductEvent;
import com.fr.jsp.admin.model.vo.AdminProductImage;
import com.fr.jsp.admin.model.vo.AdminProductOrder;
import com.fr.jsp.product.model.vo.Product;

public class AdminProductDao {
	private Properties prop;
	
	public AdminProductDao() {
		super();
		prop = new Properties();
		String fileName = AdminMemberDao.class.getResource("/config/admin/product_query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	// 등록된 모든 상품 리스트
	public ArrayList<AdminProduct> admin_allProductList(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AdminProduct> admin_allProductList = null;
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		try { 
			String query = prop.getProperty("admin_allProductList");
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			admin_allProductList = new ArrayList<AdminProduct>();
			while(rset.next()){
				AdminProduct product = new AdminProduct();
				
				product.setProductNum(rset.getString("PRODUCT_NUM"));
				product.setProductName(rset.getString("PRODUCT_NAME"));
				product.setProductPrice(Integer.parseInt(rset.getString("PRODUCT_PRICE")));
				product.setProductOriginName(rset.getString("ORIGIN_NAME"));
				product.setProductCategoryName(rset.getString("CATEGORY_NAME"));
				product.setProductCost(Integer.parseInt(rset.getString("PRODUCT_COST")));
				product.setProductQuantity(Integer.parseInt(rset.getString("PRODUCT_QUANTITY")));
		        Date u_date = format.parse(rset.getString("PRODUCT_REGI_DATE"));
		        java.sql.Date s_date = new java.sql.Date(u_date.getTime());
		        product.setProductRegiDate(s_date);
		        product.setImagePath(rset.getString("IMAGE_PATH"));
		        product.setProductEvent(rset.getString("PRODUCT_EVENT"));
				
		        admin_allProductList.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return admin_allProductList;
	}
	// 오늘 등록한 상품 리스트
	public ArrayList<AdminProduct> admin_todayRegiProductList(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AdminProduct> admin_todayRegiProductList = null;
		
		try { 
			String query = prop.getProperty("admin_todayRegiProductList");
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			admin_todayRegiProductList = new ArrayList<AdminProduct>();
			while(rset.next()){
				AdminProduct product = new AdminProduct();
				
				product.setProductNum(rset.getString("PRODUCT_NUM"));
				product.setProductName(rset.getString("PRODUCT_NAME"));
				product.setProductPrice(Integer.parseInt(rset.getString("PRODUCT_PRICE")));
				product.setProductOriginName(rset.getString("ORIGIN_NAME"));
				product.setProductCategoryName(rset.getString("CATEGORY_NAME"));
				product.setProductCost(Integer.parseInt(rset.getString("PRODUCT_COST")));
				product.setProductQuantity(Integer.parseInt(rset.getString("PRODUCT_QUANTITY")));
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		        Date u_date = format.parse(rset.getString("PRODUCT_REGI_DATE"));
		        java.sql.Date s_date = new java.sql.Date(u_date.getTime());
		        product.setProductRegiDate(s_date);
		        product.setImagePath(rset.getString("IMAGE_PATH"));
		        product.setProductEvent("PRODUCT_EVENT");
				
		        admin_todayRegiProductList.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return admin_todayRegiProductList;
	}
	// 재고부족 상품 리스트
	public ArrayList<AdminProduct> admin_stockLackProductList(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AdminProduct> admin_stockLackProductList = null;
		
		try { 
			String query = prop.getProperty("admin_stockLackProductList");
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			admin_stockLackProductList = new ArrayList<AdminProduct>();
			while(rset.next()){
				AdminProduct product = new AdminProduct();
				
				product.setProductNum(rset.getString("PRODUCT_NUM"));
				product.setProductName(rset.getString("PRODUCT_NAME"));
				product.setProductPrice(Integer.parseInt(rset.getString("PRODUCT_PRICE")));
				product.setProductOriginName(rset.getString("ORIGIN_NAME"));
				product.setProductCategoryName(rset.getString("CATEGORY_NAME"));
				product.setProductCost(Integer.parseInt(rset.getString("PRODUCT_COST")));
				product.setProductQuantity(Integer.parseInt(rset.getString("PRODUCT_QUANTITY")));
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		        Date u_date = format.parse(rset.getString("PRODUCT_REGI_DATE"));
		        java.sql.Date s_date = new java.sql.Date(u_date.getTime());
		        product.setProductRegiDate(s_date);
		        product.setImagePath(rset.getString("IMAGE_PATH"));
		        product.setProductEvent("PRODUCT_EVENT");
				
		        admin_stockLackProductList.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return admin_stockLackProductList;
	}
	// 오늘 발주한 상품 리스트
	public ArrayList<AdminProductOrder> admin_todayProductOrderList(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AdminProductOrder> admin_todayProductOrderList = null;
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		try { 
			String query = prop.getProperty("admin_todayProductOrderList");
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			admin_todayProductOrderList = new ArrayList<AdminProductOrder>();
			while(rset.next()){
				AdminProductOrder productOrder = new AdminProductOrder();
				
				productOrder.setProductOrderNum(rset.getString("PRODUCT_ORDER_NUM"));
				productOrder.setProductNum(rset.getString("PRODUCT_NUM"));
				productOrder.setProductOrderQuantity(Integer.parseInt(rset.getString("PRODUCT_ORDER_QUANTITY")));
				productOrder.setProductOrderCompany(rset.getString("PRODUCT_ORDER_COMPANY"));
		        Date u_date = format.parse(rset.getString("PRODUCT_ORDER_DATE"));
		        java.sql.Date productOrderDate = new java.sql.Date(u_date.getTime());
		        productOrder.setProductOrderDate(productOrderDate);
		        
		        admin_todayProductOrderList.add(productOrder);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return admin_todayProductOrderList;
	}
	// 상품 카테고리 리스트
	public ArrayList<String> admin_productCategoryList(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<String> admin_productCategoryList = null;
		
		try { 
			String query = prop.getProperty("admin_productCategoryList");
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			admin_productCategoryList = new ArrayList<String>();
			while(rset.next()){
				String category = rset.getString("CATEGORY_NAME");
		        admin_productCategoryList.add(category);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return admin_productCategoryList;
	}
	// 상품 원산지 리스트
	public ArrayList<String> admin_productOriginList(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<String> admin_productOriginList = null;
		
		try { 
			String query = prop.getProperty("admin_productOriginList");
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			admin_productOriginList = new ArrayList<String>();
			while(rset.next()){
				String category = rset.getString("ORIGIN_NAME");
				admin_productOriginList.add(category);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return admin_productOriginList;
	}
	// 발주 현황 리스트
	public ArrayList<AdminProductOrder> admin_productOrderList(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AdminProductOrder> admin_productOrderList = null;
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		try { 
			String query = prop.getProperty("admin_productOrderList");
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			admin_productOrderList = new ArrayList<AdminProductOrder>();
			while(rset.next()){
				AdminProductOrder productOrder = new AdminProductOrder();
				
				productOrder.setProductOrderNum(rset.getString("PRODUCT_ORDER_NUM"));
				productOrder.setProductNum(rset.getString("PRODUCT_NUM"));
				productOrder.setProductOrderQuantity(Integer.parseInt(rset.getString("PRODUCT_ORDER_QUANTITY")));
				productOrder.setProductOrderCompany(rset.getString("PRODUCT_ORDER_COMPANY"));
		        Date u_date = format.parse(rset.getString("PRODUCT_ORDER_DATE"));
		        java.sql.Date productOrderDate = new java.sql.Date(u_date.getTime());
		        productOrder.setProductOrderDate(productOrderDate);
		        
		        admin_productOrderList.add(productOrder);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return admin_productOrderList;
	}
	// 상품 한 개 조회
	public Product admin_selectProduct(String productNum, Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Product admin_selectProduct = null;
		
		try { 
			String query = prop.getProperty("admin_selectProduct");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,productNum);
			rset = pstmt.executeQuery();
			while(rset.next()){
				admin_selectProduct = new Product();
				
				admin_selectProduct.setProductNum(rset.getString("PRODUCT_NUM"));
				admin_selectProduct.setProductName(rset.getString("PRODUCT_NAME"));
				admin_selectProduct.setProductPrice(Integer.parseInt(rset.getString("PRODUCT_PRICE")));
				admin_selectProduct.setProductOrigin(rset.getString("PRODUCT_ORIGIN"));
				admin_selectProduct.setProductCategory(rset.getString("PRODUCT_CATEGORY"));
				admin_selectProduct.setProductCost(Integer.parseInt(rset.getString("PRODUCT_COST")));
				admin_selectProduct.setProductQuantity(Integer.parseInt(rset.getString("PRODUCT_QUANTITY")));
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		        Date u_date = format.parse(rset.getString("PRODUCT_REGI_DATE"));
		        java.sql.Date productRegiDate = new java.sql.Date(u_date.getTime());
		        admin_selectProduct.setProductRegiDate(productRegiDate);
		        
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return admin_selectProduct;
	}
	// 상품 카테고리 이름으로 코드 조회
	public String admin_checkProductCategory(String productCategoryName, Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String admin_productCategory = null;
		
		try { 
			String query = prop.getProperty("admin_checkProductCategory");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,productCategoryName);
			rset = pstmt.executeQuery();
			while(rset.next()){				
				admin_productCategory = (rset.getString("PRODUCT_CATEGORY"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return admin_productCategory;
	}
	// 상품 원산지 이름으로 코드 조회
	public String admin_checkProductOrigin(String productOriginName, Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String admin_productOrigin = null;
		
		try { 
			String query = prop.getProperty("admin_checkProductOrigin");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,productOriginName);
			rset = pstmt.executeQuery();
			while(rset.next()){				
				admin_productOrigin = (rset.getString("PRODUCT_ORIGIN"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return admin_productOrigin;
	}
	// 상품 수정
	public int admin_updateProduct(Connection con, Product updateProduct) {
		PreparedStatement pstmt = null;
		int rset = 0;
		
		try { 
			String query = prop.getProperty("admin_updateProduct");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,updateProduct.getProductName());
			pstmt.setInt(2,updateProduct.getProductPrice());
			pstmt.setString(3,updateProduct.getProductOrigin());
			pstmt.setString(4,updateProduct.getProductCategory());
			pstmt.setInt(5,updateProduct.getProductCost());
			pstmt.setInt(6,updateProduct.getProductQuantity());
			pstmt.setString(7,updateProduct.getProductNum());
			rset = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return rset;
	}
	// 상품 이미지 수정
	public int admin_updateProductImage(Connection con, AdminProductImage updatePImage) {
		PreparedStatement pstmt = null;
		int rset = 0;
		
		try { 
			String query = prop.getProperty("admin_updateProductImage");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,updatePImage.getImagePath());
			pstmt.setString(2,updatePImage.getProductNum());
			rset = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return rset;
	}
	// 상품 이벤트 수정
	public int admin_updateProductEvent(Connection con, AdminProductEvent updatePEvent) {
		PreparedStatement pstmt = null;
		int rset = 0;
		
		try { 
			String query = prop.getProperty("admin_updateProductEvent");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,updatePEvent.getProductEvent());
			pstmt.setString(2,updatePEvent.getProductNum());
			rset = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return rset;
	}
	// 상품 정보 등록
	public int admin_insertProduct(Connection con, Product insertProduct) {
		PreparedStatement pstmt = null;
		int rset = 0;
		
		try { 
			String query = prop.getProperty("admin_insertProduct");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,insertProduct.getProductName());
			pstmt.setInt(2,insertProduct.getProductPrice());
			pstmt.setString(3,insertProduct.getProductOrigin());
			pstmt.setString(4,insertProduct.getProductCategory());
			pstmt.setInt(5,insertProduct.getProductCost());
			pstmt.setInt(6,insertProduct.getProductQuantity());
			rset = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return rset;
	}
	// 상품 번호 조회
	public String admin_selectProductNum(Connection con, Product insertProduct) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String admin_selectProductNum = null;
		
		try { 
			String query = prop.getProperty("admin_selectProductNum");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,insertProduct.getProductName());
			pstmt.setInt(2,insertProduct.getProductPrice());
			pstmt.setString(3,insertProduct.getProductOrigin());
			pstmt.setString(4,insertProduct.getProductCategory());
			pstmt.setInt(5,insertProduct.getProductCost());
			pstmt.setInt(6,insertProduct.getProductQuantity());

			rset = pstmt.executeQuery();
			while(rset.next()){				
				admin_selectProductNum = (rset.getString("PRODUCT_NUM"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return admin_selectProductNum;
	}
	// 상품 이미지 등록
	public int admin_insertProductImage(Connection con, AdminProductImage insertPImage) {
		PreparedStatement pstmt = null;
		int rset = 0;
		
		try { 
			String query = prop.getProperty("admin_insertProductImage");
			pstmt = con.prepareStatement(query);
			pstmt.setString(2,insertPImage.getImagePath());
			pstmt.setString(1,insertPImage.getProductNum());
			rset = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return rset;
	}
	// 상품 이벤트 등록
	public int admin_insertProductEvent(Connection con, AdminProductEvent insertPEvent) {
		PreparedStatement pstmt = null;
		int rset = 0;
		
		try { 
			String query = prop.getProperty("admin_insertProductEvent");
			pstmt = con.prepareStatement(query);
			pstmt.setString(2,insertPEvent.getProductEvent());
			pstmt.setString(1,insertPEvent.getProductNum());
			rset = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return rset;
	}
	// 상품 발주 등록
	public int admin_insertProductOrder(Connection con, AdminProductOrder productOrder) {
		PreparedStatement pstmt = null;
		int rset = 0;
		
		try { 
			String query = prop.getProperty("admin_insertProductOrder");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,productOrder.getProductNum());
			pstmt.setInt(2,productOrder.getProductOrderQuantity());
			pstmt.setString(3,productOrder.getProductOrderCompany());
			rset = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return rset;
	}

}
