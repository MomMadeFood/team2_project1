package com.mycompany.webapp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.CardDAO;
import com.mycompany.webapp.dao.MemberDAO;
import com.mycompany.webapp.dao.VirtureAccountDAO;
import com.mycompany.webapp.dto.CardDTO;
import com.mycompany.webapp.dto.MemberDTO;
import com.mycompany.webapp.dto.VirtureAccountDTO;

@Service
public class MemberService {

	@Resource
	private MemberDAO memberDAO;

	@Resource
	private CardDAO cardDAO;

	@Resource
	private VirtureAccountDAO virtureAccountDAO;
	
	
	public Map<String,Object> getMemberInfo(String memberId) {

		Map<String,Object> map = new HashMap<String, Object>();

		MemberDTO memberDTO = memberDAO.selectMemberById(memberId);
		List<CardDTO> cardList = cardDAO.selectCardsById(memberId);
		List<VirtureAccountDTO> virtureAccountList = virtureAccountDAO.selectVirtureAccounts();

		map.put("memberDTO", memberDTO);
		map.put("cardList",cardList);
		map.put("virtureAccountList",virtureAccountList);

		return map;
	}
}