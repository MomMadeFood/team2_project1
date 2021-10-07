package com.mycompany.webapp.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.PointDTO;

@Mapper
public interface PointDAO {
	public int insertPoint(PointDTO pointDTO);
	
	public int selectCounts();
}
