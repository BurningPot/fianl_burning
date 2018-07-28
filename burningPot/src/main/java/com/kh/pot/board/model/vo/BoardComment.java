package com.kh.pot.board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class BoardComment implements Serializable{
	
	
	private static final long serialVersionUID = 145678685465L;
		
	private int bcNum;		// 게시판 댓글번호
	private int bNum;		// 글번호
	private int mNum;		// 회원번호
	private String mName;	// 멤버의 이름
	private String mId;		// 멤버의 아이디
	private String mPicture;	// 회원 사진
	private Date bcDate;	// 작성일
	private String bcContent;// 댓글내용
	private String bcDateTime;  	// 작성일 (시간포함) 
	
	public BoardComment(){
		
	}

	public BoardComment(int bcNum, int bNum, int mNum, String mName, String mId, Date bcDate, String bcContent) {
		super();
		this.bcNum = bcNum;
		this.bNum = bNum;
		this.mNum = mNum;
		this.mName = mName;
		this.mId = mId;
		this.bcDate = bcDate;
		this.bcContent = bcContent;
	}
	
	public BoardComment(int bcNum, int bNum, int mNum, String mName, String mId, String mPicture, Date bcDate,
			String bcContent, String bcDateTime) {
		super();
		this.bcNum = bcNum;
		this.bNum = bNum;
		this.mNum = mNum;
		this.mName = mName;
		this.mId = mId;
		this.mPicture = mPicture;
		this.bcDate = bcDate;
		this.bcContent = bcContent;
		this.bcDateTime = bcDateTime;
	}

	public int getBcNum() {
		return bcNum;
	}

	public void setBcNum(int bcNum) {
		this.bcNum = bcNum;
	}

	public int getbNum() {
		return bNum;
	}

	public void setbNum(int bNum) {
		this.bNum = bNum;
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

	public Date getBcDate() {
		return bcDate;
	}

	public void setBcDate(Date bcDate) {
		this.bcDate = bcDate;
	}

	public String getBcContent() {
		return bcContent;
	}

	public void setBcContent(String bcContent) {
		this.bcContent = bcContent;
	}
	
	public String getmPicture() {
		return mPicture;
	}

	public void setmPicture(String mPicture) {
		this.mPicture = mPicture;
	}

	public String getBcDateTime() {
		return bcDateTime;
	}

	public void setBcDateTime(String bcDateTime) {
		this.bcDateTime = bcDateTime;
	}

	@Override
	public String toString() {
		return "BoardComment [bcNum=" + bcNum + ", bNum=" + bNum + ", mNum=" + mNum + ", mName=" + mName + ", mId="
				+ mId + ", mPicture=" + mPicture + ", bcDate=" + bcDate + ", bcContent=" + bcContent + ", bcDateTime="
				+ bcDateTime + "]";
	}
	
}
