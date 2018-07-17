package com.kh.pot.recipe.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Review implements Serializable{

	private static final long serialVersionUID = -4677979392680103269L;

	private int rvNum; 			// 리뷰번호
	private int rNum;			// 레시피번호
	private int mNum;			// 회원번호(작성자)
	private String mName;		// 회원이름
	private String mId;			// 회원 아이디			
	private int grade;				// 리뷰평점
	private String reviewContent;	// 리뷰내용
	private Date reviewDate;		// 리뷰등록일
	
	public Review(){
		
	}

	public Review(int rvNum, int rNum, int mNum, String mName, String mId, int grade, String reviewContent,
			Date reviewDate) {
		super();
		this.rvNum = rvNum;
		this.rNum = rNum;
		this.mNum = mNum;
		this.mName = mName;
		this.mId = mId;
		this.grade = grade;
		this.reviewContent = reviewContent;
		this.reviewDate = reviewDate;
	}

	public int getRvNum() {
		return rvNum;
	}

	public void setRvNum(int rvNum) {
		this.rvNum = rvNum;
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

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	

	
	
}
