package com.mycompany.webapp.dto.coupon;

import java.util.Date;

import lombok.Data;

@Data
public class CouponDTO implements Comparable<CouponDTO>{
	//Coupon
	private String couponNo;
	private int couponType;
	private int totalAmount;
	private int remainAmount;
	private String title;
	private String content;
	private String discountType;
	private int discount;
	private String img;
	private Date issueDate;
	private Date expireDate;
	private int validity;
	private int totalDiscountPrice;
	//Coupon_Detail
	private String memberId;
	private Date useDate;
	private int state;
	
	
	@Override
	public int compareTo(CouponDTO o) {
		return o.totalDiscountPrice - this.totalDiscountPrice;
	}
}
