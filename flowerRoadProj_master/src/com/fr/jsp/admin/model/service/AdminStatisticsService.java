package com.fr.jsp.admin.model.service;

import static com.fr.jdbc.common.JDBCTemplate.close;
import static com.fr.jdbc.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.fr.jsp.admin.model.dao.AdminStatisticsDao;
import com.fr.jsp.admin.model.vo.AdminStatisticsMember;
import com.fr.jsp.admin.model.vo.AdminStatisticsProduct;

public class AdminStatisticsService {
	private Connection con;
	private AdminStatisticsDao asDao;
	
	public AdminStatisticsService() {
		super();
		con = getConnection();
		asDao = new AdminStatisticsDao();
	}
	// Connection close Method
	public void closeCon(){
		close(con);
	}
	// 최고 구입 회원
	public AdminStatisticsMember admin_selectStatisticsPurchase(int i) {
		AdminStatisticsMember purchaseMember = new AdminStatisticsMember();
		purchaseMember = asDao.admin_selectStatisticsPurchase(con,i);
		return purchaseMember;
	}
	// 최다 구매 회원
	public AdminStatisticsMember admin_selectStatisticsBuy(int i) {
		AdminStatisticsMember buyMember = new AdminStatisticsMember();
		buyMember = asDao.admin_selectStatisticsBuy(con,i);
		return buyMember;
	}
	// 최다 방문 회원
	public AdminStatisticsMember admin_selectStatisticsVisit(int i) {
		AdminStatisticsMember visitMember = new AdminStatisticsMember();
		visitMember = asDao.admin_selectStatisticsVisit(con,i);
		return visitMember;
	}
	// 최다 댓글 회원
	public AdminStatisticsMember admin_selectStatisticsReview(int i) {
		AdminStatisticsMember reviewMember = new AdminStatisticsMember();
		reviewMember = asDao.admin_selectStatisticsReview(con,i);
		return reviewMember;
	}
	// 최고 매출 상품
	public AdminStatisticsProduct admin_selectStatisticsSell(int i) {
		AdminStatisticsProduct sellProduct = new AdminStatisticsProduct();
		sellProduct = asDao.admin_selectStatisticsSell(con,i);
		return sellProduct;
	}
	// 최다 조회 상품
	public AdminStatisticsProduct admin_selectStatisticsClick(int i) {
		AdminStatisticsProduct clickProduct = new AdminStatisticsProduct();
		clickProduct = asDao.admin_selectStatisticsClick(con,i);
		return clickProduct;
	}
	// 최다 판매 상품
	public AdminStatisticsProduct admin_selectStatisticsMerchandise(int i) {
		AdminStatisticsProduct merchandiseProduct = new AdminStatisticsProduct();
		merchandiseProduct = asDao.admin_selectStatisticsMerchandise(con,i);
		return merchandiseProduct;
	}
	// 최고 별점 상품
	public AdminStatisticsProduct admin_selectStatisticsStar(int i) {
		AdminStatisticsProduct starProduct = new AdminStatisticsProduct();
		starProduct = asDao.admin_selectStatisticsStar(con,i);
		return starProduct;
	}
	
}
