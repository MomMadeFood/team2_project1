package com.mycompany.webapp.dto;

import lombok.Data;

@Data
public class Payment {
	private String paymentType;
	private String orderNo;
	private int price;
}
