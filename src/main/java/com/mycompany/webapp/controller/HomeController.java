package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.product.ProductNewDTO;
import com.mycompany.webapp.service.ProductService;

@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Resource
	private ProductService productService;
	
	@RequestMapping("/")
	public String content(Model model) {
		
		List<ProductNewDTO> newWomenProductList = productService.getNewProdudct("WO");
		model.addAttribute("newWomenProductList", newWomenProductList);
		
		List<ProductNewDTO> newMenProductList = productService.getNewProdudct("ME");
		model.addAttribute("newMenProductList", newMenProductList);
		
		System.out.println(newMenProductList);
		
		return "home";
	}
	
	@RequestMapping("/error/403")
	public String error403() {
		return "error/403";
	}
}  
