package com.mycompany.webapp.controller;

import java.security.Principal;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.ProductDTO;
import com.mycompany.webapp.service.CartService;

@Controller
@RequestMapping("/cart")
public class CartController {
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@Autowired
	private CartService cartService;
	
	@RequestMapping("")
	public String cart(
			Principal principal,
			Model model) {
		logger.info("실행");
		
		List<ProductDTO> cartList = cartService.getCarts(principal.getName());
		
		model.addAttribute("cartList", cartList);
		return "cart/cart";
	}
}  