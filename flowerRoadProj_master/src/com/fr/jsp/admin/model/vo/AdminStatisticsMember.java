package com.fr.jsp.admin.model.vo;

public class AdminStatisticsMember {
	
	private String memberNum;
	private String memberName;
	private String memberGrade;
	private String memberImage;
	private int memberPurchaseAmount;
	private double rateByTotalPurchaseAmount;
	private int memberPurchaseTime;
	private double rateBytotalPurchaseTime;
	private int memberVisitTime;
	private double rateBytotalVisitTime;
	private int memberReviewWriteTime;
	private double rateBytotalReviewWriteTime;
	
	public AdminStatisticsMember() {
		super();
	}

	public AdminStatisticsMember(String memberNum, String memberName, String memberGrade, String memberImage,
			int memberPurchaseAmount, double rateByTotalPurchaseAmount, int memberPurchaseTime,
			double rateBytotalPurchaseTime, int memberVisitTime, double rateBytotalVisitTime, int memberReviewWriteTime,
			double rateBytotalReviewWriteTime) {
		super();
		this.memberNum = memberNum;
		this.memberName = memberName;
		this.memberGrade = memberGrade;
		this.memberImage = memberImage;
		this.memberPurchaseAmount = memberPurchaseAmount;
		this.rateByTotalPurchaseAmount = rateByTotalPurchaseAmount;
		this.memberPurchaseTime = memberPurchaseTime;
		this.rateBytotalPurchaseTime = rateBytotalPurchaseTime;
		this.memberVisitTime = memberVisitTime;
		this.rateBytotalVisitTime = rateBytotalVisitTime;
		this.memberReviewWriteTime = memberReviewWriteTime;
		this.rateBytotalReviewWriteTime = rateBytotalReviewWriteTime;
	}

	public String getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(String memberNum) {
		this.memberNum = memberNum;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberGrade() {
		return memberGrade;
	}

	public void setMemberGrade(String memberGrade) {
		this.memberGrade = memberGrade;
	}

	public String getMemberImage() {
		return memberImage;
	}

	public void setMemberImage(String memberImage) {
		this.memberImage = memberImage;
	}

	public int getMemberPurchaseAmount() {
		return memberPurchaseAmount;
	}

	public void setMemberPurchaseAmount(int memberPurchaseAmount) {
		this.memberPurchaseAmount = memberPurchaseAmount;
	}

	public double getRateByTotalPurchaseAmount() {
		return rateByTotalPurchaseAmount;
	}

	public void setRateByTotalPurchaseAmount(double rateByTotalPurchaseAmount) {
		this.rateByTotalPurchaseAmount = rateByTotalPurchaseAmount;
	}

	public int getMemberPurchaseTime() {
		return memberPurchaseTime;
	}

	public void setMemberPurchaseTime(int memberPurchaseTime) {
		this.memberPurchaseTime = memberPurchaseTime;
	}

	public double getRateBytotalPurchaseTime() {
		return rateBytotalPurchaseTime;
	}

	public void setRateBytotalPurchaseTime(double rateBytotalPurchaseTime) {
		this.rateBytotalPurchaseTime = rateBytotalPurchaseTime;
	}

	public int getMemberVisitTime() {
		return memberVisitTime;
	}

	public void setMemberVisitTime(int memberVisitTime) {
		this.memberVisitTime = memberVisitTime;
	}

	public double getRateBytotalVisitTime() {
		return rateBytotalVisitTime;
	}

	public void setRateBytotalVisitTime(double rateBytotalVisitTime) {
		this.rateBytotalVisitTime = rateBytotalVisitTime;
	}

	public int getMemberReviewWriteTime() {
		return memberReviewWriteTime;
	}

	public void setMemberReviewWriteTime(int memberReviewWriteTime) {
		this.memberReviewWriteTime = memberReviewWriteTime;
	}

	public double getRateBytotalReviewWriteTime() {
		return rateBytotalReviewWriteTime;
	}

	public void setRateBytotalReviewWriteTime(double rateBytotalReviewWriteTime) {
		this.rateBytotalReviewWriteTime = rateBytotalReviewWriteTime;
	}

}
