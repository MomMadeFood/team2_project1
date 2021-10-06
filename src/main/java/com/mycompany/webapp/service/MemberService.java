package com.mycompany.webapp.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.CardDAO;
import com.mycompany.webapp.dao.MemberDAO;
import com.mycompany.webapp.dao.ProductDAO;
import com.mycompany.webapp.dao.VirtureAccountDAO;
import com.mycompany.webapp.dto.CardDTO;
import com.mycompany.webapp.dto.MemberDTO;
import com.mycompany.webapp.dto.VirtureAccountDTO;
import com.mycompany.webapp.dto.product.ProductDTO;

@Service
public class MemberService {

	private static final Logger logger = LoggerFactory.getLogger(MemberService.class);
	
	@Resource
	private MemberDAO memberDAO;

	@Resource
	private CardDAO cardDAO;

	@Resource
	private VirtureAccountDAO virtureAccountDAO;
	
	@Resource
	private ProductDAO productDAO;
	
	
	public Map<String,Object> getMemberOrderInfo(String memberId, List<ProductDTO> productList) {

		Map<String,Object> map = new HashMap<String, Object>();

		MemberDTO memberDTO = memberDAO.selectMemberById(memberId);
		List<CardDTO> cardList = cardDAO.selectCardsById(memberId);
		List<VirtureAccountDTO> virtureAccountList = virtureAccountDAO.selectVirtureAccounts();
		List<ProductDTO> productDetailList = new ArrayList<ProductDTO>();
		
		
		System.out.println(productList.get(0));
		for(ProductDTO productDTO :  productList) {
			productDetailList.add(productDAO.selectProductByProduct(productDTO));
		}
				

		map.put("memberDTO", memberDTO);
		map.put("cardList",cardList);
		map.put("virtureAccountList",virtureAccountList);
		map.put("productList",productDetailList);
		
		logger.info("--------------");

		return map;
	}
}