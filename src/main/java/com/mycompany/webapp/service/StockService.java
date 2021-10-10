package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.StockDAO;
import com.mycompany.webapp.dto.CartDTO;
import com.mycompany.webapp.dto.StockDTO;
import com.mycompany.webapp.dto.product.ProductDTO;
import com.mycompany.webapp.service.CartService.CartResult;

@Service
public class StockService {
	@Resource
	private StockDAO stockDAO;
	
	public enum StockResult {
		SUCCESS,
		FAIL_NOT_ENOUGH_STOCK
	}
	
	public List<StockDTO> getStocksByPid(String productId) {
		return stockDAO.selectStocksByPid(productId);
	}
	
	public List<StockDTO> getStocksByPdid(String productDetailId) {
		return stockDAO.selectStocksByPdid(productDetailId);
	}
	
	
	public int getAmount(Object object) {
		 if(object instanceof ProductDTO) {
			return stockDAO.selectAmountByProduct((ProductDTO)object);
		} else if(object instanceof CartDTO) {
			return stockDAO.selectAmountByCart((CartDTO)object);
		} else {
			return stockDAO.selectAmountByStock((StockDTO)object);
		}
	}
	
	public StockResult checkSoldOutByCart(List<CartDTO> cartDTOList) {
		for(CartDTO cartDTO : cartDTOList) {
			if(stockDAO.selectAmountByCart(cartDTO) <= 0) {
				return StockResult.FAIL_NOT_ENOUGH_STOCK;
			}
		}
		return StockResult.SUCCESS;
	}


}
