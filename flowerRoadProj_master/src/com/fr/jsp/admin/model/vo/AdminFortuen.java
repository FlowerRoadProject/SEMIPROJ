package com.fr.jsp.admin.model.vo;

public class AdminFortuen {
	
	private int fortuenNum;
	private String fortuenEnglish;
	private String fortuenKorean;
	
	public AdminFortuen() {
		super();
	}

	public AdminFortuen(int fortuenNum, String fortuenEnglish, String fortuenKorean) {
		super();
		this.fortuenNum = fortuenNum;
		this.fortuenEnglish = fortuenEnglish;
		this.fortuenKorean = fortuenKorean;
	}

	public int getFortuenNum() {
		return fortuenNum;
	}

	public void setFortuenNum(int fortuenNum) {
		this.fortuenNum = fortuenNum;
	}

	public String getFortuenEnglish() {
		return fortuenEnglish;
	}

	public void setFortuenEnglish(String fortuenEnglish) {
		this.fortuenEnglish = fortuenEnglish;
	}

	public String getFortuenKorean() {
		return fortuenKorean;
	}

	public void setFortuenKorean(String fortuenKorean) {
		this.fortuenKorean = fortuenKorean;
	}

}
