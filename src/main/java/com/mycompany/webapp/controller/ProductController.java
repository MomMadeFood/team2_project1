package com.mycompany.webapp.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.product.ProductDTO;
import com.mycompany.webapp.dto.product.ProductDetailInfo;
import com.mycompany.webapp.service.ProductDetailService;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Resource
	private ProductDetailService productDetailService;
	
	
	
	
	@RequestMapping("/productDetail")
	public String productDetail(String no, Model model) {
		String no1 = no;
		no1 = no1.substring(0,no1.length()-3);
		
		List<ProductDTO> productDetailList = productDetailService.getProductDetail(no1);
		List<ProductDTO> productSizePriceList = productDetailService.getProductDetailCol(no1);
		
		//"YS2B9WPC002WZO_BR"
		ProductDTO productDetail = new ProductDTO();
		for(ProductDTO temp : productDetailList) {
			if(temp.getProductDetailNo().equals(no)) {
				model.addAttribute("productDetail", temp);
				System.out.println(temp);
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
		
		System.out.println(sizeList.toString());
		
	
		return "product/productDetail";
		}
}
