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
	 * 멤버 아이디와 날짜로 주문정보 개수를 가져옴
	 * @param memberId, startDate, endDate
	 * @return 주문 정보
	 */
	public int selectCountOrderList(Map<String, Object> param);
	
	/**
	 * 멤버 아이디와 날짜로 주문정보를 가져옴
	 * @param memberId, startDate, endDate
	 * @return 주문 정보
	 */
	public List<OrderListDTO> selectOrderListByMemberNo(Map<String, Object> param);
	
	/**
	 * 멤버 아이디와 날짜로 주문정보 개수를 가져옴
	 * @param memberId, startDate, endDate, name
	 * @return 주문 정보
	 */
	public int selectCountOrderListByName(Map<String, Object> param);

  /**
	 * 멤버 아이디, 날짜, 상품명  주문정보를 가져옴
	 * @param memberId, startDate, endDate, name
	 * @return 주문 정보
	 */
	public List<OrderListDTO> selectOrderListByName(Map<String, Object> param);
	
	/**
	 * 멤버 아이디와 날짜로 주문정보 개수를 가져옴
	 * @param memberId, startDate, endDate, orderNO
	 * @return 주문 정보
	 */
	public int selectCountOrderListByOrderNo(Map<String, Object> param);

	
  /**
	 * 멤버 아이디, 날짜, 주문번호 주문정보를 가져옴
	 * @param memberId, startDate, endDate, orderNo
	 * @return 주문 정보
	 */
	public List<OrderListDTO> selectOrderListByOrderNo(Map<String, Object> param);
	
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
