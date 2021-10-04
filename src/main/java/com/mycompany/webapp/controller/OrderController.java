package com.mycompany.webapp.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.MOrderDTO;
import com.mycompany.webapp.dto.OrderDetailDTO;
import com.mycompany.webapp.dto.OrderListDTO;
import com.mycompany.webapp.dto.PaymentDTO;
import com.mycompany.webapp.dto.product.ProductDTO;
import com.mycompany.webapp.service.OrderService;
import com.mycompany.webapp.service.OrderService.OrderResult;


@Controller
@RequestMapping("/order")
public class OrderController {
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Resource
	private OrderService orderService;

	
	@RequestMapping("/orderForm")
	public String orderForm() {
		logger.info("실행");
	
		return "order/orderForm";
	}
	
	@RequestMapping("/orderDetail")
	public String orderDetail(Model model,String orderNo) {
		
		Map<String,Object> map = orderService.getMOrder(orderNo);
		/*
		MOrderDTO mOrderDTO = (MOrderDTO) map.get("mOrderDTO");
		ProductDTO productDTO = (ProductDTO) map.get("productDTO");
		OrderDetailDTO orderDetailDTO = (OrderDetailDTO) map.get("orderDetailDTO");
		List<PaymentDTO> paymentList = (List<PaymentDTO>)map.get("paymentList");
		
		model.addAttribute("mOrderDTO",mOrderDTO);
		model.addAttribute("productDTO",productDTO);
		model.addAttribute("orderDetailDTO",orderDetailDTO);
		model.addAttribute("paymentList",paymentList);

		logger.info(mOrderDTO.toString());
		logger.info(productDTO.toString());
		logger.info(orderDetailDTO.toString());
		
		for(PaymentDTO paymentDTO: paymentList) {
			logger.info(paymentDTO.toString());
		}
		*/
		
		System.out.println(((MOrderDTO)map.get("mOrderDTO")).toString());
		
		model.addAttribute("mOrderDTO",(MOrderDTO)map.get("mOrderDTO"));
		model.addAttribute("productList",map.get("productList"));
		return "order/orderDetail";
	}
	
	@RequestMapping("/orderList")
	public String orderList(Principal principal, String startDate, String endDate, Model model) {
		
		Map<String, Object> param = new HashMap<>();
		param.put("ID", principal.getName());
		param.put("startDate", startDate);
		param.put("endDate", endDate);
		if(startDate == null || endDate==null) {
			param.put("startDate", "1970-01-01");
			param.put("endDate", "2022-01-01");
		}
		
		List<OrderListDTO> tempOrderList = orderService.getOrderList(param);
		String temp = "";
		int cnt = -1;
		List<MOrderDTO> orderList =  new ArrayList<>();
		List<OrderDetailDTO> orderDetailList  = new ArrayList<>(); 
		
		for(OrderListDTO order : tempOrderList) {
			if(!temp.equals(order.getOrderNo())) {
				if(cnt!=-1) {
					orderList.get(cnt).setDetailList(orderDetailList);
					orderDetailList  = new ArrayList<>(); 
				}
				cnt++;
				temp = order.getOrderNo();
				orderList.add(new MOrderDTO());
				orderList.get(cnt).setOrderNo(order.getOrderNo());
				orderList.get(cnt).setOrderDate(order.getOrderDate());
			}
			OrderDetailDTO orderDetail = new OrderDetailDTO();
			orderDetail.setProductDetailNo(order.getProductDetailNo());
			orderDetail.setImg1(order.getImg1());
			orderDetail.setBrand(order.getBrand());
			orderDetail.setName(order.getName());
			orderDetail.setColorChip(order.getColorChip());
			orderDetail.setPsize(order.getPsize());
			orderDetail.setAmount(order.getAmount());
			orderDetail.setPrice(order.getPrice());
			orderDetail.setState(order.getState());
			orderDetailList.add(orderDetail);
		}
		if(cnt!=-1) {
			orderList.get(cnt).setDetailList(orderDetailList);
		}
		System.out.println(orderList);
		model.addAttribute("orderList", orderList);
		return "order/orderList";
	}
	
	@PostMapping(value="/orderFormProc",produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String orderFormProc(MOrderDTO mOrderDTO) {
		OrderResult orderResult = orderService.insertMOrder(mOrderDTO);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		String json = jsonObject.toString();
		
		return json;
	}
}
