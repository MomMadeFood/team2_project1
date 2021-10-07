package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.CouponDTO;

@Mapper
public interface CouponDAO {
	public List<CouponDTO> selectCouponListByCouponType(int couponType);
	public CouponDTO selectCouponById(String couponNo);
	public void reduceRemainById(String couponNo);
}