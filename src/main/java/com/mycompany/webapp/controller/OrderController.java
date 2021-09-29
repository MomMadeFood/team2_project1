package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@RequestMapping("/orderForm")
	public String orderForm() {
		return "order/orderForm";
	}
	
	@RequestMapping("/orderConfirm")
	public String confirm() {
		return "order/orderConfirm";
	}
	
	@RequestMapping("/orderList")
	public String orderList() {
		return "order/orderList";
	}
}
