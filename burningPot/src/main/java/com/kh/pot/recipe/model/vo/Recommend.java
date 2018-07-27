package com.kh.pot.recipe.model.vo;

import java.io.Serializable;

public class Recommend implements Serializable{

	
	private static final long serialVersionUID = -2823927743622792160L;
	
	private int mNum;	// 회원번호
	private int rNum;	// 레시피번호
	private String chk;	// 삭제, 추가 구분
	
	public Recommend(){
		
	}

	public Recommend(int mNum, int rNum) {
		super();
		this.mNum = mNum;
		this.rNum = rNum;
	}

	public Recommend(int mNum, int rNum, String chk) {
		super();
		this.mNum = mNum;
		this.rNum = rNum;
		this.chk = chk;
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

	public String getChk() {
		return chk;
	}

	public void setChk(String chk) {
		this.chk = chk;
	}

	@Override
	public String toString() {
		return "Recommend [mNum=" + mNum + ", rNum=" + rNum + ", chk=" + chk + "]";
	}
	
}
