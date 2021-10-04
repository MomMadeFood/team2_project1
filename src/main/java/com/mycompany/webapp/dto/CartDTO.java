package com.mycompany.webapp.dto;

import java.util.List;

import lombok.Data;

@Data
public class CartDTO {
	private String memberId;
	private String productDetailNo;
	private String psize;
	private int amount;
	
	
	private List<CartDTO> cartDTOList;
	
	public List<CartDTO> getCartDTOList() {
		return cartDTOList;
	}
	public void setCartDTOList(List<CartDTO> cartDTOList) {
		this.cartDTOList = cartDTOList;
	}
}
