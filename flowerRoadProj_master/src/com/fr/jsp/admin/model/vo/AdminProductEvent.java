package com.fr.jsp.admin.model.vo;

public class AdminProductEvent {
	
	private String productNum;
	private String productEvent;
	
	public AdminProductEvent() {
		super();
	}

	public AdminProductEvent(String productNum, String productEvent) {
		super();
		this.productNum = productNum;
		this.productEvent = productEvent;
	}

	public String getProductNum() {
		return productNum;
	}

	public void setProductNum(String productNum) {
		this.productNum = productNum;
	}

	public String getProductEvent() {
		return productEvent;
	}

	public void setProductEvent(String productEvent) {
		this.productEvent = productEvent;
	}

	
}
