package com.mycompany.webapp.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.product.ProductDTO;
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

	
	@RequestMapping(value="/optionColor", produces="aplication/json; charset=UTF-8")
	@ResponseBody
	public String cartOptionColor(String pno) {
		logger.info(cartService.getCartOptionColor("TN2B7WSHG03N").toString());
		logger.info(pno);
		List<String> colorList = cartService.getCartOptionColor(pno);
		
		JSONObject result = new JSONObject();
		result.put("colorList", colorList);
		
		return result.toString();
	}
	
	
	@RequestMapping(value="/optionSize", produces="aplication/json; charset=UTF-8")
	@ResponseBody
	public String cartOptionSize(String pno, String pcolor) {
		logger.info(cartService.getCartOptionSize("TN2B7WSHG03N", "BL").toString());
		logger.info(pno + " / " + pcolor);
		
		List<Map<String,String>> sizeList = cartService.getCartOptionSize(pno, pcolor);
		
		JSONObject result = new JSONObject();
		result.put("sizeList", sizeList);
		
		return result.toString();
	}
	

}  