package com.mycompany.webapp.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.CartDTO;
import com.mycompany.webapp.dto.StockDTO;
import com.mycompany.webapp.dto.product.ProductColorDTO;
import com.mycompany.webapp.dto.product.ProductDTO;
import com.mycompany.webapp.service.CartService;
import com.mycompany.webapp.service.CartService.CartResult;
import com.mycompany.webapp.service.StockService;
import com.mycompany.webapp.service.StockService.StockResult;
import com.mycompany.webapp.service.product.ProductDetailService;

@Controller
@RequestMapping("/cart")
public class CartController {
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@Resource private CartService cartService;
	@Resource private ProductDetailService productDetailService;
	@Resource private StockService stockService;
	
	@RequestMapping("")
	public String cart(
			Principal principal,
			Model model) {
		logger.info("실행");
		
		List<ProductDTO> cartList = cartService.getCarts(principal.getName());
		int totalPrice = 0;
		for(ProductDTO p : cartList) {
			totalPrice += p.getAmount() * p.getPrice();
		}
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("cartList", cartList);
		return "cart/cart";
	}
	
	@PostMapping("/orderForm") 
	public String orderForm(
			Principal principal,
			HttpServletRequest request,
			@RequestParam("cart_ck") List<String> cartSelectedList ){
		List<CartDTO> selectedCartList;
		//cartSelectedList : 카트에서 선택한 제품들의 코드, 
		//			코드 형식 : 제품상세번호_사이즈 (ex. TN2B7WSHG03N_BL_S)
		
		selectedCartList= cartService.getCartsByPdsid(principal.getName(), cartSelectedList);
		//매진 상품 확인
		StockResult st = stockService.checkStockByCart(selectedCartList);
		if(st == StockResult.FAIL_SOLDOUT) {
			return "cart/soldout";
		} else if(st == StockResult.FAIL_NOT_ENOUGH_STOCK) {
			return "cart/stock";
		} else {
			//ProductList로 변경
			List<ProductDTO> orderList = new ArrayList<ProductDTO>();
			for(CartDTO cartDTO : selectedCartList) {
				ProductDTO productDTO = cartService.convertToProductDTO(cartDTO);
				
				orderList.add(productDTO);
			}
			HttpSession session = request.getSession();
			session.setAttribute("orderList", orderList);
			session.setAttribute("orderFormAccessRoot", "cart");
			
			return "redirect:/order/orderForm";
		}
	}
	
	
	@RequestMapping(value="/optionColor", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String cartOptionColor(String pno) {
		List<ProductColorDTO> colorList = cartService.getCartOptionColor(pno);
		
		JSONObject result = new JSONObject();
		result.put("colorList", colorList);
		
		return result.toString();
	}
	
	
	@RequestMapping(value="/optionSizePdno", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String cartOptionSize(String pdno) {
		JSONObject result = new JSONObject();
		
		List<StockDTO> sizeList = cartService.getCartOptionSize(pdno);
		result.put("sizeList", sizeList);
		
		String img = productDetailService.getOneImgByPdId(pdno);
		result.put("img", img);
		
		return result.toString();
	}
	
	
	@RequestMapping(value="/optionSizePno", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String cartOptionSize(String pno, String color) {
		JSONObject result = new JSONObject();
		
		List<StockDTO> sizeList = cartService.getCartOptionSize(pno, color);
		result.put("sizeList", sizeList);
		
		String img = productDetailService.getOneImgByPdId(pno+"_"+color);
		result.put("img", img);
		
		return result.toString();
	}
	
	
	@PostMapping(value="/deleteOneCart",  produces="application/json; charset=UTF-8")
	@ResponseBody
	public String deleteOneCart(
			String pdno, String size,
			Principal principal) {
		JSONObject jsonObject = new JSONObject();
		if(principal == null) {
			jsonObject.put("result", "errer-login");
		} else {
			CartDTO cartDTO = new CartDTO();
			cartDTO.setProductDetailNo(pdno);
			cartDTO.setPsize(size);
			cartDTO.setMemberId(principal.getName());
			cartService.deleteCart(cartDTO);
			
			
			jsonObject.put("result", "success");
		}
		String json = jsonObject.toString();
		return json;
	}
	
	
	@PostMapping(value="/deleteCarts",  produces="application/json; charset=UTF-8")
	@ResponseBody
	public String deleteCarts(
			@RequestBody List<CartDTO> cartList,
			Principal principal) {
		JSONObject jsonObject = new JSONObject();
		if(principal == null) {
			jsonObject.put("result", "errer-login");
		} else {
			for(CartDTO cart : cartList) {
				cart.setMemberId(principal.getName());
				cartService.deleteCart(cart);
			}
			jsonObject.put("result", "success");
		}
		String json = jsonObject.toString();
		return json;
	}
	
	
	@PostMapping(value="/updateCart", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String updateCart(
			@RequestBody CartDTO cartDTO,
			Principal principal) {
		JSONObject jsonObject = new JSONObject();
		if(principal == null) {
			jsonObject.put("result", "errer-login");
		} else {
			cartDTO.setMemberId(principal.getName());
			StringTokenizer st = new StringTokenizer(cartDTO.getNewProductDetailNo(),"_");
			String productNo = st.nextToken();
			String colorCode = st.nextToken();
			
			logger.info(cartDTO.toString());

			CartResult cr = cartService.updateCart(cartDTO);
			
			if(cr == CartResult.SUCCESS_NOT_ENOUGH_STOCK) {
				CartDTO newCartDTO = new CartDTO();
				newCartDTO.setMemberId(cartDTO.getMemberId());
				newCartDTO.setProductDetailNo(cartDTO.getNewProductDetailNo());
				newCartDTO.setPsize(cartDTO.getNewPsize());
				int amount = cartService.getAmountByCart(newCartDTO);
				jsonObject.put("result", "warn-stock");
				jsonObject.put("amount", amount);
				jsonObject.put("psize", cartDTO.getNewPsize());
				jsonObject.put("productDetailNo", cartDTO.getNewProductDetailNo());
				jsonObject.put("colorCode", colorCode);
				jsonObject.put("productNo", productNo);
			} else if(cr == CartResult.FAIL_DUPLICATE) {
				jsonObject.put("result", "error-duplicate");
			} else if(cr ==CartResult.FAIL_SAME_VALUE){
				jsonObject.put("result", "error-same");
			} else if(cr == CartResult.FAIL_NOT_ENOUGH_STOCK) {
				jsonObject.put("result", "error-stock");
			} else {
				jsonObject.put("result", "success");
				jsonObject.put("psize", cartDTO.getNewPsize());
				jsonObject.put("productDetailNo", cartDTO.getNewProductDetailNo());
				jsonObject.put("colorCode", colorCode);
				jsonObject.put("productNo", productNo);
			}
		}
		String json = jsonObject.toString();
		return json;
	}
	
	@PostMapping(value="/updateAmount", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String updateAmount(
			@RequestBody CartDTO cartDTO,
			Principal principal) {
		JSONObject jsonObject = new JSONObject();
		if(principal == null) {
			jsonObject.put("result", "errer-login");
		} else {
			cartDTO.setMemberId(principal.getName());
			logger.info(cartDTO.toString());
			
			CartResult cr = cartService.updateAmount(cartDTO);
			if(cr== CartResult.SUCCESS_NOT_ENOUGH_STOCK) {
				jsonObject.put("result", "warn-stock");
				logger.info(cartDTO.toString());
				int amount = cartService.getAmountByCart(cartDTO);
				jsonObject.put("amount", amount);
			} else if(cr == CartResult.FAIL_NOT_ENOUGH_STOCK) {
				jsonObject.put("result", "error-stock");
			} else {
				jsonObject.put("result", "success");
				jsonObject.put("amount", cartDTO.getAmount());
			}
		}
		String json = jsonObject.toString();
		return json;
	}

}  