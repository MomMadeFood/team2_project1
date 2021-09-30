package com.mycompany.webapp.dto;

import lombok.Data;

@Data
public class Cart {
	private int amount;
	private String productDetailNo;
	private String memberId;
}
