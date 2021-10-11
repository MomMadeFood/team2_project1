package com.mycompany.webapp.dao;

import java.util.List;

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
	
	/**
	 * 모든 결제정보를 가져옴
	 * @param orderNo
	 * @return List<PaymentDTO>
	 */
	public List<PaymentDTO> selectPaymentsById(String orderNo);

}
