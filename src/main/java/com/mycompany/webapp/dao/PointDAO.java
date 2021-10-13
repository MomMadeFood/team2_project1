package com.mycompany.webapp.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.PointDTO;

@Mapper
public interface PointDAO {
	public int insertPoint(PointDTO pointDTO);
	
	public int selectCounts();
	
	public int selectSumById(String memberId);
	
	public int updatePoint(String orderDetailNo);
	
	public int insertRefundPoint(PointDTO pointDTO);

	public int selectCountsByOrderDetailNo(String orderDetailNo);


	
}
