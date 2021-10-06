package com.mycompany.webapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.StockDAO;
import com.mycompany.webapp.dto.StockDTO;

@Service
public class StockService {
	@Autowired
	private StockDAO stockDAO;
	
	public List<StockDTO> getStocksByPid(String productId) {
		return stockDAO.selectStocksByPid(productId);
	}
	
	public List<StockDTO> getStocksByPdid(String productDetailId) {
		return stockDAO.selectStocksByPdid(productDetailId);
	}
	
	public int getAmountByStock(StockDTO stockDTO) {
		return stockDAO.selectAmountByStock(stockDTO);
	}

}
