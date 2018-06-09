package com.fr.jsp.board.model.vo;

import java.sql.Date;

public class Board implements java.io.Serializable {

	/**
		 * 
		 */
	private static final long serialVersionUID = 4L;

	private int bNum;
	private String bTitle;
	private String bContent;
	private Date submitDate;

	public int getbNum() {
		return bNum;
	}

	public void setbNum(int bNum) {
		this.bNum = bNum;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public Date getSubmitDate() {
		return submitDate;
	}

	public void setSubmitDate(Date submitDate) {
		this.submitDate = submitDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((bContent == null) ? 0 : bContent.hashCode());
		result = prime * result + bNum;
		result = prime * result + ((bTitle == null) ? 0 : bTitle.hashCode());
		result = prime * result + ((submitDate == null) ? 0 : submitDate.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Board other = (Board) obj;
		if (bContent == null) {
			if (other.bContent != null)
				return false;
		} else if (!bContent.equals(other.bContent))
			return false;
		if (bNum != other.bNum)
			return false;
		if (bTitle == null) {
			if (other.bTitle != null)
				return false;
		} else if (!bTitle.equals(other.bTitle))
			return false;
		if (submitDate == null) {
			if (other.submitDate != null)
				return false;
		} else if (!submitDate.equals(other.submitDate))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Board [bNum=" + bNum + ", bTitle=" + bTitle + ", bContent=" + bContent + ", submitDate=" + submitDate
				+ "]";
	}

	public Board(int bNum, String bTitle, String bContent, Date submitDate) {
		super();
		this.bNum = bNum;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.submitDate = submitDate;
	}

	public Board() {
		super();

	}
	
	public Board(int bNum, String bTitle, String bContent) {
		this.bNum = bNum;
		this.bTitle = bTitle;
		this.bContent = bContent;
	}

}
