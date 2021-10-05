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

import com.google.gson.Gson;
import com.mycompany.webapp.dto.CardDTO;
import com.mycompany.webapp.dto.MOrderDTO;
import com.mycompany.webapp.dto.MemberDTO;
import com.mycompany.webapp.dto.OrderDetailDTO;
import com.mycompany.webapp.dto.OrderListDTO;
import com.mycompany.webapp.dto.PaymentDTO;
import com.mycompany.webapp.dto.VirtureAccountDTO;
import com.mycompany.webapp.dto.product.ProductDTO;
import com.mycompany.webapp.service.CardService;
import com.mycompany.webapp.service.MemberService;
import com.mycompany.webapp.service.OrderService;
import com.mycompany.webapp.service.OrderService.OrderResult;


@Controller
@RequestMapping("/order")
public class OrderController {
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Resource
	private OrderService orderService;
	
	@Resource
	private MemberService memberService;
	
	@Resource
	private CardService cardService;

	
	@RequestMapping("/orderForm")
	public String orderForm(Principal principal,Model model) {
		logger.info("실행");
		Map<String,Object> map = memberService.getMemberInfo(principal.getName());
		MemberDTO memberDTO = (MemberDTO)map.get("memberDTO");
		List<CardDTO> cardList = (List<CardDTO>)map.get("cardList");
		List<VirtureAccountDTO> virtureAccountList = (List<VirtureAccountDTO>)map.get("virtureAccountList");
		
		
		model.addAttribute("memberDTO",memberDTO);
		model.addAttribute("cardList",cardList);
		model.addAttribute("virtureAccountList",virtureAccountList);

		for(CardDTO cardDTO :cardList) {
			System.out.println(cardDTO.getCardNo());
		}

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
	public String orderList(Principal principal, Model model) {
		
		Map<String, Object> param = new HashMap<>();
		param.put("ID", principal.getName());
		param.put("startDate", "1970-01-01");
		param.put("endDate", "2999-01-01");
		
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
	
	@ResponseBody
	@RequestMapping(value="/orderListAjax", produces="application/json; charset=utf-8")
	public String orderListAjax(String startDate, String endDate, int searchType, String searchTerm, Principal principal, Model model) {
		System.out.println(startDate);
		System.out.println(endDate);
		System.out.println(searchType);
		System.out.println(searchTerm);
		
		Map<String, Object> param = new HashMap<>();
		param.put("ID", principal.getName());
		if(startDate == null && endDate==null || startDate.equals("")  && endDate.equals("")) {
			param.put("startDate", "1970-01-01");
			param.put("endDate", "2999-01-01");
		}else {
			param.put("startDate", startDate);
			param.put("endDate", endDate);
		}
		
		
		List<OrderListDTO> tempOrderList = null;
		
		if (searchTerm.trim().isEmpty() || searchTerm == null ) {
			tempOrderList = orderService.getOrderList(param);
		}
		else{
			if(searchType==0) {
				param.put("name", searchTerm);
				tempOrderList = orderService.getOrderListByName(param);
			}else if(searchType==1) {
				param.put("orderNo", searchTerm);
				tempOrderList = orderService.getOrderListByOderNo(param);
			}
		}
		
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
		
		Gson gson = new Gson();
		String json = gson.toJson(orderList);
		return json;
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
