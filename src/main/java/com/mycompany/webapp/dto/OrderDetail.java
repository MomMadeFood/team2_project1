package com.mycompany.webapp.dto;

import lombok.Data;

@Data
public class OrderDetail {
	private String orderDetailNo;
	private String productDetailNo;
	private String psize;
	private String orderNo;
	private int amount;
	private int price;
	private int state;
}
