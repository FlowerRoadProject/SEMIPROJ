package com.fr.jsp.product.model.vo;


public class ProductFavorite implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6506686914441501686L;
	private String productNum;
	private String productName;
	private int productPrice;
	private int productCost;
	private String productQuantityState;
	private String image;
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
	public int getProductCost() {
		return productCost;
	}
	public void setProductCost(int productCost) {
		this.productCost = productCost;
	}
	
	public String getProductQuantityState() {
		return productQuantityState;
	}
	public void setProductQuantityState(String productQuantityState) {
		this.productQuantityState = productQuantityState;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	
	
}
