package com.kh.pot.common.exception;

public class PotException extends RuntimeException {

	public PotException(){
		super();
	}
	public PotException(String msg1, String msg2){
		super(msg1+", "+msg2);
		
	}
}
