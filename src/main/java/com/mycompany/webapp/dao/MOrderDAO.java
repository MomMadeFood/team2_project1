package com.mycompany.webapp.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.MOrderDTO;

@Mapper
public interface MOrderDAO {

	/**
	 * 주문 정보를 삽입함
	 * @param MOrderDTO
	 * @return 반영된 row 개수
	 */
	public int insertMOrder(MOrderDTO mOrderDTO);
}
