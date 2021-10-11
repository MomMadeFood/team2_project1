package com.mycompany.webapp.controller;

import java.security.Principal;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

import javax.annotation.Resource;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JsonNode;
import com.mycompany.webapp.dto.CouponDTO;
import com.mycompany.webapp.service.CouponService;
import com.mycompany.webapp.service.CouponService.CouponResult;
import com.mycompany.webapp.service.RequestService;

@Controller
@RequestMapping("/event")
public class EventController {
	Logger logger = LoggerFactory.getLogger(EventController.class);
	private ExecutorService executorService = Executors.newFixedThreadPool(1);
	
	@Resource
	private CouponService couponService;
	
	private static int eventCouponIssueCount = 1;
	
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
        }
        return jsonObject.toString();
    } 
	
	
	

	@PostMapping(value = "/issueEventCoupon", produces="application/json; charset=UTF-8")
	public @ResponseBody String issueEventCoupon(String couponNo, Principal principal) throws Exception {
		Callable<Integer> task = new Callable<Integer>() {
			@Override
			public Integer call() throws Exception {
				// 시간 측정 코드(o)
				// Service 객체 호출 코드
				logger.info(Thread.currentThread().getName() + ": 이벤트 처리");
				logger.info(eventCouponIssueCount + "번째 접근");
				if (eventCouponIssueCount > 2) {
					return 1;
				} else {
					JsonNode resultNode = couponService.issueEventCoupon(couponNo, principal.getName());
					System.out.println(resultNode.get("data"));
					System.out.println(resultNode.get("data").get("result"));
					String result = resultNode.get("data").get("result").toString();
					if(result.equals("\"success\"")) {
						eventCouponIssueCount++;
						return 0;
					}else {
						return 2;
					}
					
				}
			}
		};
		Future<Integer> future = executorService.submit(task);
		logger.info(Thread.currentThread().getName() + ": 큐에 작업을 저장");

		// 이벤트 처리가 완료될 때까지 대기
		int result = future.get();
		JSONObject jsonObject = new JSONObject();
		if (result == 0) {
			jsonObject.put("result", "success");
		} else {
			if(result==1)
				jsonObject.put("message", "이미 종료된 이벤트입니다.");
			else if(result==2)
				jsonObject.put("message", "이미 발급된 쿠폰입니다.");
			jsonObject.put("result", "fail");
		}

		return jsonObject.toString();
	}
}
