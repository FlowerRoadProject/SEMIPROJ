package com.fr.jsp.board.model.vo;

import java.sql.Date;

public class NoticeBoard extends Board{

	/**
	 * 
	 */
	
	/**
	 * Board class 상속
	 * 	private String bNum;
		private String bTitle;
		private String bContent;
		private Date submitDate;
	 * 
	 * 
	 */
	private static final long serialVersionUID = -3218731893486173271L;
	
	private int viewNum;
	private String memberNum;
	

	public NoticeBoard(int bNum, String bTitle, String bContent, Date submitDate, int viewNum, String memberNum) {
		super(bNum, bTitle, bContent, submitDate);
		this.viewNum = viewNum;
		this.memberNum = memberNum;
	}



	public NoticeBoard() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	public int getViewNum() {
		return viewNum;
	}

	public void setViewNum(int viewNum) {
		this.viewNum = viewNum;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}



	@Override
	public String toString() {
		return "NoticeBoard [viewNum=" + viewNum + "]";
	}

	

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + viewNum;
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
		NoticeBoard other = (NoticeBoard) obj;
		if (viewNum != other.viewNum)
			return false;
		return true;
	}



	public String getMemberNum() {
		return memberNum;
	}



	public void setMemberNum(String memberNum) {
		this.memberNum = memberNum;
	}

	
	
	
	
	

}
