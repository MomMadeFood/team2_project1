package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.ProductDAO;
import com.mycompany.webapp.dto.product.ProductNewDTO;

@Service
public class ProductService {
	
	@Resource
	private ProductDAO productDao;
	
	public List<ProductNewDTO> getNewProdudct(String sex) {
		return productDao.selectNewProductBySex(sex);
	}
}