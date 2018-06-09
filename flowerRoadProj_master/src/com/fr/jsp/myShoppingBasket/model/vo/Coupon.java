package com.fr.jsp.myShoppingBasket.model.vo;

import java.io.Serializable;

public class Coupon implements Serializable{

	
	private static final long serialVersionUID = 4567854153L;
	
	private String couponCode;
	private String couponName;
	private int amount;
	private int expiration;
	private String distNum;
	
	public Coupon(){
		super();
	}
	
	public Coupon(String couponCode, String couponName, int amount, int expiration, String distNum) {
		super();
		this.couponCode= couponCode;
		this.couponName = couponName;
		this.amount = amount;
		this.expiration = expiration;
		this.distNum = distNum;
	}

	
	
	public String getDistNum() {
		return distNum;
	}

	public void setDistNum(String distNum) {
		this.distNum = distNum;
	}

	public String getCouponCode() {
		return couponCode;
	}

	public void setCouponCode(String couponCode) {
		this.couponCode = couponCode;
	}

	public String getCouponName() {
		return couponName;
	}

	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getExpiration() {
		return expiration;
	}

	public void setExpiration(int expiration) {
		this.expiration = expiration;
	}
	
	
	
}
