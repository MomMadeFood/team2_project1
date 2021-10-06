package com.mycompany.webapp.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.ProductDAO;
import com.mycompany.webapp.dto.product.ProductCategoryDTO;
import com.mycompany.webapp.dto.product.ProductNewDTO;

@Service
public class ProductService {
	
	@Resource
	private ProductDAO productDao;
	
	public List<ProductNewDTO> getNewProdudct(String sex) {
		return productDao.selectNewProductBySex(sex);
	}
	
	public List<ProductNewDTO> getBestProdudct(String sex) {
		return productDao.selectBestProductBySex(sex);
	}
	
	public int getTotalProductList(String categoryId) {
		return productDao.countProductList(categoryId);
	}
	
	public List<ProductCategoryDTO> getProductList(Map<String, Object> param) {
		return productDao.selectProductListByPCId(param);
	}
	
	public int getTotalProductListBySex(String categoryId2) {
		return productDao.countProductListBySex(categoryId2);
	}
	
	public List<ProductCategoryDTO> getProductListBySex(Map<String, Object> param2) {
		return productDao.selectProductListBySex(param2);
	}
	
	public List<ProductCategoryDTO> getColorChip(Map<String, Object> param){
		return productDao.selectColorListByPCId(param);
	}
	
}
