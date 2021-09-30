package com.mycompany.webapp.dto;

import lombok.Data;

@Data
public class Coupon {
	private String couponNo;
	private int totalAmount;
	private int remainAmount;
	private String title;
	private String content;
	private String type;
	private int discount;
	private int validity;
}
