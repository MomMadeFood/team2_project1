package com.mycompany.webapp.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.CartDTO;
import com.mycompany.webapp.dto.product.ProductCategoryDTO;
import com.mycompany.webapp.dto.product.ProductDTO;
import com.mycompany.webapp.service.CartService;
import com.mycompany.webapp.service.ProductDetailService;
import com.mycompany.webapp.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {
	Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Resource
	private ProductDetailService productDetailService;
	
	@Resource 
	private CartService cartService;
	
	@Resource
	private ProductService productService;
	
	@RequestMapping("/productDetail")
	public String productDetail(String no, Model model) {
		String no1 = no;
		no1 = no1.substring(0,no1.length()-3);
		
		List<ProductDTO> productDetailList = productDetailService.getProductDetail(no1);
		List<ProductDTO> productSizePriceList = productDetailService.getProductDetailCol(no1);
		
		for(ProductDTO temp : productDetailList) {
			if(temp.getProductDetailNo().equals(no)) {
				model.addAttribute("productDetail", temp);
				break; 
			}
		}

		Map<String, String> productDetailMap = new HashMap<String,String>();
		
		for(ProductDTO product : productSizePriceList) {
			productDetailMap.put(product.getProductDetailNo(), product.getColorChip());
		}
		model.addAttribute("productDetailMap", productDetailMap);
		
		Set<String> sizeSet = new HashSet<>();
		for(ProductDTO product : productSizePriceList) {
			if(product.getProductDetailNo().equals(no))
				sizeSet.add(product.getPsize());
		}
		Object[] sizeList = sizeSet.toArray();
		model.addAttribute("sizeList", sizeList);
			return "product/productDetail";
		}
	
		@RequestMapping("/productList")
		public String productList(Model model) {
			
			List<ProductCategoryDTO> productList = productService.getProductList("WO01");
			
			model.addAttribute("productList", productList);

			Map<String, List<String>> productColorMap = new HashMap<>();
			
			for(ProductCategoryDTO product : productList) {
				if(!productColorMap.containsKey(product.getProductNo())) {
					List<String> colorList = new ArrayList<>();
					colorList.add(product.getColorChip());
					productColorMap.put(product.getProductNo(), colorList);
				}else {
					productColorMap.get(product.getProductNo()).add(product.getColorChip());
				}
			}
			model.addAttribute("productColorMap", productColorMap);
			
			System.out.println(productList);
			
			return "product/productList";
		}
		
		@Secured({"ROLE_USER"})
		@RequestMapping("/cart")
		public String cart(
				HttpServletRequest request,
				Principal principal,
				CartDTO cartDTO
				) {
			cartDTO.setMemberId(principal.getName());
			
			cartService.setCart(cartDTO);
			
			return "redirect:/cart";
		}
		
		@PostMapping(value="/putCart", produces="application/json; charset=UTF-8")
		@ResponseBody
		public String updateAmount(
				@RequestBody CartDTO cartDTO,
				Principal principal) {
			logger.info("실행");
			
			cartDTO.setMemberId(principal.getName());
			logger.info(cartDTO.toString());
			
			cartService.setCart(cartDTO);
			
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", "success");
			String json = jsonObject.toString();
			return json;
		}

		
	}