package com.fr.jsp.admin.model.vo;

import java.sql.Date;

public class AdminTheme {
	
	private String adminNum;
	private Date selectDate;
	private String fontFamily;
	private String fontSize;
	private String fontWeight;
	private String navTitleBbc;
	private String navCenterBgc;
	private String navChildBgc;
	private String navBottomBgc;
	private String topMenuBgc;
	private String topChildBgc;
	private String mainBgc;
	private String navTitleColor;
	private String navProfileColor;
	private String navSideTitleColor;
	private String navSideColor;
	private String navChildColor;
	private String topMenuColor;
	private String mainColor;
	
	public AdminTheme() {
		super();
	}

	public AdminTheme(String adminNum, Date selectDate, String fontFamily, String fontSize, String fontWeight,
			String navTitleBbc, String navCenterBgc, String navChildBgc, String navBottomBgc, String topMenuBgc,
			String topChildBgc, String mainBgc, String navTitleColor, String navProfileColor, String navSideTitleColor,
			String navSideColor, String navChildColor, String topMenuColor, String mainColor) {
		super();
		this.adminNum = adminNum;
		this.selectDate = selectDate;
		this.fontFamily = fontFamily;
		this.fontSize = fontSize;
		this.fontWeight = fontWeight;
		this.navTitleBbc = navTitleBbc;
		this.navCenterBgc = navCenterBgc;
		this.navChildBgc = navChildBgc;
		this.navBottomBgc = navBottomBgc;
		this.topMenuBgc = topMenuBgc;
		this.topChildBgc = topChildBgc;
		this.mainBgc = mainBgc;
		this.navTitleColor = navTitleColor;
		this.navProfileColor = navProfileColor;
		this.navSideTitleColor = navSideTitleColor;
		this.navSideColor = navSideColor;
		this.navChildColor = navChildColor;
		this.topMenuColor = topMenuColor;
		this.mainColor = mainColor;
	}

	public String getAdminNum() {
		return adminNum;
	}

	public void setAdminNum(String adminNum) {
		this.adminNum = adminNum;
	}

	public Date getSelectDate() {
		return selectDate;
	}

	public void setSelectDate(Date selectDate) {
		this.selectDate = selectDate;
	}

	public String getFontFamily() {
		return fontFamily;
	}

	public void setFontFamily(String fontFamily) {
		this.fontFamily = fontFamily;
	}

	public String getFontSize() {
		return fontSize;
	}

	public void setFontSize(String fontSize) {
		this.fontSize = fontSize;
	}

	public String getFontWeight() {
		return fontWeight;
	}

	public void setFontWeight(String fontWeight) {
		this.fontWeight = fontWeight;
	}

	public String getNavTitleBbc() {
		return navTitleBbc;
	}

	public void setNavTitleBbc(String navTitleBbc) {
		this.navTitleBbc = navTitleBbc;
	}

	public String getNavCenterBgc() {
		return navCenterBgc;
	}

	public void setNavCenterBgc(String navCenterBgc) {
		this.navCenterBgc = navCenterBgc;
	}

	public String getNavChildBgc() {
		return navChildBgc;
	}

	public void setNavChildBgc(String navChildBgc) {
		this.navChildBgc = navChildBgc;
	}

	public String getNavBottomBgc() {
		return navBottomBgc;
	}

	public void setNavBottomBgc(String navBottomBgc) {
		this.navBottomBgc = navBottomBgc;
	}

	public String getTopMenuBgc() {
		return topMenuBgc;
	}

	public void setTopMenuBgc(String topMenuBgc) {
		this.topMenuBgc = topMenuBgc;
	}

	public String getTopChildBgc() {
		return topChildBgc;
	}

	public void setTopChildBgc(String topChildBgc) {
		this.topChildBgc = topChildBgc;
	}

	public String getMainBgc() {
		return mainBgc;
	}

	public void setMainBgc(String mainBgc) {
		this.mainBgc = mainBgc;
	}

	public String getNavTitleColor() {
		return navTitleColor;
	}

	public void setNavTitleColor(String navTitleColor) {
		this.navTitleColor = navTitleColor;
	}

	public String getNavProfileColor() {
		return navProfileColor;
	}

	public void setNavProfileColor(String navProfileColor) {
		this.navProfileColor = navProfileColor;
	}

	public String getNavSideTitleColor() {
		return navSideTitleColor;
	}

	public void setNavSideTitleColor(String navSideTitleColor) {
		this.navSideTitleColor = navSideTitleColor;
	}

	public String getNavSideColor() {
		return navSideColor;
	}

	public void setNavSideColor(String navSideColor) {
		this.navSideColor = navSideColor;
	}

	public String getNavChildColor() {
		return navChildColor;
	}

	public void setNavChildColor(String navChildColor) {
		this.navChildColor = navChildColor;
	}

	public String getTopMenuColor() {
		return topMenuColor;
	}

	public void setTopMenuColor(String topMenuColor) {
		this.topMenuColor = topMenuColor;
	}

	public String getMainColor() {
		return mainColor;
	}

	public void setMainColor(String mainColor) {
		this.mainColor = mainColor;
	}

}
