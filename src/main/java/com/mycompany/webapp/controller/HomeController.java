package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.product.ProductNewDTO;
import com.mycompany.webapp.service.product.ProductService;

@Controller
public class HomeController {

	@Resource
	private ProductService productService;

	@RequestMapping("/")
	public String content(Model model) {

		List<ProductNewDTO> newWomenProductList = productService.getNewProdudct("WO");
		model.addAttribute("newWomenProductList", newWomenProductList);

		List<ProductNewDTO> newMenProductList = productService.getNewProdudct("ME");
		model.addAttribute("newMenProductList", newMenProductList);

		List<ProductNewDTO> bestMenProductList = productService.getBestProdudct("ME");
		model.addAttribute("bestMenProductList", bestMenProductList);

		List<ProductNewDTO> bestWomenProductList = productService.getBestProdudct("WO");
		model.addAttribute("bestWomenProductList", bestWomenProductList);

		return "home";
	}

	@RequestMapping("/error/403")
	public String error403() {
		return "error/403";
	}
}
