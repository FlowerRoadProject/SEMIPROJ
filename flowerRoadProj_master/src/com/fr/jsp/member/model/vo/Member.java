package com.fr.jsp.member.model.vo;

import java.util.Date;

public class Member {

	 private String memberNum;
	   private String memberId;
	   private String memberPw;
	   private String memberName;
	   private String memberAddress;
	   private String memberPhone;
	   private char memberGender;
	   private Date memberBirthDate;
	   private String gradeCode;
	   private String secondPw;
	   private String imagePath;
	   private Date enrollDate;
	   private String memberEmail;
	   
	   
	public Member(String memberNum, String memberId, String memberPw, String memberName, String memberAddress,
			String memberPhone, char memberGender, Date memberBirthDate, String gradeCode, String secondPw,
			String imagePath, Date enrollDate, String memberEmail) {
		super();
		this.memberNum = memberNum;
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberAddress = memberAddress;
		this.memberPhone = memberPhone;
		this.memberGender = memberGender;
		this.memberBirthDate = memberBirthDate;
		this.gradeCode = gradeCode;
		this.secondPw = secondPw;
		this.imagePath = imagePath;
		this.enrollDate = enrollDate;
		this.memberEmail = memberEmail;
	}
	
	public Member(String id) {
		this.memberId = id;
	}

	public Member(String id, String pwd) {
		this.memberId = id;
		this.memberPw = pwd;
	}
	
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(String memberNum) {
		this.memberNum = memberNum;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberAddress() {
		return memberAddress;
	}
	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public char getMemberGender() {
		return memberGender;
	}
	public void setMemberGender(char memberGender) {
		this.memberGender = memberGender;
	}
	public Date getMemberBirthDate() {
		return memberBirthDate;
	}
	public void setMemberBirthDate(Date memberBirthDate) {
		this.memberBirthDate = memberBirthDate;
	}
	public String getGradeCode() {
		return gradeCode;
	}
	public void setGradeCode(String gradeCode) {
		this.gradeCode = gradeCode;
	}
	public String getSecondPw() {
		return secondPw;
	}
	public void setSecondPw(String secondPw) {
		this.secondPw = secondPw;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((enrollDate == null) ? 0 : enrollDate.hashCode());
		result = prime * result + ((gradeCode == null) ? 0 : gradeCode.hashCode());
		result = prime * result + ((imagePath == null) ? 0 : imagePath.hashCode());
		result = prime * result + ((memberAddress == null) ? 0 : memberAddress.hashCode());
		result = prime * result + ((memberBirthDate == null) ? 0 : memberBirthDate.hashCode());
		result = prime * result + ((memberEmail == null) ? 0 : memberEmail.hashCode());
		result = prime * result + memberGender;
		result = prime * result + ((memberId == null) ? 0 : memberId.hashCode());
		result = prime * result + ((memberName == null) ? 0 : memberName.hashCode());
		result = prime * result + ((memberNum == null) ? 0 : memberNum.hashCode());
		result = prime * result + ((memberPhone == null) ? 0 : memberPhone.hashCode());
		result = prime * result + ((memberPw == null) ? 0 : memberPw.hashCode());
		result = prime * result + ((secondPw == null) ? 0 : secondPw.hashCode());
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
		Member other = (Member) obj;
		if (enrollDate == null) {
			if (other.enrollDate != null)
				return false;
		} else if (!enrollDate.equals(other.enrollDate))
			return false;
		if (gradeCode == null) {
			if (other.gradeCode != null)
				return false;
		} else if (!gradeCode.equals(other.gradeCode))
			return false;
		if (imagePath == null) {
			if (other.imagePath != null)
				return false;
		} else if (!imagePath.equals(other.imagePath))
			return false;
		if (memberAddress == null) {
			if (other.memberAddress != null)
				return false;
		} else if (!memberAddress.equals(other.memberAddress))
			return false;
		if (memberBirthDate == null) {
			if (other.memberBirthDate != null)
				return false;
		} else if (!memberBirthDate.equals(other.memberBirthDate))
			return false;
		if (memberEmail == null) {
			if (other.memberEmail != null)
				return false;
		} else if (!memberEmail.equals(other.memberEmail))
			return false;
		if (memberGender != other.memberGender)
			return false;
		if (memberId == null) {
			if (other.memberId != null)
				return false;
		} else if (!memberId.equals(other.memberId))
			return false;
		if (memberName == null) {
			if (other.memberName != null)
				return false;
		} else if (!memberName.equals(other.memberName))
			return false;
		if (memberNum == null) {
			if (other.memberNum != null)
				return false;
		} else if (!memberNum.equals(other.memberNum))
			return false;
		if (memberPhone == null) {
			if (other.memberPhone != null)
				return false;
		} else if (!memberPhone.equals(other.memberPhone))
			return false;
		if (memberPw == null) {
			if (other.memberPw != null)
				return false;
		} else if (!memberPw.equals(other.memberPw))
			return false;
		if (secondPw == null) {
			if (other.secondPw != null)
				return false;
		} else if (!secondPw.equals(other.secondPw))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Member [memberNum=" + memberNum + ", memberId=" + memberId + ", memberPw=" + memberPw + ", memberName="
				+ memberName + ", memberAddress=" + memberAddress + ", memberPhone=" + memberPhone + ", memberGender="
				+ memberGender + ", memberBirthDate=" + memberBirthDate + ", gradeCode=" + gradeCode + ", secondPw="
				+ secondPw + ", imagePath=" + imagePath + ", enrollDate=" + enrollDate + ", memberEmail=" + memberEmail
				+ "]";
	}
	
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	   
	   
	
}
