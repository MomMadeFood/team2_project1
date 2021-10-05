package com.mycompany.webapp.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.product.ProductCategoryDTO;
import com.mycompany.webapp.dto.product.ProductColorDTO;
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
	 * 제품의 색상 종류를 조회
	 * @param id
	 * @return List<String> colors
	 */
	List<ProductColorDTO> selectColorChipByPid(String id);
	
	/**
	 * 제품 상세 조회
	 * @param productDetailNo, psize
	 * @return ProductDTO
	 */
	ProductDTO selectProductById(String productDetailNo);
	
	//	부모 카테고리 id로 해당하는 상품 번호 조회
	public List<ProductCategoryDTO> selectProductListByPCId(String parentCategoryId);
	
}

	