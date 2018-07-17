package com.kh.pot.board.model.vo;

import java.io.Serializable;

public class Report implements Serializable{

	
	private static final long serialVersionUID = 4769403675954742141L;
	
	private int rpNum;		// 신고글번호
	private int rNum;		// 레시피번호
	private int mNum;		// 신고자 번호
	private String mName;	// 신고자 이름
	private String mId;		// 신고자 아이디	
	private String rpContent;	// 신고내용
	
	public Report(){
		super();
	}

	public Report(int rpNum, int rNum, int mNum, String mName, String mId, String rpContent) {
		super();
		this.rpNum = rpNum;
		this.rNum = rNum;
		this.mNum = mNum;
		this.mName = mName;
		this.mId = mId;
		this.rpContent = rpContent;
	}

	public int getRpNum() {
		return rpNum;
	}

	public void setRpNum(int rpNum) {
		this.rpNum = rpNum;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

	public int getmNum() {
		return mNum;
	}

	public void setmNum(int mNum) {
		this.mNum = mNum;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getRpContent() {
		return rpContent;
	}

	public void setRpContent(String rpContent) {
		this.rpContent = rpContent;
	}

	
	
	
	
	
}
