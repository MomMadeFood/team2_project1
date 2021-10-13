package com.mycompany.webapp.dao.product;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

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
	public ProductDTO selectProductByProduct(ProductDTO productDTO);

  	// -- productList
	// 전체 상품 목록 수 count
	public int countProductList(String categoryId);
	
	//	부모 카테고리 id로 상품 번호 조회 한 것을 페이지 별로
	public List<ProductCategoryDTO> selectProductListByPCId(Map<String, Object> param);
	
	//	제품 번호로 컬러 종류 조회
	public List<ProductCategoryDTO> selectColorListByPNo(String productNo);
	
	// productList 남자 혹은 여자 일 때
	// 전체 상품 목록 수 count
	public int countProductListBySex(String categoryId);
	
	//부모 카테고리가 남자 혹은 여자일 때 페이지 조회
	public List<ProductCategoryDTO> selectProductListBySex(Map<String, Object> param);

	// withproduct 조회
	public List<ProductDTO> selectWithProductByPdId (String productDetailNo);
	
}
