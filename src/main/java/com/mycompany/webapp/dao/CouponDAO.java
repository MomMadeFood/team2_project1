package com.mycompany.webapp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.CouponDTO;

@Mapper
public interface CouponDAO {
	public List<CouponDTO> selectCouponListByCouponType(int couponType);
	
	public List<CouponDTO> selectAvailableCouponListByMemberId(Map<String, Object> param);
}