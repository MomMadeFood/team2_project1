package com.mycompany.webapp.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mycompany.webapp.dto.CartDTO;
import com.mycompany.webapp.dto.product.ProductDTO;
import com.mycompany.webapp.service.CartService;

@Controller
@RequestMapping("/cart")
public class CartController {
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@Autowired
	private CartService cartService;
	
	@RequestMapping("")
	public String cart(
			Principal principal,
			Model model) {
		logger.info("실행");
		
		List<ProductDTO> cartList = cartService.getCarts(principal.getName());
		
		model.addAttribute("cartList", cartList);
		return "cart/cart";
	}
	
	@PostMapping("/orderForm") 
	public String orderForm(
			RedirectAttributes rttr,
			HttpServletRequest request,
			@RequestParam("cart_ck") List<String> cart_ck,
			CartDTO cartDTO
			){
			
		//cart_ck : 카트에서 선택한 제품들의 코드, 
		//			코드 형식 : 제품상세번호_사이즈 (ex. TN2B7WSHG03N_BL_S)
		
		//cartDTO : 카트에 담긴 제품들의 List, 담긴 수량 정보
		
		logger.info("선택제품 : " + cart_ck.toString());
		logger.info("카트제품 : " + cartDTO.getCartDTOList().toString());
		
		List<ProductDTO> orderList = cartService.getSelectedProducts(cartDTO.getCartDTOList(), cart_ck);
		
		logger.info("주문제품 : " + orderList.toString());
		
		//주문폼 접근 경로
	
		
		HttpSession session = request.getSession();
		session.setAttribute("orderList", orderList);
		rttr.addFlashAttribute("orderFormAccessRoot", "cart");
		
		return "redirect:/order/orderForm";
	}
	
	@RequestMapping(value="/optionColor", produces="aplication/json; charset=UTF-8")
	@ResponseBody
	public String cartOptionColor(String pno) {
		logger.info(cartService.getCartOptionColor("TN2B7WSHG03N").toString());
		logger.info(pno);
		List<String> colorList = cartService.getCartOptionColor(pno);
		
		JSONObject result = new JSONObject();
		result.put("colorList", colorList);
		
		return result.toString();
	}
	
	
	@RequestMapping(value="/optionSize", produces="aplication/json; charset=UTF-8")
	@ResponseBody
	public String cartOptionSize(String pno, String pcolor) {
		logger.info(cartService.getCartOptionSize("TN2B7WSHG03N", "BL").toString());
		logger.info(pno + " / " + pcolor);
		
		List<Map<String,String>> sizeList = cartService.getCartOptionSize(pno, pcolor);
		
		JSONObject result = new JSONObject();
		result.put("sizeList", sizeList);
		
		return result.toString();
	}
	

}  