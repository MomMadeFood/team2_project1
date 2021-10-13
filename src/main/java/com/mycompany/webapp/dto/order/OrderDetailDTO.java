package com.mycompany.webapp.dto.order;

import lombok.Data;

@Data
public class OrderDetailDTO {
	private String orderDetailNo;
	private String orderNo;
	private String productDetailNo;
	private String img1;
	private String brand;
	private String name;
	private String colorChip;
	private String psize;
	private int amount;
	private int price;
	private int point;
	private int discount;
	private int state;
	private String couponNo;
}
