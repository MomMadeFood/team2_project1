package com.mycompany.webapp.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.MOrderDTO;

@Mapper
public interface MOrderDAO {

	/**
	 * 주문 정보를 조회함
	 * @param orderNo
	 * @return MOrderDTO
	 */
	public MOrderDTO selectMOrderById(String orderNo);
	
	/**
	 * 주문 정보를 삽입함
	 * @param MOrderDTO
	 * @return 반영된 행 개수
	 */
	public int insertMOrder(MOrderDTO mOrderDTO);
	
	
	/**
	 * 총 주문량을 조회함
	 * @param void
	 * @return count(*)
	 */
	public int selectMOrderCount();
}
