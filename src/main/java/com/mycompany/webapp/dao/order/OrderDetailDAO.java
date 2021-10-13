package com.mycompany.webapp.dao.order;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.PaymentDTO;
import com.mycompany.webapp.dto.order.OrderDetailDTO;

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
	 * 상세 주문 정보를 삽입
	 * @param orderDetailDTO
	 * @return 반영된 row 개수
	 */
	public int insertOrderDetail(OrderDetailDTO orderDetailDTO);
	
	/**
	 * 주문 번호로 모든 상세 주문 정보를 가져옴(orderNo)
	 * @param orderNo
	 * @return List<OrderDetailNo>
	 */
	
	public List<OrderDetailDTO> selectOrderDetailsById(String orderNo);
	
	
	/**
	 * orderDetail의 상태를 주문취소로 변경함
	 * @param orderDetailNo
	 * @return 반영된 row 수
	 */
	
	public int updateStateByOrderDetail(OrderDetailDTO orderDetailDTO);
	
	public int selectAllOrderDetailCount();

	public String selectCouponNoById(String orderDetailNo);
}
