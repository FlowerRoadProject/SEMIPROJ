package com.fr.jsp.board.model.vo;

import java.sql.Date;

public class FaqBoard extends Board{

	/**
	 * Board class 상속
	 * 	private String bNum;
		private String bTitle;
		private String bContent;
		private Date submitDate;
	 * 
	 * 
	 */
	private static final long serialVersionUID = 8494250588599057913L;

	private String memberNum;
	private String contentCategory;
	
	public FaqBoard(int bNum, String bTitle, String bContent, Date submitDate, String memberNum,
			String contentCategory) {
		super(bNum, bTitle, bContent, submitDate);
		this.memberNum = memberNum;
		this.contentCategory = contentCategory;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((contentCategory == null) ? 0 : contentCategory.hashCode());
		result = prime * result + ((memberNum == null) ? 0 : memberNum.hashCode());
		return result;
	}

	public FaqBoard(int bNum, String bTitle, String bContent, String contentCategory){
	      super(bNum, bTitle, bContent);
	      this.contentCategory = contentCategory;
	   }
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (getClass() != obj.getClass())
			return false;
		FaqBoard other = (FaqBoard) obj;
		if (contentCategory == null) {
			if (other.contentCategory != null)
				return false;
		} else if (!contentCategory.equals(other.contentCategory))
			return false;
		if (memberNum == null) {
			if (other.memberNum != null)
				return false;
		} else if (!memberNum.equals(other.memberNum))
			return false;
		return true;
	}

	public FaqBoard() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(String memberNum) {
		this.memberNum = memberNum;
	}

	public String getContentCategory() {
		return contentCategory;
	}

	public void setContentCategory(String contentCategory) {
		this.contentCategory = contentCategory;
	}

	@Override
	public String toString() {
		return "FaqBoard [memberNum=" + memberNum + ", contentCategory=" + contentCategory + "]";
	}

	
	
	
}
