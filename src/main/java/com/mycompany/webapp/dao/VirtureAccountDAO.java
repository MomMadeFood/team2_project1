package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.VirtureAccountDTO;

@Mapper
public interface VirtureAccountDAO {
	public List<VirtureAccountDTO> selectVirtureAccounts();
}
