package com.kh.pot.ingredient.model.vo;

import java.io.Serializable;

public class Ingredient implements Serializable{
	
	private static final long serialVersionUID = -3752199649028000040L;
			
	private int iNum; 			// 재료번호
	private String iName;		// 재료이름
	private String category;	// 카테고리
	private String iImage;		// 재료 이미지
	private int exDate;			// 재료 유통기한 (7일)
	private String cName;		// 재료 상위 카테고리 이름
	private String subCName;	// 재료 하위 카테고리 이름
	private String keyword;
	
	public Ingredient(){
		
	}

	public Ingredient(int iNum, String iName, String category, String iImage, int exDate, String cName, String subCName,
			String keyword) {
		super();
		this.iNum = iNum;
		this.iName = iName;
		this.category = category;
		this.iImage = iImage;
		this.exDate = exDate;
		this.cName = cName;
		this.subCName = subCName;
		this.keyword = keyword;
	}

	public int getiNum() {
		return iNum;
	}

	public void setiNum(int iNum) {
		this.iNum = iNum;
	}

	public String getiName() {
		return iName;
	}

	public void setiName(String iName) {
		this.iName = iName;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getiImage() {
		return iImage;
	}

	public void setiImage(String iImage) {
		this.iImage = iImage;
	}

	public int getExDate() {
		return exDate;
	}

	public void setExDate(int exDate) {
		this.exDate = exDate;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getSubCName() {
		return subCName;
	}

	public void setSubCName(String subCName) {
		this.subCName = subCName;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	
	
	
	
	
	
	
	
}
