package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.product.ProductNewDTO;

@Mapper
public interface ProductDAO {
	public List<ProductNewDTO> selectNewProductBySex(String sex);
}
