package com.mycompany.webapp.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.ProductDTO;

@Mapper
public interface ProductDetailDAO {
	public ProductDTO selectProductDetailById (String ProductNo);
}

