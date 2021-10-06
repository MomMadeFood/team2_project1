package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.CardDTO;

@Mapper
public interface CardDAO {
	public List<CardDTO> selectCardsById(String memberId);
	public int selectCountById(CardDTO cardDTO);
}
