package com.mycompany.webapp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.CategoryDAO;
import com.mycompany.webapp.dto.CategoryDTO;



@Service
public class CategoryService {
	
	@Resource private CategoryDAO categoryDAO;
	
	public List<CategoryDTO> getSubCategorys (String categoryId) {
		
		Map<String,String> paramMap = new HashMap<String,String>();
		paramMap.put("categoryId", categoryId);
		
		//category를 위한 로직
		if(categoryId.length() == 2) {
			//중분류 조회
			paramMap.put("opNum", "1");
		} else {
			//소분류 조회
			paramMap.put("opNum", "2");
			
			//이미 소분류이면 중분류로 조회
			if(categoryId.length() == 6) {
				paramMap.put("categoryId", categoryId.substring(0, 4)); 
			}
		}
		
		return categoryDAO.selectChildCategorys(paramMap);
	}
}
