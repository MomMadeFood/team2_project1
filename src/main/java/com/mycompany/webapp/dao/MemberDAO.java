package com.mycompany.webapp.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.MemberDTO;

@Mapper
public interface MemberDAO {
	
	public MemberDTO selectMemberById(String memberId);
}
