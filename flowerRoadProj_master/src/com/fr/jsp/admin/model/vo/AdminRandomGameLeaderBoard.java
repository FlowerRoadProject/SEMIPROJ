package com.fr.jsp.admin.model.vo;

import java.sql.Date;

public class AdminRandomGameLeaderBoard {
	
	private String adminNum;
	private int clickCount;
	private Date gameDate;
	private String difficulty;
	
	public AdminRandomGameLeaderBoard() {
		super();
	}

	public AdminRandomGameLeaderBoard(String adminNum, int clickCount, Date gameDate, String difficulty) {
		super();
		this.adminNum = adminNum;
		this.clickCount = clickCount;
		this.gameDate = gameDate;
		this.difficulty = difficulty;
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

	public String getDifficulty() {
		return difficulty;
	}

	public void setDifficulty(String difficulty) {
		this.difficulty = difficulty;
	}

}
