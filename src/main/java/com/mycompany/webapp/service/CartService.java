package com.mycompany.webapp.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.CartDAO;
import com.mycompany.webapp.dao.ProductDAO;
import com.mycompany.webapp.dao.StockDAO;
import com.mycompany.webapp.dto.CartDTO;
import com.mycompany.webapp.dto.StockDTO;
import com.mycompany.webapp.dto.product.ProductColorDTO;
import com.mycompany.webapp.dto.product.ProductDTO;

@Service
public class CartService {

	@Autowired private CartDAO cartDAO;
	@Autowired private ProductDAO productDAO;
	@Autowired private StockDAO stockDAO;
	
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
	
	public List<ProductDTO> getSelectedProducts(
		List<CartDTO> cartDTOs,
		List<String> selectedCodes) {
		Map<String, Integer> cartMap = new HashMap<String, Integer>();
		
		for(CartDTO c : cartDTOs) {
			//카트에 담긴 코드를 cart_ck 코드 형식으로 변환
			String psid = c.getProductDetailNo() + "_" + c.getPsize();
			cartMap.put(psid, c.getAmount());
		}
		
		//cartDTO를 orderForm으로 전송하기위해 ProductDTO로 파싱
		StringTokenizer st;
		List<ProductDTO> orderList = new ArrayList<ProductDTO>();
		
		//선택한 제품을 
		for(String s : selectedCodes) {
			
			int amount = cartMap.get(s);
			if(amount>0) {
				st = new StringTokenizer(s, "_");
				String pno = st.nextToken();
				String pcolor = st.nextToken();
				String psize = st.nextToken();
				
				//상품 상세 정보 불러오는 DAO 사용 예정
				ProductDTO productDTO = new ProductDTO();
				productDTO.setProductNo(pno);
				productDTO.setColorCode(pcolor);
				productDTO.setPsize(psize);				
				productDTO.setProductDetailNo(pno+"_"+pcolor);
				productDTO.setAmount(amount);
				
				orderList.add(productDTO);
			}//if
		}//for
		
		return orderList;
	}
	
	public void setCart(CartDTO cartDTO) {
		int amount = cartDAO.selectAmountByCart(cartDTO);
		
		if(amount > 0) {
			cartDTO.setAmount(cartDTO.getAmount()+amount);
			cartDAO.updateAmountByCart(cartDTO);
		} else {
			cartDAO.insertCart(cartDTO);
		}
	}
}
