package com.kh.pot.fridge.model.vo;

public class F_Recipe implements java.io.Serializable {

	private static final long serialVersionUID = 7244177472L;

	private int rNum;			// 레시피번호
	private int mNum;			// 회원번호
	private String mName;		// 회원이름
	private String mId;			// 회원아이디
	private String rName;		// 레시피이름
	private String rImg;		// 레시피 타이틀이미지
	private String rIntro;		// 요리소개
	private String iName;		// 재료이름
	
	public F_Recipe() {
		super();
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

	public String getrIntro() {
		return rIntro;
	}

	public void setrIntro(String rIntro) {
		this.rIntro = rIntro;
	}

	public String getiName() {
		return iName;
	}

	public void setiName(String iName) {
		this.iName = iName;
	}
	
}
