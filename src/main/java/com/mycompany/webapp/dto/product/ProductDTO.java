package com.mycompany.webapp.dto.product;

import java.util.List;

import lombok.Data;

@Data
public class ProductDTO {
	private String productNo;
	private String name;
	private int price;
	private String content;
	private String brand;
	private List<ProductDetailDTO> list;
}
