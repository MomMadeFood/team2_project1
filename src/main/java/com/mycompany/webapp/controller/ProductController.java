package com.mycompany.webapp.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.TreeMap;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.mycompany.webapp.dto.CategoryDTO;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.product.ProductCategoryDTO;
import com.mycompany.webapp.dto.product.ProductDTO;
import com.mycompany.webapp.service.CartService;
import com.mycompany.webapp.service.CartService.CartResult;
import com.mycompany.webapp.service.CategoryService;
import com.mycompany.webapp.service.product.ProductDetailService;
import com.mycompany.webapp.service.product.ProductService;

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
	
	@Resource 
	private CategoryService categoryService;
	
	@RequestMapping("/productDetail")
	public String productDetail(HttpServletRequest request, HttpServletResponse response, String no, Model model) {
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
		
		List<ProductDTO> withProductList = productDetailService.getWithproductByPdId(no);
		model.addAttribute("withProductList", withProductList);
		
		Cookie[] cookies = request.getCookies();
		Map<String, String> cookieMap = new TreeMap<>();
		
		if(cookies.length==1) {
			Cookie cookie = new Cookie("rp"+(new Date().getTime()), no);
			cookie.setPath("/");
			cookie.setMaxAge(24*60*60); // 24*60*60 은 하루
			cookie.setHttpOnly(true); // java script에서 쿠키를 읽지 못하게 함
			response.addCookie(cookie);
		}else {
			// 쿠키에 있는 쿠키값들 cookieMap에 담기
			for(Cookie c : cookies) {
				String name = c.getName();
				if (!name.equals("JSESSIONID")) 
					cookieMap.put(c.getName(), c.getValue());
			}
			
			// 쿠키안에 있는 상품인지 확인 
			boolean chkCookie = false;
			String alreadyKey = "";
			for(Map.Entry e : cookieMap.entrySet()) {
				if(no.equals(e.getValue())) {
					chkCookie = true;
					alreadyKey = (String) e.getKey();
				}
			}

			Cookie cookie = new Cookie("rp"+(new Date().getTime()), no);
			cookie.setPath("/");
			cookie.setMaxAge(24*60*60); // 24*60*60 은 하루
			cookie.setHttpOnly(true);
			response.addCookie(cookie);
			
			if(!chkCookie) { // 존재하지 않는 쿠키
				// 쿠키가 3개보다 클 경우 삭제
				int cookieSize = cookieMap.size();
				while(cookieSize-- > 3) {
					String key = (String) cookieMap.keySet().toArray()[0];
					cookieMap.remove(key);
					Cookie deleteCookie = new Cookie(key, null);
					deleteCookie.setMaxAge(0);
					deleteCookie.setHttpOnly(true);
					deleteCookie.setPath("/");
					response.addCookie(deleteCookie);
				}
			}else { // 이미 존재하는 쿠키
				cookieMap.remove(alreadyKey);
				Cookie deleteCookie = new Cookie(alreadyKey, null);
				deleteCookie.setMaxAge(0);
				deleteCookie.setHttpOnly(true);
				deleteCookie.setPath("/");
				response.addCookie(deleteCookie);
			}
			
			List<ProductDTO> recentPd = new ArrayList<>();
			int cnt = 0;
			for(Map.Entry e : cookieMap.entrySet()) {
				if(cnt++ < 3)
					recentPd.add(productDetailService.getProductDetailByPdNo((String)e.getValue()));
			}
			Collections.reverse(recentPd);
			model.addAttribute("recentPd", recentPd);
		}
		
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
		
		Map<String, Object> param = new HashMap<>();
		param.put("startRowNo",pager.getStartRowNo());
		param.put("endRowNo", pager.getEndRowNo());
		param.put("categoryId", categoryId);
		
		List<ProductCategoryDTO> productList;
		if(categoryId.length() == 4) { // 중분류
			productList = productService.getProductList(param);
		}else { // 대분류
			productList = productService.getProductListBySex(param);
		}
		
		Map<String, List<String>> productColorMap = productService.getColorChip(productList);
		
		//subCategory
		List<CategoryDTO> subCategoryList = categoryService.getSubCategorys(categoryId);
		
		model.addAttribute("pager", pager);
		model.addAttribute("productList", productList);
		model.addAttribute("categoryId", categoryId);
		model.addAttribute("productColorMap", productColorMap);
		model.addAttribute("subCategoryList", subCategoryList);
		
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
			CartResult cr = cartService.setCart(cartDTO);
			if(cr == CartResult.FAIL_NOT_ENOUGH_STOCK) {
				jsonObject.put("result", "error-stock");
			} else if (cr == CartResult.SUCCESS_NOT_ENOUGH_STOCK) {
				jsonObject.put("result", "warn-stock");
				int amount = cartService.getAmountByCart(cartDTO);
				jsonObject.put("amount", amount);
			} else if (cr == CartResult.SUCCESS_ADD_AMOUNT){
				jsonObject.put("result", "warn-add");
				int amount = cartService.getAmountByCart(cartDTO);
				jsonObject.put("amount", amount);
			} else {
				jsonObject.put("result", "success");
			}
			
		}
		String json = jsonObject.toString();
		return json;
	}
}