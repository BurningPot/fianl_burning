package com.kh.pot.admin.model.vo;

import java.io.Serializable;

public class Statistics implements Serializable{

	
	private static final long serialVersionUID = -2664597869909686102L;
	
	private int ranking;
	private String rNum;
	private String rName;
	private String mName;
	private int counting;
	
	
	
	public Statistics(){
		
	}


	public Statistics(int ranking, String rNum, String rName, String mName, int counting) {
		super();
		this.ranking = ranking;
		this.rNum = rNum;
		this.rName = rName;
		this.mName = mName;
		this.counting = counting;
	}


	public int getRanking() {
		return ranking;
	}


	public void setRanking(int ranking) {
		this.ranking = ranking;
	}


	public String getrNum() {
		return rNum;
	}


	public void setrNum(String rNum) {
		this.rNum = rNum;
	}


	public String getrName() {
		return rName;
	}


	public void setrName(String rName) {
		this.rName = rName;
	}


	public String getmName() {
		return mName;
	}


	public void setmName(String mName) {
		this.mName = mName;
	}


	public int getCounting() {
		return counting;
	}


	public void setCounting(int counting) {
		this.counting = counting;
	}
	
	
	
	
	
	
}
