package com.kh.pot.fridge.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Fridge implements Serializable{

	
	private static final long serialVersionUID = 862911969220265584L;
	
	private int mNum;		// 회원번호
	private String mName;	// 회원이름
	private String mId;		// 회원아이디
	private int iNum;		// 재료번호
	private Date fDate;			// 재료등록날짜
	private int remainDate;		// 남은유통기한 (7일)
	
	public Fridge(){
		
	}

	public Fridge(int mNum, String mName, String mId, int iNum, Date fDate, int remainDate) {
		super();
		this.mNum = mNum;
		this.mName = mName;
		this.mId = mId;
		this.iNum = iNum;
		this.fDate = fDate;
		this.remainDate = remainDate;
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

	public int getiNum() {
		return iNum;
	}

	public void setiNum(int iNum) {
		this.iNum = iNum;
	}

	public Date getfDate() {
		return fDate;
	}

	public void setfDate(Date fDate) {
		this.fDate = fDate;
	}

	public int getRemainDate() {
		return remainDate;
	}

	public void setRemainDate(int remainDate) {
		this.remainDate = remainDate;
	}

	
	
}
