package com.mycompany.webapp.dto;

import lombok.Data;

@Data
public class StockDTO {
	//Stock
	private String productDetailNo;
	private String psize;
	private int amount;
	
	//product Info
	private String productNo;
	private String color;
	private String colorChip;
	private String img1;
	
}
