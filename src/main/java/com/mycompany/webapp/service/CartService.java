package com.mycompany.webapp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.CartDAO;
import com.mycompany.webapp.dao.ProductDAO;
import com.mycompany.webapp.dao.StockDAO;
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
	
	public List<String> getCartOptionColor(String pid) {
		return productDAO.selectColorsByPid(pid);
	}
	
	public List<Map<String,String>> getCartOptionSize(String pid, String colorCode) {
		String pdId = pid + "_" + colorCode;
		return stockDAO.selectSizeIsStockedByPdid(pdId);
	}

}
