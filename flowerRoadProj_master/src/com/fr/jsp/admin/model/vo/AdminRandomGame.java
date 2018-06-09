package com.fr.jsp.admin.model.vo;

public class AdminRandomGame {
	
	private int topNum;
	private int leftNum;
	private int goalTopNum;
	private int goalLeftNum;
	
	public AdminRandomGame() {
		super();
	}

	public AdminRandomGame(int topNum, int leftNum, int goalTopNum, int goalLeftNum) {
		super();
		this.topNum = topNum;
		this.leftNum = leftNum;
		this.goalTopNum = goalTopNum;
		this.goalLeftNum = goalLeftNum;
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
