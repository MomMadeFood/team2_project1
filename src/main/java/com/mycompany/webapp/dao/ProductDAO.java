package com.mycompany.webapp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.product.ProductDTO;
import com.mycompany.webapp.dto.product.ProductNewDTO;

@Mapper
public interface ProductDAO {
	
	public List<ProductNewDTO> selectNewProductBySex(String sex);
	
	public List<ProductNewDTO> selectBestProductBySex(String sex);
	/**
	 * 제품의 색상 종류를 조회
	 * @param id
	 * @return List<String> colors
	 */
	List<String> selectColorsByPid(String id);
	

	
	/**
	 * 제품 상세 조회
	 * @param productDetailNo, psize
	 * @return ProductDTO
	 */
	ProductDTO selectProductById(String productDetailNo);
	
}

	