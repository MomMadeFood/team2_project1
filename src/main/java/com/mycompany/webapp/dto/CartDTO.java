package com.mycompany.webapp.dto;

import lombok.Data;

@Data
public class CartDTO {
	private String memberId;
	private String productDetailNo;
	private String psize;
	private int amount;
}
