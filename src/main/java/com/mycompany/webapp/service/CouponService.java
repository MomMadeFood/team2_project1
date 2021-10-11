package com.mycompany.webapp.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mycompany.webapp.dao.CouponDAO;
import com.mycompany.webapp.dao.CouponDetailDAO;
import com.mycompany.webapp.dto.CouponDTO;

@Service
public class CouponService {
	
	public enum CouponResult{
		SUCCESS,
		SUCCESS_EXPIRE,
		FAIL,
		FAIL_DUPLICATE,
		FAIL_NOT_ENOUGH_COUPON,
		FAIl_END_EVENT
	}
	
	@Resource
	private CouponDAO couponDAO;
	@Resource private CouponDetailDAO couponDetailDAO;
	
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
		} else {
			//쿠폰 발급 로직
			//쿠폰 이벤트의 종료 기한 확인
			Date nowDate = new Date();
			if(nowDate.after(couponInfo.getExpireDate())) {
				return CouponResult.FAIl_END_EVENT;
			} else {
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
	
	public JsonNode issueEventCoupon(String couponNo, String memberId) {
		HttpClient client = HttpClientBuilder.create().build(); // HttpClient 생성
		HttpPost httpPost = new HttpPost("http://192.168.1.252:8080//issueEventCoupon"); // POST 메소드 URL 새성
		try {
			httpPost.setHeader("Accept", "application/json");
			httpPost.setHeader("Connection", "keep-alive");
			httpPost.setHeader("Content-Type", "application/json");

			// json 메시지 입력
			httpPost.setEntity(new StringEntity("{\"couponNo\":\"" + couponNo + "\",\"memberId\":\"" + memberId + "\"}"));

			HttpResponse response = client.execute(httpPost);
			// Response 출력
			if (response.getStatusLine().getStatusCode() == 200) {
				ResponseHandler<String> handler = new BasicResponseHandler();
				String body = handler.handleResponse(response);
				
				ObjectMapper objectMapper = new ObjectMapper();
				JsonNode node = objectMapper.readTree(body);
				return node;
			} else {
				System.out.println("response is error : " + response.getStatusLine().getStatusCode());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
}

	