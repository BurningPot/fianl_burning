package com.kh.pot.board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Board implements Serializable{
	
	private static final long serialVersionUID = 102496465L;
	
	private int bNum;		// 글번호
	private String category;	// 글구분
	private String bTitle;		// 글제목
	private int mNum;		// 회원번호
	private String mId;			// 회원아이디
	private String mName;		// 회원 이름
	private Date bDate;			// 작성일
	private String bContent;	// 글내용
	private String bImg;		// 사진
	private String reply;		// 답변여부(관리자가 답변했는지) --> Q&A에만 해당되는 사항일듯
	private int bCount;
	
	public Board(){
		super();
	}

	public Board(int bNum, String category, String bTitle, int mNum, String mId, String mName, Date bDate,
			String bContent, String bImg, String reply, int bCount) {
		super();
		this.bNum = bNum;
		this.category = category;
		this.bTitle = bTitle;
		this.mNum = mNum;
		this.mId = mId;
		this.mName = mName;
		this.bDate = bDate;
		this.bContent = bContent;
		this.bImg = bImg;
		this.reply = reply;
		this.bCount = bCount;
	}

	public int getbNum() {
		return bNum;
	}

	public void setbNum(int bNum) {
		this.bNum = bNum;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public int getmNum() {
		return mNum;
	}

	public void setmNum(int mNum) {
		this.mNum = mNum;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public Date getbDate() {
		return bDate;
	}

	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public String getbImg() {
		return bImg;
	}

	public void setbImg(String bImg) {
		this.bImg = bImg;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public int getbCount() {
		return bCount;
	}

	public void setbCount(int bCount) {
		this.bCount = bCount;
	}

	
	
	
	
}