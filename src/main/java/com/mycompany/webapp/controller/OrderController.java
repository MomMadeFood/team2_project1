package com.mycompany.webapp.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.OrderDetailDTO;
import com.mycompany.webapp.service.OrderConfirmService;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	private static Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Resource
	private OrderConfirmService orderConfirmService;
	
	@RequestMapping("/orderForm")
	public String orderForm() {
		return "order/orderForm";
	}
	
	@RequestMapping("/orderConfirm")
	public String confirm() {
		String orderDetailNo = "ABC123DEF456";
		logger.info("실행");
		OrderDetailDTO orderDetail = orderConfirmService.getOrderDetail(orderDetailNo);
		logger.info("orderNo"+" "+orderDetail.getOrderNo());
		logger.info("productDetail"+" "+orderDetail.getProductDetailNo());
		logger.info("price"+" "+orderDetail.getPrice());
		
		return "order/orderConfirm";
	}
	
	@RequestMapping("/orderList")
	public String orderList() {
		return "order/orderList";
	}
}
