package com.fr.jsp.member.model.vo;

import java.util.Date;

public class MemberBoard {

	private String boardTitle;
	private String boardContent;
	private String memberNum;
	private String memberSendEmail;
	private String memberSendPhone;
	private int viewNum;
	private Date submitDate;
	private String adminNum;
	private String replyContent;
	private Date replyDate;
	private String replyStatus;
	public String getBoardTitle() {
		return boardTitle;
	}
	
	public String getMemberSendEmail() {
		return memberSendEmail;
	}

	public void setMemberSendEmail(String memberSendEmail) {
		this.memberSendEmail = memberSendEmail;
	}

	public String getMemberSendPhone() {
		return memberSendPhone;
	}

	public void setMemberSendPhone(String memberSendPhone) {
		this.memberSendPhone = memberSendPhone;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(String memberNum) {
		this.memberNum = memberNum;
	}
	public int getViewNum() {
		return viewNum;
	}
	public void setViewNum(int viewNum) {
		this.viewNum = viewNum;
	}
	public Date getSubmitDate() {
		return submitDate;
	}
	public void setSubmitDate(Date submitDate) {
		this.submitDate = submitDate;
	}
	public String getAdminNum() {
		return adminNum;
	}
	public void setAdminNum(String adminNum) {
		this.adminNum = adminNum;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public Date getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}
	public String getReplyStatus() {
		return replyStatus;
	}
	public void setReplyStatus(String replyStatus) {
		this.replyStatus = replyStatus;
	}
	
	
	
	
	
}
