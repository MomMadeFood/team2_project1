package com.mycompany.webapp.exception;

public class CouponException extends RuntimeException{
	
	public CouponException() {
		
	}
	public CouponException(String message) {
		super(message);
	}
}