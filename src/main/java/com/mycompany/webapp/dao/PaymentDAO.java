package com.mycompany.webapp.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.PaymentDTO;

@Mapper
public interface PaymentDAO {
	
	/**
	 * 결제 정보를 삽입함
	 * @param PaymentDTO
	 * @return 반영된 row 개수
	 */
	public int insertPayment(PaymentDTO paymentDTO);
}
