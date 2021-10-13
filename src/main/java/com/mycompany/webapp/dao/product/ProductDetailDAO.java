package com.mycompany.webapp.dao.product;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.product.ProductDTO;

@Mapper
public interface ProductDetailDAO {
	// 제품 색상별 이미지, 브랜드명, 상품명, 가격, 상품 소개, 색상, 사이즈, 수량
	public List<ProductDTO> selectProductDetailById (String productNo);
	
	public List<ProductDTO> selectPdColSizeById (String productNo);
	
	public String selectOneImgByPdId (String productDetailNo);
	
	public ProductDTO selectProductDetailByPdNo (String productDetailNo);
}