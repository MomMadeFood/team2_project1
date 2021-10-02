package com.mycompany.webapp.dto;

import lombok.Data;

@Data
public class StockDTO {
	private String productNo;
	private String productDetailNo;
	private String color;
	private String psize;
	private int amount;
}
