package com.mycompany.webapp.dto;

import java.util.Date;

import lombok.Data;

@Data
public class MOrder {
	private String orderNo;
	private String memberId;
	private Date orderDate;
	private int priceTotal;
	private int priceDiscount;
	private int state;
	private String request;
	private String addr;
	private String detailAddr;
	private String zipCode;
	private String tel;
	private String phone;
}