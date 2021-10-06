package com.mycompany.webapp.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.CardDAO;
import com.mycompany.webapp.dto.CardDTO;

@Service
public class CardService {
	
	@Resource
	private CardDAO cardDAO;
	
	public int checkOneClickPassword(CardDTO cardDTO) {
		return cardDAO.selectCountById(cardDTO);
	}
}
