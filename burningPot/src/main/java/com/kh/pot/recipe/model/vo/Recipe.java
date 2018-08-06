package com.kh.pot.recipe.model.vo;

import java.io.Serializable;

import java.sql.Date;

public class Recipe implements Serializable{


	private static final long serialVersionUID = -1188288417244177472L;
	
	private int rNum;			// 레시피번호
	private int mNum;			// 회원번호
	private String mName;		// 회원이름
	private String mId;			// 회원아이디
	private String rName;			// 레시피이름
	private String rImg;			// 레시피 타이틀이미지
	private int quantity;			// 인분 (2인분)
	private int rTime;				// 조리시간
	private int rLevel;				// 조리난이도
	private String iNum;			// 재료번호(주재료)
	private String iQuan;			// 재료 수량(주재료)
//	private List<String> iNum;
//	private List<String> iQuan;
	private String subIngredient;	// 첨가물(부재료)
	private Date rDate;				// 등록일
	private String rIntro;			// 요리소개
	private int rReport;			// 레시피 신고수
	private int rRecommend;			// 레시피 추천수
	private int rCount;				// 레시피 조회수
	private int rcCheck;			// Recommend의 RNUM
	private double grade;			
	private int untilReg;			// 등록한지 몇일 지났는지
	private String rName2;
	
	public Recipe(){
		
	}

	public Recipe(int rNum, int mNum, String mName, String mId, String rName, String rImg, int quantity, int rTime,
			int rLevel, String iNum, String iQuan, String subIngredient, Date rDate, String rIntro, int rReport,
			int rRecommend, int rCount) {
		super();
		this.rNum = rNum;
		this.mNum = mNum;
		this.mName = mName;
		this.mId = mId;
		this.rName = rName;
		this.rImg = rImg;
		this.quantity = quantity;
		this.rTime = rTime;
		this.rLevel = rLevel;
		this.iNum = iNum;
		this.iQuan = iQuan;
		this.subIngredient = subIngredient;
		this.rDate = rDate;
		this.rIntro = rIntro;
		this.rReport = rReport;
		this.rRecommend = rRecommend;
		this.rCount = rCount;
	}

	public Recipe(int rNum, int mNum, String mName, String mId, String rName, String rImg, int quantity, int rTime,
			int rLevel, String iNum, String iQuan, String subIngredient, Date rDate, String rIntro, int rReport,
			int rRecommend, int rCount, int rcCheck) {
		super();
		this.rNum = rNum;
		this.mNum = mNum;
		this.mName = mName;
		this.mId = mId;
		this.rName = rName;
		this.rImg = rImg;
		this.quantity = quantity;
		this.rTime = rTime;
		this.rLevel = rLevel;
		this.iNum = iNum;
		this.iQuan = iQuan;
		this.subIngredient = subIngredient;
		this.rDate = rDate;
		this.rIntro = rIntro;
		this.rReport = rReport;
		this.rRecommend = rRecommend;
		this.rCount = rCount;
		this.rcCheck = rcCheck;
	}

	public Recipe(int rNum, int mNum, String mName, String mId, String rName, String rImg, int quantity, int rTime,
			int rLevel, String iNum, String iQuan, String subIngredient, Date rDate, String rIntro, int rReport,
			int rRecommend, int rCount, int rcCheck, double grade, int untilReg) {
		super();
		this.rNum = rNum;
		this.mNum = mNum;
		this.mName = mName;
		this.mId = mId;
		this.rName = rName;
		this.rImg = rImg;
		this.quantity = quantity;
		this.rTime = rTime;
		this.rLevel = rLevel;
		this.iNum = iNum;
		this.iQuan = iQuan;
		this.subIngredient = subIngredient;
		this.rDate = rDate;
		this.rIntro = rIntro;
		this.rReport = rReport;
		this.rRecommend = rRecommend;
		this.rCount = rCount;
		this.rcCheck = rcCheck;
		this.grade = grade;
		this.untilReg = untilReg;
	}
	
