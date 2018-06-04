package com.fr.jsp.admin.model.vo;

import java.sql.Date;

public class AdminProduct {
	
	private String productNum;
	private String productName;
	private int productPrice;
	private String productOriginName;
	private String productCategoryName;
	private int productCost;
	private int productQuantity;
	private Date productRegiDate;
	private String imagePath;
	private String productEvent;
	
	public AdminProduct() {
		super();
	}

	public AdminProduct(String productNum, String productName, int productPrice, String productOriginName,
			String productCategoryName, int productCost, int productQuantity, Date productRegiDate, String imagePath,
			String productEvent) {
		super();
		this.productNum = productNum;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productOriginName = productOriginName;
		this.productCategoryName = productCategoryName;
		this.productCost = productCost;
		this.productQuantity = productQuantity;
		this.productRegiDate = productRegiDate;
		this.imagePath = imagePath;
		this.productEvent = productEvent;
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

	public String getProductOriginName() {
		return productOriginName;
	}

	public void setProductOriginName(String productOriginName) {
		this.productOriginName = productOriginName;
	}

	public String getProductCategoryName() {
		return productCategoryName;
	}

	public void setProductCategoryName(String productCategoryName) {
		this.productCategoryName = productCategoryName;
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

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getProductEvent() {
		return productEvent;
	}

	public void setProductEvent(String productEvent) {
		this.productEvent = productEvent;
	}
	
	
}
