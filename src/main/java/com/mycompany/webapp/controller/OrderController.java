package com.mycompany.webapp.controller;

import java.security.Principal;
import java.util.HashMap;
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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.CardDTO;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.PaymentDTO;
import com.mycompany.webapp.dto.VirtureAccountDTO;
import com.mycompany.webapp.dto.coupon.CouponDTO;
import com.mycompany.webapp.dto.member.MemberDTO;
import com.mycompany.webapp.dto.order.MOrderDTO;
import com.mycompany.webapp.dto.order.OrderDetailDTO;
import com.mycompany.webapp.dto.product.ProductDTO;
import com.mycompany.webapp.service.coupon.CouponService;
import com.mycompany.webapp.service.member.MemberService;
import com.mycompany.webapp.service.order.OrderService;


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
		int pointSum = (int) map.get("pointSum");
		int couponSum = (int) map.get("couponSum");
		int priceTotal = (int) map.get("priceTotal");
		
		
		model.addAttribute("mOrderDTO",(MOrderDTO)map.get("mOrderDTO"));
		model.addAttribute("productList",map.get("productList"));
		model.addAttribute("pointSum",pointSum);
		model.addAttribute("couponSum",couponSum);
		model.addAttribute("priceTotal",priceTotal);
		model.addAttribute("paymentList",(List<PaymentDTO>)map.get("paymentList"));
		
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
		
		List<MOrderDTO> orderList = orderService.getOrderList(param);
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("pager", pager);
		return "order/orderList";
	}
	
	@GetMapping("/orderListAjax")
	public String orderListAjax(@RequestParam(defaultValue="1") int pageno, String startDate, String endDate, int searchType, String searchTerm, Principal principal, Model model) {		
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
		List<MOrderDTO> orderList = null;
		if (searchTerm.trim().isEmpty() || searchTerm == null ) { // 날짜로만 필터한 경우
			int totalRows = orderService.getCntOrderList(param);
			pager = new Pager(5, 5, totalRows, pageno);
			param.put("startRowNo", pager.getStartRowNo());
			param.put("endRowNo", pager.getEndRowNo());
			orderList = orderService.getOrderList(param);
		}
		else{
			if(searchType==0) {
				param.put("name", searchTerm);
				int totalRows = orderService.getCntOrderListByName(param);
				pager = new Pager(5, 5, totalRows, pageno);
				param.put("startRowNo", pager.getStartRowNo());
				param.put("endRowNo", pager.getEndRowNo());
				orderList = orderService.getOrderListByName(param);
			}else if(searchType==1) {
				param.put("orderNo", searchTerm);
				int totalRows = orderService.getCntOrderListByOrderNo(param);
				pager = new Pager(5, 5, totalRows, pageno);
				param.put("startRowNo", pager.getStartRowNo());
				param.put("endRowNo", pager.getEndRowNo());
				orderList = orderService.getOrderListByOrderNo(param);
			}
		}
		model.addAttribute("orderList", orderList);
		model.addAttribute("pager", pager);
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
	public String oneClickAjax(MemberDTO memberDTO) {
		int result = memberService.checkOneClickPassword(memberDTO);
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

	
	
	@PostMapping(value="/cancelOrderAjax",produces="application/json; charset=UTF-8")
	@ResponseBody
	public String cancelOrderAjax(Principal principal,OrderDetailDTO orderDetailDTO) {
		
		logger.info(orderDetailDTO.toString());
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("memberId",principal.getName());
		map.put("orderDetailDTO",orderDetailDTO);
		Map<String,String> resultMap = orderService.deleteOrderDetail(map);
    
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result",resultMap.get("result"));
		jsonObject.put("message",resultMap.get("message"));
		
		String json = jsonObject.toString();
		return json;
	}

	@GetMapping("/couponPopup")
	public String couponPopup(int price, String brand, String usedCoupon, Principal principal, Model model,int index) {
		Map<String, Object> param = new HashMap<>();
		param.put("memberId", principal.getName());
		
		// 사용한 쿠폰 저장
		Map<String,Boolean> usedCouponMap = new HashMap<>();
		String[] tempUsedCouponList = usedCoupon.split("C");
		for(String coupon : tempUsedCouponList) {
			usedCouponMap.put("C"+coupon, true);
		}
		
		List<CouponDTO> couponList = couponService.getAvaliableCouponList(param, price, brand, usedCouponMap);

		model.addAttribute("couponList", couponList);
		model.addAttribute("index", index);
		
		return "order/couponPopup";
	}
	
	@GetMapping("/genPassword")
	public String genPassword(String memberId,String password) {
		System.out.println(memberId+" "+password);
		String result = memberService.genCardPassword(memberId, password);
		return result;
	}
	
}
