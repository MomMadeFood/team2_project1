package com.mycompany.webapp.dao.member;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.member.MemberDTO;

@Mapper
public interface MemberDAO {
	
	public MemberDTO selectMemberById(String memberId);
	
	public int updatePointById(MemberDTO memberDTO);

	public void updateCardPassword(MemberDTO memberDTO);

	public String selectPayPassworById(String id);
}
