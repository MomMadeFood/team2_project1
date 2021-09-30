package com.mycompany.webapp.dto;

import lombok.Data;

@Data
public class Category {
	private String categoryId;
	private String parentCategoryId;
	private String categoryName;
}
