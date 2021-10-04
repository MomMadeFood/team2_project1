package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.product.ProductDTO;

@Mapper
public interface CartDAO {
	/**
	 * member가 장바구니에 담은 상품 목록에 대한 정보를 조회
	 * @param id
	 * @return 상품번호, 상품 이름, 브랜드, 가격, 상품상세번호, 색상, 사진, 사이즈, 담은 수량
	 */
	List<ProductDTO> selectCartsById(String id);
}
