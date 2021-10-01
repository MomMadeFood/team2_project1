package com.mycompany.webapp.dao;

import org.apache.ibatis.annotations.Mapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mycompany.webapp.controller.OrderController;
import com.mycompany.webapp.dto.OrderDetailDTO;

@Mapper
public interface OrderDetailDao {
	
	public OrderDetailDTO selectOrderDetailByOrderDetailNo(String orderDetailNo);
}
