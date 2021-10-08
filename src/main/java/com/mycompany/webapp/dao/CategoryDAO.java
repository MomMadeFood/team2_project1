package com.mycompany.webapp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.CategoryDTO;

@Mapper
public interface CategoryDAO {
	public List<CategoryDTO> selectChildCategorys(Map<String, String> paramMap);

}
