package com.kh.pot.recipe.model.vo;

import java.io.Serializable;

public class Recommend implements Serializable{

	
	private static final long serialVersionUID = -2823927743622792160L;
	
	private int mNum;	// 회원번호
	private int rNum;	// 레시피번호
	
	public Recommend(){
		
	}

	public Recommend(int mNum, int rNum) {
		super();
		this.mNum = mNum;
		this.rNum = rNum;
	}

	public int getmNum() {
		return mNum;
	}

	public void setmNum(int mNum) {
		this.mNum = mNum;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

	

	
	
}
