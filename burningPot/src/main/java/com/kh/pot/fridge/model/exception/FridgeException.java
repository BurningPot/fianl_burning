package com.kh.pot.fridge.model.exception;

public class FridgeException extends Exception {

	public FridgeException() {
		super();
	}

	public FridgeException(String msg) {
		super("냉장고 에러 발생 : "+msg);
	}
	
	
}
