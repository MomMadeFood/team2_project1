package com.mycompany.webapp.dto;

import lombok.Data;

@Data
public class CategoryDTO {
	private String categoryId;
	private String parentCategoryId;
	private String categoryPath;
	private String categoryName;
	private String productNo;
}
