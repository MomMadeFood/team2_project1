package com.mycompany.webapp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.CouponDTO;
import com.mycompany.webapp.dto.CouponDetailDTO;

@Mapper
public interface CouponDAO {
	public List<CouponDTO> selectCouponListByCouponType(int couponType);

	public List<CouponDTO> selectAvailableCouponListByMemberId(Map<String, Object> param);

	public CouponDTO selectCouponById(String couponNo);
  
	public void reduceRemainById(String couponNo);

	public int updateStateByCoupon(CouponDetailDTO couponDetailDTO);

}