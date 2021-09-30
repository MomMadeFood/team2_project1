package com.mycompany.webapp.dto;

import lombok.Data;

@Data
public class OrderDetail {
	private String orderDetailNo;
	private String orderNo;
	private String productDetailNo;
	private int amount;
	private int price;
	private int state;
}
