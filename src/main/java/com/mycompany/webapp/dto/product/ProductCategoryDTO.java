package com.mycompany.webapp.dto.product;

import lombok.Data;

@Data
public class ProductCategoryDTO {
	private String productNo; 
	private String productDetailNo;
	private String categoryId; 
	private String parentCategoryId;
	private String brand;
	private String name;
	private String img1;
	private String img3;
	private String colorChip;
	private int price;
}
