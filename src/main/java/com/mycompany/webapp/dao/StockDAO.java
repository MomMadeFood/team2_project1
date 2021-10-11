package com.mycompany.webapp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.CartDTO;
import com.mycompany.webapp.dto.StockDTO;
import com.mycompany.webapp.dto.order.OrderDetailDTO;
import com.mycompany.webapp.dto.product.ProductDTO;

@Mapper
public interface StockDAO {
	
	/**
	 * 제품 번호로 상세 제품들의 재고를 조회 (상세 재고 번호, 색상, 사이즈, 재고량)
	 * @param productId
	 * @return PRODUCT_DETAIL_NO, COLOR, PSIZE, AMOUNT
	 */
	List<StockDTO> selectStocksByPid(String productNo);
	
	
	/**
	 * 상세 제품 번호로 재고량를 조회 (사이즈, 재고량)
	 * @param produetDetailId
	 * @return PRODUCT_DETAIL_NO, COLOR, PSIZE, AMOUNT
	 */
	List<StockDTO> selectStocksByPdid(String productDetailNo);
	
	/**
	 * 상세 재품 번호로 사이즈들 정보와 재고유무만 조회 (재고량 조회 X)
	 * @param produetDetailId
	 * @return PSIZE, IS_STOCK(STOCKED, SOLDOUT)
	 */
	List<Map<String, String>> selectSizeIsStockedByPdid(String productDetailNo);
	
	
	/**
	 * 상세 제품 번호로 사이즈 정보로 재고가 있으면 재고를 줄임
	 * @param produetDetailId, size
	 * @return 반영된 row 개수
	 */
	int updateStockByODIdSize(OrderDetailDTO orderDetailDTO);
	
	/**
	 * STOCK 객체로 재고량을 조회
	 * @param stockDTO (상세제품번호, 사이즈)
	 * @return amount
	 */
	int selectAmountByStock(StockDTO stockDTO);
	
	/**
	 * PRODUCT 객체로 재고량을 조회
	 * @param productDTO
	 * @return amount
	 */
	int selectAmountByProduct(ProductDTO productDTO);
	
	/**
	 * CART 객체로 재고량을 조회
	 * @param cartDTO
	 * @return amount
	 */
	int selectAmountByCart(CartDTO cartDTO);
	
	/**
	 * Cart 객체로 재고량을 조회
	 * @param productDTO
	 * @return amount
	 */
	int selectAmountByProduct(CartDTO cartDTO);
	
	
	/**
	 * STOCK 객체로 재고량 수정
	 * @param stockDTO (상세제품번호, 사이즈, 재고량)
	 * @return 반영된 row수
	 */
	int updateAmountByStock(StockDTO stockDTO);

}
