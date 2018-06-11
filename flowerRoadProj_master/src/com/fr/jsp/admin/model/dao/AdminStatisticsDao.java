package com.fr.jsp.admin.model.dao;

import static com.fr.jdbc.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import com.fr.jsp.admin.model.vo.AdminStatisticsMember;
import com.fr.jsp.admin.model.vo.AdminStatisticsProduct;

public class AdminStatisticsDao {
	private Properties prop;
	
	public AdminStatisticsDao() {
		super();
		prop = new Properties();
		String fileName = AdminStatisticsDao.class.getResource("/config/admin/statistics_query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	// 최고 구입 회원
	public AdminStatisticsMember admin_selectStatisticsPurchase(Connection con, int i) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		AdminStatisticsMember purchaseMember = new AdminStatisticsMember();
		
		try { 
			String query = prop.getProperty("admin_selectStatisticsPurchase");
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, i);
			rset = pstmt.executeQuery();
			while(rset.next()){
				purchaseMember.setMemberNum(rset.getString("MEMBER_NUM"));
				purchaseMember.setMemberName(rset.getString("MEMBER_NAME"));
				purchaseMember.setMemberGrade(rset.getString("GRADE_NAME"));
				purchaseMember.setMemberImage(rset.getString("IMAGE_PATH"));
				purchaseMember.setMemberPurchaseAmount(Integer.parseInt(rset.getString("PURCHASE_AMOUNT")));
				purchaseMember.setRateByTotalPurchaseAmount(Double.parseDouble(rset.getString("RATE_BY_TOTAL")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return purchaseMember;
	}
	// 최다 구매 회원
	public AdminStatisticsMember admin_selectStatisticsBuy(Connection con, int i) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		AdminStatisticsMember buyMember = new AdminStatisticsMember();
		
		try { 
			String query = prop.getProperty("admin_selectStatisticsBuy");
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, i);
			rset = pstmt.executeQuery();
			while(rset.next()){
				buyMember.setMemberNum(rset.getString("MEMBER_NUM"));
				buyMember.setMemberName(rset.getString("MEMBER_NAME"));
				buyMember.setMemberGrade(rset.getString("GRADE_NAME"));
				buyMember.setMemberImage(rset.getString("IMAGE_PATH"));
				buyMember.setMemberPurchaseTime(Integer.parseInt(rset.getString("PURCHASE_TIME")));
				buyMember.setRateBytotalPurchaseTime(Double.parseDouble(rset.getString("RATE_BY_TOTAL")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return buyMember;
	}
	// 최다 방문 회원
	public AdminStatisticsMember admin_selectStatisticsVisit(Connection con, int i) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		AdminStatisticsMember visitMember = new AdminStatisticsMember();
		
		try { 
			String query = prop.getProperty("admin_selectStatisticsVisit");
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, i);
			rset = pstmt.executeQuery();
			while(rset.next()){
				visitMember.setMemberNum(rset.getString("MEMBER_NUM"));
				visitMember.setMemberName(rset.getString("MEMBER_NAME"));
				visitMember.setMemberGrade(rset.getString("GRADE_NAME"));
				visitMember.setMemberImage(rset.getString("IMAGE_PATH"));
				visitMember.setMemberVisitTime(Integer.parseInt(rset.getString("VISIT_TIME")));
				visitMember.setRateBytotalVisitTime(Double.parseDouble(rset.getString("RATE_BY_TOTAL")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return visitMember;
	}
	// 최다 댓글 회원
	public AdminStatisticsMember admin_selectStatisticsReview(Connection con, int i) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		AdminStatisticsMember reviewMember = new AdminStatisticsMember();
		
		try { 
			String query = prop.getProperty("admin_selectStatisticsReview");
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, i);
			rset = pstmt.executeQuery();
			while(rset.next()){
				reviewMember.setMemberNum(rset.getString("MEMBER_NUM"));
				reviewMember.setMemberName(rset.getString("MEMBER_NAME"));
				reviewMember.setMemberGrade(rset.getString("GRADE_NAME"));
				reviewMember.setMemberImage(rset.getString("IMAGE_PATH"));
				reviewMember.setMemberReviewWriteTime(Integer.parseInt(rset.getString("REVIEW_TIME")));
				reviewMember.setRateBytotalReviewWriteTime(Double.parseDouble(rset.getString("RATE_BY_TOTAL")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return reviewMember;
	}
	// 최고 매출 상품
	public AdminStatisticsProduct admin_selectStatisticsSell(Connection con, int i) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		AdminStatisticsProduct sellProduct = new AdminStatisticsProduct();
		
		try { 
			String query = prop.getProperty("admin_selectStatisticsSell");
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, i);
			rset = pstmt.executeQuery();
			while(rset.next()){
				sellProduct.setProductNum(rset.getString("PRODUCT_NUM"));
				sellProduct.setProductName(rset.getString("PRODUCT_NAME"));
				sellProduct.setProductImage(rset.getString("IMAGE_PATH"));
				sellProduct.setProductSellAmount(Integer.parseInt(rset.getString("TOTAL_SELL")));
				sellProduct.setRateBytotalSellAmount(Double.parseDouble(rset.getString("RATE_BY_TOTAL")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return sellProduct;
	}
	// 최다 조회 상품
	public AdminStatisticsProduct admin_selectStatisticsClick(Connection con, int i) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		AdminStatisticsProduct clickProduct = new AdminStatisticsProduct();
		
		try { 
			String query = prop.getProperty("admin_selectStatisticsClick");
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, i);
			rset = pstmt.executeQuery();
			while(rset.next()){
				clickProduct.setProductNum(rset.getString("PRODUCT_NUM"));
				clickProduct.setProductName(rset.getString("PRODUCT_NAME"));
				clickProduct.setProductImage(rset.getString("IMAGE_PATH"));
				clickProduct.setProductClickCount(Integer.parseInt(rset.getString("P_CHECK")));
				clickProduct.setProductFavoriteCount(Integer.parseInt(rset.getString("P_FAVORITE")));
				clickProduct.setRateBytotalClickCount(Double.parseDouble(rset.getString("RATE_BY_TOTAL")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return clickProduct;
	}
	// 최다 판매 상품
	public AdminStatisticsProduct admin_selectStatisticsMerchandise(Connection con, int i) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		AdminStatisticsProduct merchandiseProduct = new AdminStatisticsProduct();
		
		try { 
			String query = prop.getProperty("admin_selectStatisticsMerchandise");
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, i);
			rset = pstmt.executeQuery();
			while(rset.next()){
				merchandiseProduct.setProductNum(rset.getString("PRODUCT_NUM"));
				merchandiseProduct.setProductName(rset.getString("PRODUCT_NAME"));
				merchandiseProduct.setProductImage(rset.getString("IMAGE_PATH"));
				merchandiseProduct.setProductMerchandiseCount(Integer.parseInt(rset.getString("PO_COUNT")));
				merchandiseProduct.setRateByTotalMerchandiseCount(Double.parseDouble(rset.getString("RATE_BY_TOTAL")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return merchandiseProduct;
	}
	// 최고 별점 상품
	public AdminStatisticsProduct admin_selectStatisticsStar(Connection con, int i) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		AdminStatisticsProduct starProduct = new AdminStatisticsProduct();
		
		try { 
			String query = prop.getProperty("admin_selectStatisticsStar");
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, i);
			rset = pstmt.executeQuery();
			while(rset.next()){
				starProduct.setProductNum(rset.getString("PRODUCT_NUM"));
				starProduct.setProductName(rset.getString("PRODUCT_NAME"));
				starProduct.setProductImage(rset.getString("IMAGE_PATH"));
				starProduct.setProductStarAverage(Double.parseDouble(rset.getString("P_STAR_AVG")));
				starProduct.setProductReviewCount(Integer.parseInt(rset.getString("P_REVIEW")));
				starProduct.setRateBytotalReviewCount(Double.parseDouble(rset.getString("RATE_BY_TOTAL")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return starProduct;
	}
	
}
