package com.mycompany.webapp.service;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;


import com.mycompany.webapp.dao.OrderDetailDao;
import com.mycompany.webapp.dto.OrderDetailDTO;

@Service
public class OrderConfirmService {

	private static Logger logger = LoggerFactory.getLogger(OrderConfirmService.class);
	
	@Resource
	private OrderDetailDao orderDetailDao;
	
	public OrderDetailDTO getOrderDetail(String orderDetailNo) {
		logger.info("실행");
		return orderDetailDao.selectOrderDetailByOrderDetailNo(orderDetailNo);
	}
}
