package com.mycompany.webapp.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.mycompany.webapp.dto.CardDTO;
import com.mycompany.webapp.dto.CouponDTO;
import com.mycompany.webapp.dto.MOrderDTO;
import com.mycompany.webapp.dto.MemberDTO;
import com.mycompany.webapp.dto.OrderDetailDTO;
import com.mycompany.webapp.dto.OrderListDTO;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.VirtureAccountDTO;
import com.mycompany.webapp.dto.product.ProductDTO;
import com.mycompany.webapp.security.UserDetail;
import com.mycompany.webapp.service.CardService;
import com.mycompany.webapp.service.CouponService;
import com.mycompany.webapp.service.MemberService;
import com.mycompany.webapp.service.OrderService;
import com.mycompany.webapp.service.OrderService.OrderResult;
import com.sun.xml.internal.ws.policy.privateutil.PolicyUtils.Collections;


@Controller
@RequestMapping("/order")
public class OrderController {
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	private ExecutorService executorService = Executors.newFixedThreadPool(1);
	
	@Resource
	private OrderService orderService;
	
	@Resource
	private MemberService memberService;
	
	@Resource
	private CardService cardService;
	
	@Resource
	private CouponService couponService;

	
	@RequestMapping("/orderForm")
	public String orderForm(Principal principal,Model model,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		List<ProductDTO> orderList = (List<ProductDTO>) session.getAttribute("orderList");
		int totalPrice = 0;
		
		
		
		Map<String,Object> map = memberService.getMemberOrderInfo(principal.getName(),orderList);
		MemberDTO memberDTO = (MemberDTO) map.get("memberDTO");
		List<CardDTO> cardList = (List<CardDTO>)map.get("cardList");
		List<VirtureAccountDTO> virtureAccountList = (List<VirtureAccountDTO>)map.get("virtureAccountList");
		List<ProductDTO> productList = (List<ProductDTO>)map.get("productList");
		
		
		for(int i = 0; i < productList.size(); i++) {
			productList.get(i).setPsize(orderList.get(i).getPsize());
			productList.get(i).setAmount(orderList.get(i).getAmount());
			productList.get(i).setPrice(productList.get(i).getPrice()*orderList.get(i).getAmount());
			totalPrice += productList.get(i).getPrice();
		}
		
		
		model.addAttribute("memberDTO",memberDTO);
		model.addAttribute("cardList",cardList);
		model.addAttribute("virtureAccountList",virtureAccountList);
		model.addAttribute("productList",productList);
		model.addAttribute("totalPrice",totalPrice);

		return "order/orderForm";
	}
	
	@RequestMapping("/orderDetail")
	public String orderDetail(Model model,String orderNo) {
		
		Map<String,Object> map = orderService.getMOrder(orderNo);
		System.out.println(((MOrderDTO)map.get("mOrderDTO")).toString());
		
		model.addAttribute("mOrderDTO",(MOrderDTO)map.get("mOrderDTO"));
		model.addAttribute("productList",map.get("productList"));
		
		return "order/orderDetail";
	}
	
	@GetMapping("/orderList")
	public String orderList(@RequestParam(defaultValue="1") int pageno, Principal principal, Model model) {
		
		Map<String, Object> param = new HashMap<>();
		param.put("ID", principal.getName());
		param.put("startDate", "1970-01-01");
		param.put("endDate", "2999-01-01");
		
		int totalRows = orderService.getCntOrderList(param);
		Pager pager = new Pager(5, 5, totalRows, pageno);
		param.put("startRowNo", pager.getStartRowNo());
		param.put("endRowNo", pager.getEndRowNo());
		
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
		model.addAttribute("orderList", orderList);
		model.addAttribute("pager", pager);
		
		return "order/orderList";
	}
	
