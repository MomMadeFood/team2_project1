package com.mycompany.webapp.service;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.CartDAO;
import com.mycompany.webapp.dao.StockDAO;
import com.mycompany.webapp.dao.product.ProductDAO;
import com.mycompany.webapp.dto.CartDTO;
import com.mycompany.webapp.dto.StockDTO;
import com.mycompany.webapp.dto.product.ProductColorDTO;
import com.mycompany.webapp.dto.product.ProductDTO;

@Service
public class CartService {
	Logger logger = LoggerFactory.getLogger(CartService.class);
	
	public enum CartResult{
		SUCCESS,
		FAIL,
		FAIL_DUPLICATE,
		SUCCESS_NOT_ENOUGH_STOCK,
		FAIL_NOT_ENOUGH_STOCK,
		FAIL_SAME_VALUE,
		SUCCESS_ADD_AMOUNT
	}

	@Resource private CartDAO cartDAO;
	@Resource private ProductDAO productDAO;
	@Resource private StockDAO stockDAO;
	
	public List<ProductDTO> getCarts(String mid) {
		List<ProductDTO> carts = cartDAO.selectCartsById(mid);
		return carts;
	}
	
	public List<ProductColorDTO> getCartOptionColor(String pid) {
		return productDAO.selectColorChipByPid(pid);
	}
	
	
	public List<StockDTO> getCartOptionSize(String pid, String colorCode) {
		String pdId = pid + "_" + colorCode;
		return stockDAO.selectStocksByPdid(pdId);
	}
	
	public List<StockDTO> getCartOptionSize(String pdId) {
		return stockDAO.selectStocksByPdid(pdId);
	}
	
	//PdsIdList로 Cart객체 얻기
	public List<CartDTO> getCartsByPdsid(
		String mid,
		List<String> pdsidList) {
		List<CartDTO> cartList = new ArrayList<CartDTO>();
		StringTokenizer st;
		
		for(String pdsid : pdsidList) {
			st = new StringTokenizer(pdsid, "_");
			CartDTO cartDTO = new CartDTO();
			cartDTO.setMemberId(mid);
			String pdid = st.nextToken() + "_" + st.nextToken();
			cartDTO.setProductDetailNo(pdid);
			cartDTO.setPsize(st.nextToken());
			cartDTO.setAmount(cartDAO.selectAmountByCart(cartDTO));
			
			//cartDTO로 변환
			cartList.add(cartDTO);
		}
		return cartList;
	}
	
	
	
	public CartResult setCart(CartDTO cartDTO) {
		StockDTO stockDTO = new StockDTO();
		stockDTO.setProductDetailNo(cartDTO.getProductDetailNo());
		stockDTO.setPsize(cartDTO.getPsize());
		int stock = stockDAO.selectAmountByStock(stockDTO);
		if(stock <= 0) {
			return CartResult.FAIL_NOT_ENOUGH_STOCK;
		} else {
			int amount = cartDAO.selectAmountByCart(cartDTO);
			if(amount > 0) {
				//이미 담긴 상품
				int sum = cartDTO.getAmount()+amount;
				if(sum>stock) {
					cartDTO.setAmount(stock);
					cartDAO.updateAmountByCart(cartDTO);
					return CartResult.SUCCESS_NOT_ENOUGH_STOCK;
				} else {
					cartDTO.setAmount(sum);
					cartDAO.updateAmountByCart(cartDTO);
					return CartResult.SUCCESS_ADD_AMOUNT;
				}
			} else {
				//새로 담는 상품
				if(cartDTO.getAmount()>stock) {
					cartDTO.setAmount(stock);
					cartDAO.insertCart(cartDTO);
					return CartResult.SUCCESS_NOT_ENOUGH_STOCK;
				} else {
					cartDAO.insertCart(cartDTO);
					return CartResult.SUCCESS;
				}
			}
		}
	}
	
	
	public void deleteCart(CartDTO cartDTO) {
		cartDAO.deleteCart(cartDTO);
	}
	
	public CartResult updateCart(CartDTO cartDTO) {
		logger.info("실행 : "+ cartDTO.toString());
		if( cartDTO.getProductDetailNo().equals( cartDTO.getNewProductDetailNo())
				&& cartDTO.getPsize().equals(cartDTO.getNewPsize()) ) {
			return CartResult.FAIL_SAME_VALUE;
		}
		//변경할 상품이 이미 카트에 존재하는지 확인
		CartDTO newCart = new CartDTO();
		newCart.setMemberId(cartDTO.getMemberId());
		newCart.setProductDetailNo(cartDTO.getNewProductDetailNo());
		newCart.setPsize(cartDTO.getNewPsize());
		int newCartAmount = cartDAO.selectAmountByCart(newCart);
		if(newCartAmount>0) {
			return CartResult.FAIL_DUPLICATE;
		}
		//재고량 확인
		StockDTO stockDTO = new StockDTO();
		stockDTO.setProductDetailNo(cartDTO.getNewProductDetailNo());
		stockDTO.setPsize(cartDTO.getNewPsize());
		int stock = stockDAO.selectAmountByStock(stockDTO);
		if(stock <= 0) {
			return CartResult.FAIL_NOT_ENOUGH_STOCK;
		}
		int amount = cartDTO.getAmount();
		logger.info("UPDATE:" + stockDTO.toString());
		if(stock < amount) {
			cartDTO.setAmount(stock);
			cartDAO.updateCart(cartDTO);
			logger.info("UPDATED:" + stockDTO.toString());
			return CartResult.SUCCESS_NOT_ENOUGH_STOCK;
		}
		cartDAO.updateCart(cartDTO);
		return CartResult.SUCCESS;
		
	}

	public CartResult updateAmount(CartDTO cartDTO) {
		//재고량 비교
		StockDTO stockDTO = new StockDTO();
		stockDTO.setProductDetailNo(cartDTO.getProductDetailNo());
		stockDTO.setPsize(cartDTO.getPsize());
		int stock = stockDAO.selectAmountByStock(stockDTO);
		if(stock <= 0) {
			return CartResult.FAIL_NOT_ENOUGH_STOCK;
		}
		logger.info("재고 수량" + stock);
		logger.info("장바구니에 넣고 싶은 수량 : " + cartDTO.getAmount());
		if(stock < cartDTO.getAmount()) {
			cartDTO.setAmount(stock);
			cartDAO.updateAmountByCart(cartDTO);
			return CartResult.SUCCESS_NOT_ENOUGH_STOCK;
		}
		cartDAO.updateAmountByCart(cartDTO);
		return CartResult.SUCCESS;
	}

	public int getAmountByCart(CartDTO cartDTO) {
		return cartDAO.selectAmountByCart(cartDTO);
	}
	
	public ProductDTO convertToProductDTO (CartDTO cartDTO) {
		StringTokenizer st = new StringTokenizer(cartDTO.getProductDetailNo(), "_");
		String pno = st.nextToken();
		String pcolor = st.nextToken();
		
		ProductDTO productDTO = new ProductDTO();
		
		productDTO.setAmount(cartDTO.getAmount());
		productDTO.setProductDetailNo(cartDTO.getProductDetailNo());
		productDTO.setPsize(cartDTO.getPsize());
		productDTO.setColorCode(pcolor);
		productDTO.setProductNo(pno);
		
		return productDTO;
	}
}
