package com.mycompany.webapp.dto;

import java.util.Date;

import lombok.Data;

@Data
public class CouponDTO {
	//Coupon
	private String couponNo;
	private int totalAmount;
	private int remainAmount;
	private String title;
	private String content;
	private String type;
	private int discount;
	private String img;
	private Date issueDate;
	private Date expireDate;
	private int validity;
	//Coupon_Detail
	private String memberId;
	private Date useDate;
	private int state;
}
