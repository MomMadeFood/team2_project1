package com.mycompany.webapp.dao;

import org.apache.ibatis.annotations.Mapper;
import com.mycompany.webapp.dto.ProductDetailDTO;

@Mapper
public interface ProductDetailDAO {
	public ProductDetailDTO selectProductDetailById (String ProductNo);
}

