package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.StockDTO;

@Mapper
public interface StockDAO {
	
	/**
	 * 제품 번호로 상세 제품들의 재고를 조회 (상세 재고 번호, 색상, 사이즈, 재고량)
	 * @param productId
	 * @return PRODUCT_DETAIL_NO, COLOR, PSIZE, AMOUNT
	 */
	List<StockDTO> selectStocksByPid(String productNo);
	
	
	/**
	 * 상세 제품 번호로 재고를 조회 (사이즈, 재고량)
	 * @param produetDetailId
	 * @return PRODUCT_DETAIL_NO, COLOR, PSIZE, AMOUNT
	 */
	List<StockDTO> selectStocksByPdid(String productDetailNo);

}
