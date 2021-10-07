package com.mycompany.webapp.dao;

import com.mycompany.webapp.dto.CouponDTO;

public interface CouponDetailDAO {
	public CouponDTO selectCouponDetailByCoupon(CouponDTO couponDTO);
	public void insertCouponDetail(CouponDTO couponDTO);
	public void insertCouponDetailNoValidity(CouponDTO couponDTO);
}
