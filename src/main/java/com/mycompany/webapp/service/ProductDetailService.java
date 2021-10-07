package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.CartDAO;
import com.mycompany.webapp.dao.ProductDAO;
import com.mycompany.webapp.dao.ProductDetailDAO;
import com.mycompany.webapp.dto.product.ProductDTO;

@Service
public class ProductDetailService {

	@Resource
	private ProductDetailDAO productDetailDAO;
	
	@Resource
	private CartDAO cartDAO;
	
	@Resource
	private ProductDAO productDAO;
	
	//사이즈, 색상 제외 product detail 1004
	public List<ProductDTO> getProductDetail(String productDetailNo) {
		List<ProductDTO> productDetail = productDetailDAO.selectProductDetailById(productDetailNo);
		return productDetail;
		
	}
	
	// 사이즈, 색상 포함 product detail
	public List<ProductDTO> getProductDetailCol(String productNo) {
		List<ProductDTO> productDC = productDetailDAO.selectPdColSizeById(productNo);
		return productDC;
	
	}
	
	// 상품의 대표 이미지 가져오기
	public String getOneImgByPdId(String productDetailNo) {
		return productDetailDAO.selectOneImgByPdId(productDetailNo);
	}
	
	// with product 추천
	public List<ProductDTO> getWithproductByPdId(String productDetailNo) {
		return productDAO.selectWithProductByPdId(productDetailNo);
	}
}