	@GetMapping("/orderListAjax")
	public String orderListAjax(@RequestParam(defaultValue="1") int pageno, String startDate, String endDate, int searchType, String searchTerm, Principal principal, Model model) {
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
		
		Pager pager = null;
		List<OrderListDTO> tempOrderList = null;
		if (searchTerm.trim().isEmpty() || searchTerm == null ) { // 날짜로만 필터한 경우
			int totalRows = orderService.getCntOrderList(param);
			pager = new Pager(5, 5, totalRows, pageno);
			param.put("startRowNo", pager.getStartRowNo());
			param.put("endRowNo", pager.getEndRowNo());
			tempOrderList = orderService.getOrderList(param);
		}
		else{
			if(searchType==0) {
				param.put("name", searchTerm);
				int totalRows = orderService.getCntOrderListByName(param);
				pager = new Pager(5, 5, totalRows, pageno);
				param.put("startRowNo", pager.getStartRowNo());
				param.put("endRowNo", pager.getEndRowNo());
				tempOrderList = orderService.getOrderListByName(param);
			}else if(searchType==1) {
				param.put("orderNo", searchTerm);
				int totalRows = orderService.getCntOrderListByOrderNo(param);
				System.out.println(">>>>>>>>>>>>>>>>" + totalRows);
				pager = new Pager(5, 5, totalRows, pageno);
				param.put("startRowNo", pager.getStartRowNo());
				param.put("endRowNo", pager.getEndRowNo());
				tempOrderList = orderService.getOrderListByOrderNo(param);
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

		model.addAttribute("orderList", orderList);
		model.addAttribute("pager", pager);
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchTerm", searchTerm);
		return "order/orderListAjax";
	}

	@PostMapping(value="/orderFormAjax",produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String orderFormAjax(MOrderDTO mOrderDTO) throws InterruptedException, ExecutionException {
		
		
		
		Callable< Map<String,String> > task = new Callable<Map<String,String>>() {
			@Override
			public Map<String,String> call() throws Exception {

				Map<String,String> resultMap = orderService.insertMOrder(mOrderDTO);
				
				return resultMap;
			}
		};
		
		Future< Map<String,String> > future = executorService.submit(task);
		Map<String,String> resultMap = future.get();
		
		JSONObject jsonObject = new JSONObject();
		
		if(resultMap.get("result").equals("success")) {
			jsonObject.put("result", resultMap.get("result"));
			jsonObject.put("orderNo", resultMap.get("orderNo"));
		}else if(resultMap.get("result").equals("fail")) {
			jsonObject.put("result", resultMap.get("result"));
		}else {
			jsonObject.put("result", resultMap.get("result"));
			jsonObject.put("productName", resultMap.get("productName"));
		}
		
		String json = jsonObject.toString();
		return json;
	}
	
	@PostMapping(value="/oneClickAjax", produces= "application/json; charset=UTF-8")
	@ResponseBody
	public String oneClickAjax(CardDTO cardDTO) {
		int result = cardService.checkOneClickPassword(cardDTO);
		logger.info("result: "+result);
		JSONObject jsonObject = new JSONObject();
		if(result==1) {
			jsonObject.put("result","success");
		}else {
			jsonObject.put("result","fail");
		}
		
		String json = jsonObject.toString();
		return json;
		
	}
	
	
	@GetMapping("/couponPopup")
	public String couponPopup(int price, String brand, Principal principal, Model model) {
		System.out.println(">>>>>>>>>>>>>>>>>" + brand);
		Map<String, Object> param = new HashMap<>();
		param.put("memberId", principal.getName());
		param.put("price", price);
		
		List<CouponDTO> tempCouponList = couponService.getAvaliableCouponList(param);
		
		List<CouponDTO> couponList = new ArrayList<>();
		
		for(CouponDTO coupon : tempCouponList) {
			if(coupon.getCouponType() == 1) { // 브랜드 쿠폰인 경우
				if(coupon.getTitle().equals(brand)) {
					couponList.add(coupon);
					continue;
				}
			}else {
				couponList.add(coupon);
			}
		}
		Iterator<CouponDTO> iterator = couponList.iterator(); 
		while(iterator.hasNext()) {
			CouponDTO coupon = iterator.next();
			if(coupon.getDiscountType().equals("1")) { // 할인타입이 %인 경우
				coupon.setTotalDiscountPrice((int) (price*((double)coupon.getDiscount()/100)));
			}else { // 할인 타입이 원인 경우
				coupon.setTotalDiscountPrice(coupon.getDiscount()*10000);
			}
		}
		java.util.Collections.sort(couponList);
		
		for(CouponDTO coupon : couponList) {
			System.out.println(">>>>>>>>>>>>>>>>>" + coupon.getTitle() + " "+coupon.getTotalDiscountPrice());
		}
		model.addAttribute("couponList", couponList);
		return "order/couponPopup";
	}
}
