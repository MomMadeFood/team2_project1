package com.mycompany.webapp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mycompany.webapp.dto.OrderListDTO;
import com.mycompany.webapp.dto.PaymentDTO;

@Mapper
public interface OrderDetailDAO {
	
	public Map<String,Object> selectOrderDetailByOrderDetailNo(String orderDetailNo);
	
	public List<PaymentDTO> selectPaymentsByOrderNo(String orderNo);
	
	public List<OrderListDTO> selectOrderListByMemberNo(Map<String, Object> param);
}
