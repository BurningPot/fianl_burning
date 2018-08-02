package com.kh.pot.fridge.model.exception;

public class FridgeException extends Exception {

	private static final long serialVersionUID = 1L;

	public FridgeException() {
		super();
	}

	public FridgeException(String title, String msg) {
		super(title+", "+msg);
	}
	
	
}