	public Recipe(int rNum, int mNum, String mName, String mId, String rName, String rImg, int quantity, int rTime,
			int rLevel, String iNum, String iQuan, String subIngredient, Date rDate, String rIntro, int rReport,
			int rRecommend, int rCount, int rcCheck, double grade, int untilReg, String rName2) {
		super();
		this.rNum = rNum;
		this.mNum = mNum;
		this.mName = mName;
		this.mId = mId;
		this.rName = rName;
		this.rImg = rImg;
		this.quantity = quantity;
		this.rTime = rTime;
		this.rLevel = rLevel;
		this.iNum = iNum;
		this.iQuan = iQuan;
		this.subIngredient = subIngredient;
		this.rDate = rDate;
		this.rIntro = rIntro;
		this.rReport = rReport;
		this.rRecommend = rRecommend;
		this.rCount = rCount;
		this.rcCheck = rcCheck;
		this.grade = grade;
		this.untilReg = untilReg;
		this.rName2 = rName2;
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

	public String getrName() {
		return rName;
	}

	public void setrName(String rName) {
		this.rName = rName;
	}

	public String getrImg() {
		return rImg;
	}

	public void setrImg(String rImg) {
		this.rImg = rImg;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getrTime() {
		return rTime;
	}

	public void setrTime(int rTime) {
		this.rTime = rTime;
	}

	public int getrLevel() {
		return rLevel;
	}

	public void setrLevel(int rLevel) {
		this.rLevel = rLevel;
	}

	public String getiNum() {
		return iNum;
	}

	public void setiNum(String iNum) {
		this.iNum = iNum;
	}

	public String getiQuan() {
		return iQuan;
	}

	public void setiQuan(String iQuan) {
		this.iQuan = iQuan;
	}

	public String getSubIngredient() {
		return subIngredient;
	}

	public void setSubIngredient(String subIngredient) {
		this.subIngredient = subIngredient;
	}

	public Date getrDate() {
		return rDate;
	}

	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}

	public String getrIntro() {
		return rIntro;
	}

	public void setrIntro(String rIntro) {
		this.rIntro = rIntro;
	}

	public int getrReport() {
		return rReport;
	}

	public void setrReport(int rReport) {
		this.rReport = rReport;
	}

	public int getrRecommend() {
		return rRecommend;
	}

	public void setrRecommend(int rRecommend) {
		this.rRecommend = rRecommend;
	}

	public int getrCount() {
		return rCount;
	}

	public void setrCount(int rCount) {
		this.rCount = rCount;
	}

	public int getRcCheck() {
		return rcCheck;
	}

	public void setRcCheck(int rcCheck) {
		this.rcCheck = rcCheck;
	}

	public int getUntilReg() {
		return untilReg;
	}

	public void setUntilReg(int untilReg) {
		this.untilReg = untilReg;
	}
	
	public double getGrade() {
		return grade;
	}

	public void setGrade(double grade) {
		this.grade = grade;
	}
	
	public String getrName2() {
		return rName2;
	}

	public void setrName2(String rName2) {
		this.rName2 = rName2;
	}

	@Override
	public String toString() {
		return "Recipe [rNum=" + rNum + ", mNum=" + mNum + ", mName=" + mName + ", mId=" + mId + ", rName=" + rName
				+ ", rImg=" + rImg + ", quantity=" + quantity + ", rTime=" + rTime + ", rLevel=" + rLevel + ", iNum="
				+ iNum + ", iQuan=" + iQuan + ", subIngredient=" + subIngredient + ", rDate=" + rDate + ", rIntro="
				+ rIntro + ", rReport=" + rReport + ", rRecommend=" + rRecommend + ", rCount=" + rCount + ", rcCheck="
				+ rcCheck + ", grade=" + grade + ", untilReg=" + untilReg + ", rName2=" + rName2 + "]";
	}
	
}
