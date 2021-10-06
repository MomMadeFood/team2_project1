package com.mycompany.webapp.dto;

import lombok.Data;

@Data
public class PaymentDTO {
	private String paymentType;
	private String orderNo;
	private int price;
	private String payAccount;
	private String company;
	private String installment;
}
