package com.mycompany.webapp.service.coupon;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

import com.mycompany.webapp.dao.coupon.CouponDAO;
import com.mycompany.webapp.dao.coupon.CouponDetailDAO;
import com.mycompany.webapp.dao.order.MOrderDAO;
import com.mycompany.webapp.dto.coupon.CouponDTO;
import com.mycompany.webapp.dto.coupon.CouponDetailDTO;
import com.mycompany.webapp.exception.CouponException;

@Service
public class CouponService {
	
	public enum CouponResult{
		SUCCESS,
		SUCCESS_EXPIRE,
		FAIL,
		FAIL_DUPLICATE,
		FAIL_NOT_ENOUGH_COUPON,
		FAIl_END_EVENT,
		FAIL_QUALIFICATION
	}
	
	@Resource private CouponDAO couponDAO;
	@Resource private MOrderDAO morderDAO;
	@Resource private CouponDetailDAO couponDetailDAO;
	@Resource private TransactionTemplate transactionTemplate;
	
	public List<CouponDTO> getCouponList(int couponType){
		return couponDAO.selectCouponListByCouponType(couponType);
	}
	
	@Transactional
	public CouponResult issueCoupon(CouponDTO couponDTO){
		CouponDTO memberCoupon = couponDetailDAO.selectCouponDetailByCoupon(couponDTO);
		if(memberCoupon != null) {
			return CouponResult.FAIL_DUPLICATE;
		}
		CouponDTO couponInfo = couponDAO.selectCouponById(couponDTO.getCouponNo());
		if(couponInfo.getRemainAmount() <= 0) {
			return CouponResult.FAIL_NOT_ENOUGH_COUPON;
		} 
		if(couponInfo.getTitle().equals("첫 구매 응원")) {
			if(morderDAO.selectOrderCountByMid(couponDTO.getMemberId()) > 0) {
				return CouponResult.FAIL_QUALIFICATION;
			}
		}
		
		//쿠폰 발급 로직
		//쿠폰 이벤트의 종료 기한 확인
		Date nowDate = new Date();
		if(nowDate.after(couponInfo.getExpireDate())) {
			return CouponResult.FAIl_END_EVENT;
		}
		
		if(couponInfo.getValidity() == 0) {
			//쿠폰 자체의 만료기한이 없는 경우
			couponDetailDAO.insertCouponDetailNoValidity(couponDTO);
			couponDAO.reduceRemainById(couponDTO.getCouponNo());
			return CouponResult.SUCCESS;
		} else {
			//couponDTO.expireDate = 현재날짜 + validity
			Calendar cal = Calendar.getInstance();
			cal.setTime(nowDate);
			cal.add(Calendar.DATE, couponInfo.getValidity()); 
			couponDTO.setExpireDate(cal.getTime());

			couponDetailDAO.insertCouponDetail(couponDTO);
			couponDAO.reduceRemainById(couponDTO.getCouponNo());
			return CouponResult.SUCCESS_EXPIRE;
		}
	}
	
	public List<CouponDTO> getAvaliableCouponList(Map<String, Object> param, int price, String brand, Map<String, Boolean> usedCouponMap){
		param.put("price", price);
		List<CouponDTO> totalCouponList = couponDAO.selectAvailableCouponListByMemberId(param);
		List<CouponDTO> availableCouponList = new ArrayList<>();
		
		for(CouponDTO coupon : totalCouponList) {
			if(usedCouponMap.containsKey(coupon.getCouponNo())) // 이미 사용된 쿠폰
				continue;
			if(coupon.getCouponType() == 1) { // 브랜드 쿠폰
				if(coupon.getTitle().equals(brand)) {
					availableCouponList.add(coupon);
					continue;
				}
			}else {
				availableCouponList.add(coupon);
			}
		}
		
		Iterator<CouponDTO> iterator = availableCouponList.iterator(); 
		while(iterator.hasNext()) {
			CouponDTO coupon = iterator.next();
			if(coupon.getDiscountType().equals("1")) { // 할인타입이 %인 경우
				coupon.setTotalDiscountPrice((int) (price*((double)coupon.getDiscount()/100)));
			}else { // 할인 타입이 원인 경우
				coupon.setTotalDiscountPrice(coupon.getDiscount()*10000);
			}
		}
		java.util.Collections.sort(availableCouponList);
		
		return availableCouponList;
	}
	
	public Map<String,String> issueCoupon(String memberId, String couponNo) {
		
		Map<String,String> resultMap = new HashMap<String, String>();
		Map<String,String> result = transactionTemplate.execute(new TransactionCallback<Map<String,String> >() {
			@Override
			public Map<String,String> doInTransaction(TransactionStatus status) {
				try {
					CouponDetailDTO coupon = new CouponDetailDTO();
					coupon.setCouponNo(couponNo);
					coupon.setMemberId(memberId);
					
					int count = couponDetailDAO.selectCountByCouponDetail(coupon);
					if(count>=1) {
						throw new CouponException("이미 발급한 쿠폰입니다.");
					}

					int updateResult = couponDAO.updateCouponById(couponNo);
					if(updateResult==0) {
						throw new CouponException("쿠폰 정보 업데이트 중 오류가 발생했습니다.");
					}

					updateResult = couponDetailDAO.insertCouponDetailByCouponDetail(coupon);
					if(updateResult==0) {
						throw new CouponException("쿠폰 발급중 오류가 발생했습니다.");
					}
					resultMap.put("result","success");
					return resultMap;
				}catch (CouponException e) {
					status.setRollbackOnly();
					resultMap.put("result","fail");
					resultMap.put("message",e.getMessage());
					return resultMap;
				}catch(Exception e) {
					status.setRollbackOnly();
					resultMap.put("result","fail");
					resultMap.put("message","예상치못한 오류 발생");
					return resultMap;
				}
				
			}
		});
		return result;
	}
}