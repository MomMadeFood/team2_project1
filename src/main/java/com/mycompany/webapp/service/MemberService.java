package com.mycompany.webapp.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.MemberDAO;
import com.mycompany.webapp.dto.MemberDTO;

@Service
public class MemberService {
	
	@Resource
	MemberDAO memberDAO;
	
	public MemberDTO getMember(String memberId) {
		return memberDAO.selectMemberById(memberId);
	}
}
