package com.mycompany.webapp.service.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.product.ProductDAO;
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
	
	public int getTotalProductListBySex(String categoryId) {
		return productDao.countProductListBySex(categoryId);
	}
	
	public List<ProductCategoryDTO> getProductListBySex(Map<String, Object> param) {
		return productDao.selectProductListBySex(param);
	}
	
	public Map<String, List<String>> getColorChip(List<ProductCategoryDTO> productList){
		
		Map<String, List<String>> productColorMap = new HashMap<>();
		
		for(ProductCategoryDTO product : productList) {
			List<ProductCategoryDTO> productColorList = productDao.selectColorListByPNo(product.getProductNo());
			for(ProductCategoryDTO productColor : productColorList) {
				if(!productColorMap.containsKey(productColor.getProductNo())) {
					List<String> colorList = new ArrayList<>();
					colorList.add(productColor.getColorChip());
					productColorMap.put(productColor.getProductNo(), colorList);
					
					System.out.println(">>>>>>>> 1 => " + productColor.getColorChip());
				}else {
					System.out.println(">>>>>>>> 2 => " + productColor.getColorChip());
					productColorMap.get(productColor.getProductNo()).add(productColor.getColorChip());
				}
			}
		}
		return productColorMap;
	}
	
}
