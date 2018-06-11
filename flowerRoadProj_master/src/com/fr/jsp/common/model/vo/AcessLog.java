package com.fr.jsp.common.model.vo;

import java.sql.Timestamp;

public class AcessLog {

	String memberNum;
	Timestamp accessTime;
	public String getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(String memberNum) {
		this.memberNum = memberNum;
	}
	public Timestamp getAccessTime() {
		return accessTime;
	}
	public void setAccessTime(Timestamp accessTime) {
		this.accessTime = accessTime;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((accessTime == null) ? 0 : accessTime.hashCode());
		result = prime * result + ((memberNum == null) ? 0 : memberNum.hashCode());
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
		AcessLog other = (AcessLog) obj;
		if (accessTime == null) {
			if (other.accessTime != null)
				return false;
		} else if (!accessTime.equals(other.accessTime))
			return false;
		if (memberNum == null) {
			if (other.memberNum != null)
				return false;
		} else if (!memberNum.equals(other.memberNum))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "AcessLog [memberNum=" + memberNum + ", accessTime=" + accessTime + "]";
	}
	public AcessLog(String memberNum, Timestamp accessTime) {
		super();
		this.memberNum = memberNum;
		this.accessTime = accessTime;
	}
	public AcessLog() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
