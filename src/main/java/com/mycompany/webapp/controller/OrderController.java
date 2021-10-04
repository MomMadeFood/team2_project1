package com.mycompany.webapp.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mycompany.webapp.dto.MOrderDTO;
import com.mycompany.webapp.dto.OrderDetailDTO;
import com.mycompany.webapp.dto.PaymentDTO;
import com.mycompany.webapp.dto.product.ProductDTO;
import com.mycompany.webapp.service.OrderService;


@Controller
@RequestMapping("/order")
public class OrderController {
	
	private static Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Resource
	private OrderService orderService;

	
	@RequestMapping("/orderForm")
	public String orderForm(
			RedirectAttributes rttr,
			HttpServletRequest request,
			HttpServletResponse response
			) {
		logger.info("실행");
	
		return "order/orderForm";
	}
	
	@RequestMapping("/orderDetail")
	public String confirm(Model model) {
		
		String orderDetailNo = "ABC123DEF456";
		
		Map<String,Object> map = orderService.getOrderDetail(orderDetailNo);
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
		
		return "order/orderDetail";
	}
	
	@RequestMapping("/orderList")
	public String orderList() {
		return "order/orderList";
	}
}
