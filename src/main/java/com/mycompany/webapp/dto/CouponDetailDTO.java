package com.mycompany.webapp.dto;

import java.util.Date;

import lombok.Data;

@Data
public class CouponDetailDTO {
	private String memberId;
	private String couponNo;
	private Date issueDate;
	private Date expireDate;
	private Date useDate;
	private int state;
}
