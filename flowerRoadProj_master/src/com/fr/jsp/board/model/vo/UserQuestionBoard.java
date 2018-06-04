package com.fr.jsp.board.model.vo;

import java.sql.Date;

public class UserQuestionBoard extends Board{

	/**
	 * Board class 상속
	 * 	private String bNum;
		private String bTitle;
		private String bContent;
		private Date submitDate;
	 * 
	 * 
	 */
	private static final long serialVersionUID = -249117873989278687L;
	
	
	private String memberNum ; 
	private String managerNum;
	private Date reply_date;
	private int viewNum;
	private String replyContent;
	
	
	public int getViewNum() {
		return viewNum;
	}
	public void setViewNum(int viewNum) {
		this.viewNum = viewNum;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	
	public UserQuestionBoard(int bNum, String bTitle, String bContent, Date submitDate, String memberNum,
			String managerNum, Date reply_date, int viewNum, String replyContent) {
		super(bNum, bTitle, bContent, submitDate);
		this.memberNum = memberNum;
		this.managerNum = managerNum;
		this.reply_date = reply_date;
		this.viewNum = viewNum;
		this.replyContent = replyContent;
	}
	public String getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(String memberNum) {
		this.memberNum = memberNum;
	}
	public String getManagerNum() {
		return managerNum;
	}
	public void setManagerNum(String managerNum) {
		this.managerNum = managerNum;
	}
	public Date getReply_date() {
		return reply_date;
	}
	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}
	
	@Override
	public String toString() {
		return "UserQuestionboard [memberNum=" + memberNum + ", managerNum=" + managerNum + ", reply_date=" + reply_date
				+ "]";
	}
	
	
	public UserQuestionBoard() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((managerNum == null) ? 0 : managerNum.hashCode());
		result = prime * result + ((memberNum == null) ? 0 : memberNum.hashCode());
		result = prime * result + ((replyContent == null) ? 0 : replyContent.hashCode());
		result = prime * result + ((reply_date == null) ? 0 : reply_date.hashCode());
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
		UserQuestionBoard other = (UserQuestionBoard) obj;
		if (managerNum == null) {
			if (other.managerNum != null)
				return false;
		} else if (!managerNum.equals(other.managerNum))
			return false;
		if (memberNum == null) {
			if (other.memberNum != null)
				return false;
		} else if (!memberNum.equals(other.memberNum))
			return false;
		if (replyContent == null) {
			if (other.replyContent != null)
				return false;
		} else if (!replyContent.equals(other.replyContent))
			return false;
		if (reply_date == null) {
			if (other.reply_date != null)
				return false;
		} else if (!reply_date.equals(other.reply_date))
			return false;
		if (viewNum != other.viewNum)
			return false;
		return true;
	}
	
	
}
