package com.fr.jsp.admin.model.vo;

import java.sql.Date;

public class AdminAdmin {
	
	private String adminNum;
	private String adminId;
	private String adminPw;
	private String adminName;
	private String adminAddress;
	private String adminPhone;
	private String adminGender;
	private Date adminBirthDate;
	private String secondPw;
	private String imagePath;
	private Date enrollDate;
	private String adminEmail;
	
	public AdminAdmin() {
		super();
	}

	public AdminAdmin(String adminNum, String adminId, String adminPw, String adminName, String adminAddress,
			String adminPhone, String adminGender, Date adminBirthDate, String secondPw, String imagePath,
			Date enrollDate, String adminEmail) {
		super();
		this.adminNum = adminNum;
		this.adminId = adminId;
		this.adminPw = adminPw;
		this.adminName = adminName;
		this.adminAddress = adminAddress;
		this.adminPhone = adminPhone;
		this.adminGender = adminGender;
		this.adminBirthDate = adminBirthDate;
		this.secondPw = secondPw;
		this.imagePath = imagePath;
		this.enrollDate = enrollDate;
		this.adminEmail = adminEmail;
	}

	public String getAdminNum() {
		return adminNum;
	}

	public void setAdminNum(String adminNum) {
		this.adminNum = adminNum;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getAdminPw() {
		return adminPw;
	}

	public void setAdminPw(String adminPw) {
		this.adminPw = adminPw;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getAdminAddress() {
		return adminAddress;
	}

	public void setAdminAddress(String adminAddress) {
		this.adminAddress = adminAddress;
	}

	public String getAdminPhone() {
		return adminPhone;
	}

	public void setAdminPhone(String adminPhone) {
		this.adminPhone = adminPhone;
	}

	public String getAdminGender() {
		return adminGender;
	}

	public void setAdminGender(String adminGender) {
		this.adminGender = adminGender;
	}

	public Date getAdminBirthDate() {
		return adminBirthDate;
	}

	public void setAdminBirthDate(Date adminBirthDate) {
		this.adminBirthDate = adminBirthDate;
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

	public String getAdminEmail() {
		return adminEmail;
	}

	public void setAdminEmail(String adminEmail) {
		this.adminEmail = adminEmail;
	}

}
