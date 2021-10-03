package com.mycompany.webapp.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.OrderDetailDAO;
import com.mycompany.webapp.dto.MOrderDTO;
import com.mycompany.webapp.dto.OrderDetailDTO;
import com.mycompany.webapp.dto.OrderListDTO;
import com.mycompany.webapp.dto.PaymentDTO;
import com.mycompany.webapp.dto.product.ProductDTO;

@Service
public class OrderService {

	@Resource
	private OrderDetailDAO orderDetailDAO;
	
	public Map<String,Object> getOrderDetail(String orderDetailNo){
		
		Map<String,Object> orderDetailMap = new HashMap<String, Object>();
		ProductDTO productDTO = new ProductDTO();
		MOrderDTO mOrderDTO = new MOrderDTO();
		OrderDetailDTO orderDetailDTO = new OrderDetailDTO();
		
		
		Map<String,Object> productmp = orderDetailDAO.selectOrderDetailByOrderDetailNo(orderDetailNo);
		
		
		String pName = (String)productmp.get("NAME");
		//int idx = pName.indexOf("}")
		
		productDTO.setProductNo((String)productmp.get("PRODUCT_NO"));
		productDTO.setProductDetailNo((String)productmp.get("PRODUCT_DETAIL_NO"));
		productDTO.setName(pName);
		productDTO.setColorChip((String)productmp.get("COLOR_CHIP"));
		productDTO.setBrand((String)productmp.get("BRAND"));
		productDTO.setImg1((String)productmp.get("IMG1"));
		
		mOrderDTO.setOrderNo((String)productmp.get("ORDER_NO"));
		mOrderDTO.setMemberId((String)productmp.get("MEMBER_ID"));
		mOrderDTO.setOrderDate((Date)productmp.get("ORDER_DATE"));
		mOrderDTO.setAddr((String)productmp.get("ADDR"));
		mOrderDTO.setDetailAddr((String)productmp.get("DETAIL_ADDR"));
		mOrderDTO.setTel((String)productmp.get("TEL"));
		mOrderDTO.setPhone((String)productmp.get("PHONE"));
		mOrderDTO.setRecName((String)productmp.get("REC_NAME"));
		mOrderDTO.setRequest((String)productmp.get("REQUEST"));
		
		orderDetailDTO.setPsize((String)productmp.get("PSIZE"));
		orderDetailDTO.setAmount(Integer.parseInt(String.valueOf(productmp.get("AMOUNT"))));
		orderDetailDTO.setPrice(Integer.parseInt(String.valueOf(productmp.get("PRICE"))));
		orderDetailDTO.setState(Integer.parseInt(String.valueOf(productmp.get("STATE"))));
		
		
		String orderNo = mOrderDTO.getOrderNo();
		
		List<PaymentDTO> paymentList = orderDetailDAO.selectPaymentsByOrderNo(orderNo);
		
		orderDetailMap.put("paymentList",paymentList);
		orderDetailMap.put("productDTO",productDTO);
		orderDetailMap.put("mOrderDTO",mOrderDTO);
		orderDetailMap.put("orderDetailDTO",orderDetailDTO);
		
		
		return orderDetailMap;
	} 
	public List<OrderListDTO> getOrderList(Map<String, Object> param){
		return orderDetailDAO.selectOrderListByMemberNo(param);
	}
}
