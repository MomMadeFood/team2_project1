package com.mycompany.webapp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.product.ProductNewDTO;
import com.mycompany.webapp.service.coupon.CouponService;
import com.mycompany.webapp.service.product.ProductService;

@Controller
public class HomeController {
	
	private static Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Resource
	private ProductService productService;
	
	@Resource
	private CouponService couponService;
	
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
	
	@RequestMapping(value="/issueEventCoupon", method = RequestMethod.POST, produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody Map<String, Object> issueEventCoupon(@RequestBody Map<String, Object> reqParam){
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String,String> data = couponService.issueCoupon((String)reqParam.get("memberId"), (String)reqParam.get("couponNo"));

		String result ="";
		if(data.get("result").equals("success")) {
			result = "쿠폰발급 성공";
		}else {
			result = "이미 발급된 쿠폰입니다.";
		}
		logger.info("사용자 ID: "+reqParam.get("memberId")+", 결과 : "+data.get("result").toString());
		map.put("data",data);
	    return map;
	}
}
