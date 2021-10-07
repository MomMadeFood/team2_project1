package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.CouponDTO;
import com.mycompany.webapp.service.CouponService;

@Controller
@RequestMapping("/event")
public class EventController {
	
	@Resource
	private CouponService couponService;
	
	@RequestMapping("/coupon")
	public String coupon(Model model) {
		
		List<CouponDTO> brandCouponList = couponService.getCouponList(1); 
		model.addAttribute("brandCouponList", brandCouponList);
		
		List<CouponDTO> welcomeCouponList = couponService.getCouponList(2); 
		model.addAttribute("welcomeCouponList", welcomeCouponList);
		
		List<CouponDTO> eventCouponList = couponService.getCouponList(3); 
		model.addAttribute("eventCouponList", eventCouponList);
		return "event/coupon";
	}
}
