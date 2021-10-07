package com.mycompany.webapp.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.CouponDAO;
import com.mycompany.webapp.dto.CouponDTO;

@Service
public class CouponService {
	
	@Resource
	private CouponDAO couponDao;
	
	public List<CouponDTO> getCouponList(int couponType){
		return couponDao.selectCouponListByCouponType(couponType);
	}
	
	public List<CouponDTO> getAvaliableCouponList(Map<String, Object> param){
		return couponDao.selectAvailableCouponListByMemberId(param);
	}
}
