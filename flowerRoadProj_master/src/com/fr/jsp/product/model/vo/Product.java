package com.fr.jsp.product.model.vo;

import java.sql.Date;

public class Product {
	
	private String productNum;
	private String productName;
	private int productPrice;
	private String productOrigin;
	private String productCategory;
	private int productCost;
	private int productQuantity;
	private Date productRegiDate;
	
	public Product() {
		super();
	}
	public Product(String productNum, String productName, int productPrice, String productOrigin,
			String productCategory, int productCost, int productQuantity, Date productRegiDate) {
		super();
		this.productNum = productNum;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productOrigin = productOrigin;
		this.productCategory = productCategory;
		this.productCost = productCost;
		this.productQuantity = productQuantity;
		this.productRegiDate = productRegiDate;
	}
	public String getProductNum() {
		return productNum;
	}
	public void setProductNum(String productNum) {
		this.productNum = productNum;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductOrigin() {
		return productOrigin;
	}
	public void setProductOrigin(String productOrigin) {
		this.productOrigin = productOrigin;
	}
	public String getProductCategory() {
		return productCategory;
	}
	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}
	public int getProductCost() {
		return productCost;
	}
	public void setProductCost(int productCost) {
		this.productCost = productCost;
	}
	public int getProductQuantity() {
		return productQuantity;
	}
	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}
	public Date getProductRegiDate() {
		return productRegiDate;
	}
	public void setProductRegiDate(Date productRegiDate) {
		this.productRegiDate = productRegiDate;
	}
	
}
