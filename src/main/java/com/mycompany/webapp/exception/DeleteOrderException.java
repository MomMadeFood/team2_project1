package com.mycompany.webapp.exception;

public class DeleteOrderException extends RuntimeException{
	
	public DeleteOrderException() {
		
	}
	
	public DeleteOrderException(String message) {
		super(message);
	}
}
