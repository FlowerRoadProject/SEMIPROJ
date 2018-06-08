package com.fr.jsp.admin.model.vo;

import java.sql.Date;

public class AdminRandomGame {
	
	private String adminNum;
	private int clickCount;
	private Date gameDate;
	private int topNum;
	private int leftNum;
	private int goalTopNum;
	private int goalLeftNum;
	
	public AdminRandomGame() {
		super();
	}

	public AdminRandomGame(String adminNum, int clickCount, Date gameDate, int topNum, int leftNum, int goalTopNum,
			int goalLeftNum) {
		super();
		this.adminNum = adminNum;
		this.clickCount = clickCount;
		this.gameDate = gameDate;
		this.topNum = topNum;
		this.leftNum = leftNum;
		this.goalTopNum = goalTopNum;
		this.goalLeftNum = goalLeftNum;
	}

	public String getAdminNum() {
		return adminNum;
	}

	public void setAdminNum(String adminNum) {
		this.adminNum = adminNum;
	}

	public int getClickCount() {
		return clickCount;
	}

	public void setClickCount(int clickCount) {
		this.clickCount = clickCount;
	}

	public Date getGameDate() {
		return gameDate;
	}

	public void setGameDate(Date gameDate) {
		this.gameDate = gameDate;
	}

	public int getTopNum() {
		return topNum;
	}

	public void setTopNum(int topNum) {
		this.topNum = topNum;
	}

	public int getLeftNum() {
		return leftNum;
	}

	public void setLeftNum(int leftNum) {
		this.leftNum = leftNum;
	}

	public int getGoalTopNum() {
		return goalTopNum;
	}

	public void setGoalTopNum(int goalTopNum) {
		this.goalTopNum = goalTopNum;
	}

	public int getGoalLeftNum() {
		return goalLeftNum;
	}

	public void setGoalLeftNum(int goalLeftNum) {
		this.goalLeftNum = goalLeftNum;
	}


}
