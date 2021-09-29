package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/purchase")
public class purchaseController {
	
	@RequestMapping("/info")
	public String info() {
		return "purchase/purchaseInfo";
	}
	
	@RequestMapping("/confirm")
	public String confirm() {
		return "purchase/purchaseConfirm";
	}
	
	@RequestMapping("/orderList")
	public String orderList() {
		return "order/orderList";
	}
}
