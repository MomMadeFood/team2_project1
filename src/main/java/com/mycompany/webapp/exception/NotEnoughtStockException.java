package com.mycompany.webapp.exception;

public class NotEnoughtStockException extends RuntimeException{
	
	public NotEnoughtStockException() {
		
	}
	
	public NotEnoughtStockException(String message) {
		super(message);
	}
}
