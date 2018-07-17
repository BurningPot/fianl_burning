package com.kh.pot.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable{

	
	private static final long serialVersionUID = -262835710219059469L;
		
	private int mNum;        // 회원번호
	private String mCategory;	// 회원분류 (회원, 관리자)
	private String mId;			// 아이디
	private String password; 	// 비밀번호
	private String email;		// 이메일
	private String mName;  		// 이름
	private String gender;		// 성별
	private Date birthDate;		// 생년월일
	private String mPicture;	// 사진
	private String expel;		// 강제탈퇴여부
	private Date enrollDate;	// 가입날짜
	
	public Member(){
		
	}

	public Member(int mNum, String mCategory, String mId, String password, String email, String mName, String gender,
			Date birthDate, String mPicture, String expel, Date enrollDate) {
		super();
		this.mNum = mNum;
		this.mCategory = mCategory;
		this.mId = mId;
		this.password = password;
		this.email = email;
		this.mName = mName;
		this.gender = gender;
		this.birthDate = birthDate;
		this.mPicture = mPicture;
		this.expel = expel;
		this.enrollDate = enrollDate;
	}

	public int getmNum() {
		return mNum;
	}

	public void setmNum(int mNum) {
		this.mNum = mNum;
	}

	public String getmCategory() {
		return mCategory;
	}

	public void setmCategory(String mCategory) {
		this.mCategory = mCategory;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public String getmPicture() {
		return mPicture;
	}

	public void setmPicture(String mPicture) {
		this.mPicture = mPicture;
	}

	public String getExpel() {
		return expel;
	}

	public void setExpel(String expel) {
		this.expel = expel;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	
	
	
	
}
