package com.mycompany.webapp.service.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.CardDAO;
import com.mycompany.webapp.dao.PointDAO;
import com.mycompany.webapp.dao.VirtureAccountDAO;
import com.mycompany.webapp.dao.member.MemberDAO;
import com.mycompany.webapp.dao.product.ProductDAO;
import com.mycompany.webapp.dto.CardDTO;
import com.mycompany.webapp.dto.VirtureAccountDTO;
import com.mycompany.webapp.dto.member.MemberDTO;
import com.mycompany.webapp.dto.product.ProductDTO;

@Service
public class MemberService {

	@Resource
	private MemberDAO memberDAO;

	@Resource
	private CardDAO cardDAO;

	@Resource
	private VirtureAccountDAO virtureAccountDAO;
	
	@Resource
	private ProductDAO productDAO;
	
	@Resource
	private PointDAO pointDAO;
	
	
	public Map<String,Object> getMemberOrderInfo(String memberId, List<ProductDTO> productList) {

		Map<String,Object> map = new HashMap<String, Object>();

		List<CardDTO> cardList = cardDAO.selectCardsById(memberId);
		List<VirtureAccountDTO> virtureAccountList = virtureAccountDAO.selectVirtureAccounts();
		List<ProductDTO> productDetailList = new ArrayList<ProductDTO>();
		int point = pointDAO.selectSumById(memberId);
		MemberDTO memberDTO = memberDAO.selectMemberById(memberId);
		memberDTO.setPoint(point);
		
		System.out.println(productList.get(0));
		for(ProductDTO productDTO :  productList) {
			productDetailList.add(productDAO.selectProductByProduct(productDTO));
		}

		map.put("cardList",cardList);
		map.put("virtureAccountList",virtureAccountList);
		map.put("productList",productDetailList);
		map.put("memberDTO",memberDTO);
		
		return map;
	}
	
	public String genCardPassword(String memberId, String password) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String scurePw = encoder.encode(password);
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId(memberId);
		memberDTO.setPayPassword(scurePw);
		memberDAO.updateCardPassword(memberDTO);
		
		return "success";
	}

	public int checkOneClickPassword(MemberDTO memberDTO) {
		
		String secuPw = memberDAO.selectPayPassworById(memberDTO.getId());
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		if(encoder.matches(memberDTO.getPayPassword(), secuPw)) {
			return 1;
		}
		else {
			return 0;
		}
	}
}