package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@RequestMapping("/productDetail")
	public String productDetail() {
		return "product/productDetail";
	}
}
