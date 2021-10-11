package com.mycompany.webapp.dao.order;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.order.MOrderDTO;
import com.mycompany.webapp.dto.order.OrderListDTO;

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
	public List<OrderListDTO> selectOrderListByMemberId(Map<String, Object> param);
	
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
	 * 멤버 아이디로 해당 회원의 주문량을 조회함
	 */
	public int selectOrderCountByMid(String memberId);
}
