package com.fr.jsp.member.model.vo;

import java.util.Date;

public class MemberCoupon {
	
	private int distNum;
	private String couponCode;
	private String memberNum;
	private Date issueDate;
	private String isUsed;
	public int getDistNum() {
		return distNum;
	}
	public void setDistNum(int distNum) {
		this.distNum = distNum;
	}
	public String getCouponCode() {
		return couponCode;
	}
	public void setCouponCode(String couponCode) {
		this.couponCode = couponCode;
	}
	public String getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(String memberNum) {
		this.memberNum = memberNum;
	}
	public Date getIssueDate() {
		return issueDate;
	}
	public void setIssueDate(Date issueDate) {
		this.issueDate = issueDate;
	}
	public String getIsUsed() {
		return isUsed;
	}
	public void setIsUsed(String isUsed) {
		this.isUsed = isUsed;
	}
	
	
}
