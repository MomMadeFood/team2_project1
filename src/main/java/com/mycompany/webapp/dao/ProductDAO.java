package com.mycompany.webapp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.product.ProductCategoryDTO;
import com.mycompany.webapp.dto.product.ProductColorDTO;
import com.mycompany.webapp.dto.product.ProductDTO;
import com.mycompany.webapp.dto.product.ProductNewDTO;

@Mapper
public interface ProductDAO {
	
	public List<ProductNewDTO> selectNewProductBySex(String sex);
	
	public List<ProductNewDTO> selectBestProductBySex(String sex);
	/**
	 * 제품의 색상 종류를 조회
	 * @param id
	 * @return List<String> colors
	 */
	List<String> selectColorsByPid(String id);
	
	/**
	 * 제품의 색상 종류를 조회
	 * @param id
	 * @return List<String> colors
	 */
	List<ProductColorDTO> selectColorChipByPid(String id);
	
	/**
	 * 제품 상세 조회
	 * @param productDetailNo, psize
	 * @return ProductDTO
	 */
  public ProductDTO selectProductById(ProductDTO productDTO);
	
  public List<ProductDTO> selectProductById(String productDetailNo);

	//	부모 카테고리 id로 해당하는 상품 번호 조회
	public List<ProductCategoryDTO> selectProductListByPCId(String parentCategoryId);
	

	//	부모 카테고리 id에 따른 제품 번호로 컬러 종류  조회
	public List<ProductCategoryDTO> selectColorListByPCId(Map<String, Object> param);

	// 전체 상품 목록 수 count
	public int countBoard();
	
	//	부모 카테고리 id로 상품 번호 조회 한 것을 페이지 별로
	public List<ProductCategoryDTO> selectByPage(Pager pager);
  
}

	