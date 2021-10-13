package com.mycompany.webapp.dto.order;

import java.util.Date;

import lombok.Data;

@Data
public class OrderListDTO {
	private String orderNo;
	private Date orderDate;
	private String orderDetailNo;
	private String productDetailNo;
	private String img1;
	private String brand;
	private String name;
	private String colorChip;
	private String psize;
	private int amount;
	private int price;
	private int state;
}
