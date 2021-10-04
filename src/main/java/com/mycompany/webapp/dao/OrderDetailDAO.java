package com.mycompany.webapp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.OrderDetailDTO;
import com.mycompany.webapp.dto.OrderListDTO;
import com.mycompany.webapp.dto.PaymentDTO;

@Mapper
public interface OrderDetailDAO {
	
	/**
	 * 상세 주문 번호로 상세 주문정보를 모두 가져옴
	 * @param orderDetailNo
	 * @return 상세 주문정보
	 */
	public Map<String,Object> selectOrderDetailByOrderDetailNo(String orderDetailNo);
	
	/**
	 * 주문 번호로 결제정보를 가져옴(paymentType, price)
	 * @param orderNo
	 * @return paymentType, price
	 */
	public List<PaymentDTO> selectPaymentsByOrderNo(String orderNo);
	
	/**
	 * 
	 * @param 
	 * @return 
	 */
	public List<OrderListDTO> selectOrderListByMemberNo(Map<String, Object> param);
	
	
	/**
	 * 상세 주문 정보를 삽입
	 * @param orderDetailDTO
	 * @return 반영된 row 개수
	 */
	public int insertOrderDetail(OrderDetailDTO orderDetailDTO);
}
