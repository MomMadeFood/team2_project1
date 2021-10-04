package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.CardDAO;
import com.mycompany.webapp.dto.CardDTO;

@Service
public class CardService {
	
	@Resource
	private CardDAO cardDAO;
	
	public List<CardDTO>getCardList(String memberId){
		return cardDAO.selectCardsById(memberId);
	}
}
