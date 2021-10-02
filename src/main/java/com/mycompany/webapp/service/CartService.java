package com.mycompany.webapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.CartDAO;
import com.mycompany.webapp.dto.product.ProductDTO;

@Service
public class CartService {

	@Autowired
	private CartDAO cartDAO;
	
	public List<ProductDTO> getCarts(String mid) {
		List<ProductDTO> carts = cartDAO.selectCartsById(mid);
		return carts;
		
	}
	

}
