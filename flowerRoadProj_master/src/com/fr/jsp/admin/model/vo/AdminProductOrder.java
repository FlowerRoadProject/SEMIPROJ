package com.fr.jsp.admin.model.vo;

import java.sql.Date;

public class AdminProductOrder {
	
	private String productOrderNum;
	private String productNum;
	private Date productOrderDate;
	private int productOrderQuantity;
	private String productOrderCompany;
	
	public AdminProductOrder() {
		super();
	}

	public AdminProductOrder(String productOrderNum, String productNum, Date productOrderDate, int productOrderQuantity,
			String productOrderCompany) {
		super();
		this.productOrderNum = productOrderNum;
		this.productNum = productNum;
		this.productOrderDate = productOrderDate;
		this.productOrderQuantity = productOrderQuantity;
		this.productOrderCompany = productOrderCompany;
	}

	public String getProductOrderNum() {
		return productOrderNum;
	}

	public void setProductOrderNum(String productOrderNum) {
		this.productOrderNum = productOrderNum;
	}

	public String getProductNum() {
		return productNum;
	}

	public void setProductNum(String productNum) {
		this.productNum = productNum;
	}

	public Date getProductOrderDate() {
		return productOrderDate;
	}

	public void setProductOrderDate(Date productOrderDate) {
		this.productOrderDate = productOrderDate;
	}

	public int getProductOrderQuantity() {
		return productOrderQuantity;
	}

	public void setProductOrderQuantity(int productOrderQuantity) {
		this.productOrderQuantity = productOrderQuantity;
	}

	public String getProductOrderCompany() {
		return productOrderCompany;
	}

	public void setProductOrderCompany(String productOrderCompany) {
		this.productOrderCompany = productOrderCompany;
	}

}
