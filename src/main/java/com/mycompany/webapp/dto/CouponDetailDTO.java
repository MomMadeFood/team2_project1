package com.mycompany.webapp.dto;

import lombok.Data;

@Data
public class CouponDetailDTO {
	private String memberID;
	private String couponNo;
	private String orderDetailNo;
	private int state;
}
