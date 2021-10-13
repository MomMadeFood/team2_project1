package com.mycompany.webapp.dao.coupon;

import com.mycompany.webapp.dto.coupon.CouponDTO;
import com.mycompany.webapp.dto.coupon.CouponDetailDTO;

public interface CouponDetailDAO {
	public CouponDTO selectCouponDetailByCoupon(CouponDTO couponDTO);
	public void insertCouponDetail(CouponDTO couponDTO);
	public void insertCouponDetailNoValidity(CouponDTO couponDTO);
	public int updateStateByCouponDetail(CouponDetailDTO couponDetailDTO);
	public int updateStateByOrderDetailNo(String orderDetailNo);
	int insertCouponDetailByCouponDetail(CouponDetailDTO couponDetailDTO);
	int selectCountByCouponDetail(CouponDetailDTO coupon);
}
