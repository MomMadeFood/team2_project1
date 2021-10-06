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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.CartDTO;
import com.mycompany.webapp.dto.Pager;
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
		public String productList(@RequestParam String categoryId, @RequestParam(defaultValue="1") int pageNo, Model model) {
			Pager pager= null;
			if(categoryId.length() == 4) {
				int totalRows = productService.getTotalProductList(categoryId);   
				pager = new Pager(12, 5, totalRows, pageNo);
			}else {
				int totalRows = productService.getTotalProductListBySex(categoryId);  
				pager = new Pager(12, 5, totalRows, pageNo);
			}
			
			model.addAttribute("pager", pager);
			
			Map<String, Object> param = new HashMap<>();
			param.put("startRowNo",pager.getStartRowNo());
			param.put("endRowNo", pager.getEndRowNo());
			param.put("categoryId", categoryId);
			
			
			List<ProductCategoryDTO> productList;
			if(categoryId.length() == 4) {
				productList = productService.getProductList(param);
			}else {
				productList = productService.getProductListBySex(param);
			}
			
			model.addAttribute("productList", productList);
			
			Map<String, List<String>> productColorMap = new HashMap<>();
			for(ProductCategoryDTO product : productList) {
				param.put("productNo", product.getProductNo());
				param.put("categoryId", categoryId);
				List<ProductCategoryDTO> productColorList = productService.getColorChip(param);
				for(ProductCategoryDTO productColor : productColorList) {
					if(!productColorMap.containsKey(productColor.getProductNo())) {
						List<String> colorList = new ArrayList<>();
						colorList.add(productColor.getColorChip());
						productColorMap.put(productColor.getProductNo(), colorList);
					}else {
						productColorMap.get(productColor.getProductNo()).add(productColor.getColorChip());
					}
				}
				
			}
			model.addAttribute("categoryId", categoryId);
			model.addAttribute("productColorMap", productColorMap);
			
			return "product/productList";
		}

		@Secured("ROLE_USER")
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
			JSONObject jsonObject = new JSONObject();
			
			if(principal == null) {
				jsonObject.put("result", "errer-login");
			} else {
				String loginId = principal.getName();
				cartDTO.setMemberId(loginId);
				cartService.setCart(cartDTO);
				jsonObject.put("result", "success");
			}
			String json = jsonObject.toString();
			return json;
		}
		
	}