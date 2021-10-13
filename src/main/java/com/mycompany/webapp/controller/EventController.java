package com.mycompany.webapp.controller;

import java.security.Principal;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.coupon.CouponDTO;
import com.mycompany.webapp.service.coupon.CouponService;
import com.mycompany.webapp.service.coupon.CouponService.CouponResult;

@Controller
@RequestMapping("/event")
public class EventController {
	Logger logger = LoggerFactory.getLogger(EventController.class);
	private ExecutorService executorService = Executors.newFixedThreadPool(1);
	
	@Resource
	private CouponService couponService;
	
	@RequestMapping("/coupon")
	public String coupon(Model model, HttpServletRequest request) {
		
		List<CouponDTO> brandCouponList = couponService.getCouponList(1); 
		model.addAttribute("brandCouponList", brandCouponList);
		
		List<CouponDTO> welcomeCouponList = couponService.getCouponList(2); 
		model.addAttribute("welcomeCouponList", welcomeCouponList);
		
		List<CouponDTO> eventCouponList = couponService.getCouponList(3); 
		model.addAttribute("eventCouponList", eventCouponList);
		
		return "event/coupon";
	}
	
	
	@PostMapping(value="/issueCoupon", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String issueCoupon(
			String couponNo, 
			Principal principal) throws Exception {
		JSONObject jsonObject = new JSONObject();
		CouponDTO couponDTO = new CouponDTO();
		if(principal == null) {
			jsonObject.put("result", "error-login");
		} else {
			couponDTO.setMemberId(principal.getName());
			couponDTO.setCouponNo(couponNo);
			logger.info(couponDTO.toString());
		}
		
		Callable<CouponResult> task = new Callable<CouponResult>() {
			@Override
			public CouponResult call() throws Exception {
				CouponResult cr = couponService.issueCoupon(couponDTO);
				
				return cr;
			}
		};
		
		Future< CouponResult > future = executorService.submit(task);
		CouponResult result = future.get();
	      
        if(result == CouponResult.FAIL_DUPLICATE) {
        	jsonObject.put("result", "error-duplicate");
        } else if(result == CouponResult.FAIl_END_EVENT) {
        	jsonObject.put("result", "error-end");
        } else if(result == CouponResult.FAIL_NOT_ENOUGH_COUPON) {
        	jsonObject.put("result", "error-stock");
        } else if(result == CouponResult.SUCCESS) {
        	jsonObject.put("result", "success");
        } else if(result == CouponResult.SUCCESS_EXPIRE) {
        	jsonObject.put("result", "success-expire");
        } else if(result == CouponResult.FAIL_QUALIFICATION) {
        	jsonObject.put("result", "error-qualification");
        }
        return jsonObject.toString();
    } 
}
