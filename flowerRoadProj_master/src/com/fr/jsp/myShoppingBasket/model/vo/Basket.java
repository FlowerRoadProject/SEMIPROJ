package com.fr.jsp.myShoppingBasket.model.vo;

import java.io.Serializable;

public class Basket implements Serializable{
	
	private static final long serialVersionUID = 10L;

	private String member_num;
	private String product_num;
	private int quantity;
	private int product_price;
	private String product_name;
	private String image;
	private String category;
	
	public Basket(){
		
	}
	
	
	
	public Basket(String product_num, int quantity, int product_price, String product_name,
			String image, String category) {
		super();		
		this.product_num = product_num;
		this.quantity = quantity;
		this.product_price = product_price;
		this.product_name = product_name;
		this.image = image;
		this.category = category;
	}



	public Basket(String product_num, int quantity, int product_price, String product_name, String image) {
		super();		
		this.product_num = product_num;
		this.quantity = quantity;
		this.product_price = product_price;
		this.product_name = product_name;
		this.image = image;
	}
	
	
	public Basket(String member_num, String product_num, int quantity, int product_price, String product_name, String image) {
		super();
		this.member_num = member_num;
		this.product_num = product_num;
		this.quantity = quantity;
		this.product_price = product_price;
		this.product_name = product_name;
		this.image = image;
	}
	
	
	public Basket(String member_num, String product_num, int quantity){		
		super();
		this.member_num = member_num;
		this.product_num = product_num;
		this.quantity = quantity;
	}
	

	public Basket(String product_num, int product_price, String product_name, String image) {
		super();
		this.product_num = product_num;
		this.product_price = product_price;
		this.product_name = product_name;
		this.image = image;
	}

	public Basket(String product_num, int quantity){
		super();
		this.product_num = product_num;
		this.quantity = quantity;
	}
	
	
	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}



	public String getMember_num() {
		return member_num;
	}

	public void setMember_num(String member_num) {
		this.member_num = member_num;
	}

	public String getProduct_num() {
		return product_num;
	}

	public void setProduct_num(String product_num) {
		this.product_num = product_num;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "Basket [member_num=" + member_num + ", product_num=" + product_num + ", quantity=" + quantity
				+ ", product_price=" + product_price + ", product_name=" + product_name + ", image=" + image + "]";
	}
	
	
	
	
}
