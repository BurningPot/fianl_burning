package com.kh.pot.ingredient.model.vo;

import java.io.Serializable;

public class IngredientKeyword implements Serializable{

	
	private static final long serialVersionUID = -6963606119506395817L;
	
	private int iNum;		// 재료번호
	private String keyword;		// 재료관련 키워드
	
	public IngredientKeyword(){
		
	}

	public IngredientKeyword(int iNum, String keyword) {
		super();
		this.iNum = iNum;
		this.keyword = keyword;
	}

	public int getiNum() {
		return iNum;
	}

	public void setiNum(int iNum) {
		this.iNum = iNum;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	
	
	
	
	
}
