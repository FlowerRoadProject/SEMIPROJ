package com.fr.jsp.board.model.vo;

import java.sql.Date;

public class ReviewBoard extends Board implements java.io.Serializable{

	/**
	 * Board class 상속
	 * 	private String bNum;
		private String bTitle;
		private String bContent;
		private Date submitDate;
	 * 
	 * 
	 */
	private static final long serialVersionUID = 5486603834483643689L;
	
	private String memberNum;
	private String productNum;
	private int rating;
	public String getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(String memberNum) {
		this.memberNum = memberNum;
	}
	public String getProductNum() {
		return productNum;
	}
	public void setProductNum(String productNum) {
		this.productNum = productNum;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	
	public ReviewBoard(int bNum, String bTitle, String bContent, Date submitDate, String memberNum,
			String productNum, int rating) {
		super(bNum, bTitle, bContent, submitDate);
		this.memberNum = memberNum;
		this.productNum = productNum;
		this.rating = rating;
	}
	
	public ReviewBoard() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "ReviewBoard [memberNum=" + memberNum + ", productNum=" + productNum + ", rating=" + rating + "]";
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((memberNum == null) ? 0 : memberNum.hashCode());
		result = prime * result + ((productNum == null) ? 0 : productNum.hashCode());
		result = prime * result + rating;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (getClass() != obj.getClass())
			return false;
		ReviewBoard other = (ReviewBoard) obj;
		if (memberNum == null) {
			if (other.memberNum != null)
				return false;
		} else if (!memberNum.equals(other.memberNum))
			return false;
		if (productNum == null) {
			if (other.productNum != null)
				return false;
		} else if (!productNum.equals(other.productNum))
			return false;
		if (rating != other.rating)
			return false;
		return true;
	}
	
	
	
	
	
	
	
}
