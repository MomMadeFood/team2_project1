package com.mycompany.webapp.dao;

import com.mycompany.webapp.dto.CouponDTO;
import com.mycompany.webapp.dto.CouponDetailDTO;

public interface CouponDetailDAO {
	public CouponDTO selectCouponDetailByCoupon(CouponDTO couponDTO);
	public void insertCouponDetail(CouponDTO couponDTO);
	public void insertCouponDetailNoValidity(CouponDTO couponDTO);
	public int updateStateByCouponDetail(CouponDetailDTO couponDetailDTO);
	public int updateStateByOrderDetailNo(String orderDetailNo);
}
