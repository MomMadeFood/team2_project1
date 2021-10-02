package com.mycompany.webapp.dto;

import lombok.Data;

@Data
public class ProductDTO {
	//Product
	private String productNo;
	private String name;
	private int price;
	private String content;
	private String brand;
	
	//Product_Detail
	private String productDetailNo;
	private String withProduct;
	private String img1;
	private String img2;
	private String img3;
	private String colorCode;
	private String colorChip;
}
