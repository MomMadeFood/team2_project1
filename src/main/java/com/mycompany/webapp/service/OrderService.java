package com.mycompany.webapp.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.controller.OrderController;
import com.mycompany.webapp.dao.MOrderDAO;
import com.mycompany.webapp.dao.OrderDetailDAO;
import com.mycompany.webapp.dao.PaymentDAO;
import com.mycompany.webapp.dao.ProductDAO;
import com.mycompany.webapp.dao.ProductDetailDAO;
import com.mycompany.webapp.dao.StockDAO;
import com.mycompany.webapp.dto.MOrderDTO;
import com.mycompany.webapp.dto.OrderDetailDTO;
import com.mycompany.webapp.dto.OrderListDTO;
import com.mycompany.webapp.dto.PaymentDTO;
import com.mycompany.webapp.dto.product.ProductDTO;

@Service
public class OrderService {

	private static final Logger logger = LoggerFactory.getLogger(OrderService.class);
	
	@Resource
	private OrderDetailDAO orderDetailDAO;
	
	@Resource
	private MOrderDAO mOrderDAO;
	
	@Resource
	private PaymentDAO paymentDAO;
	
	@Resource
	private StockDAO stockDAO;
	
	@Resource
	private ProductDAO productDAO;
	
	public enum OrderResult{
		SUCCESS,
		FAIL,
		FAIL_NOT_ENOUGH_STOCK,
	}
	
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
	

	public List<OrderListDTO> getOrderListByName(Map<String, Object> param){
		return orderDetailDAO.selectOrderListByName(param);
	}
	
	public List<OrderListDTO> getOrderListByOderNo(Map<String, Object> param){
		return orderDetailDAO.selectOrderListByOrderNo(param);
	}

	public OrderResult insertMOrder(MOrderDTO mOrderDTO) {
		//try {
			
			List<OrderDetailDTO> detailList = mOrderDTO.getDetailList();
			List<PaymentDTO> paymentList = mOrderDTO.getPaymentList();
			
			
			SimpleDateFormat format1 = new SimpleDateFormat( "yyyyMMdd");
					

			
			// 상품의 재고를 확인하는 동시에 감소시키는 로직
			logger.info("삽입 시작1");
			for(OrderDetailDTO orderDetailDTO:  detailList) {
				int updateResult = stockDAO.updateStockByODIdSize(orderDetailDTO);
				logger.info("개수: "+updateResult);
			}
			
			
			// 주문 정보를 삽입하는 코드
			int cnt = 10000000+mOrderDAO.selectMOrderCount();
			String conv = Integer.toString(cnt);
			Date time = new Date();
			String time1 = format1.format(time);
			String orderNo = time1+"P"+conv;
			System.out.println(orderNo);
			mOrderDTO.setOrderNo(orderNo);
			
			logger.info("삽입 시작2");
			mOrderDAO.insertMOrder(mOrderDTO);
			
			logger.info("----");
			
			logger.info("삽입 시작3");
			// 주문 상세정보를 삽입하는 코드 
			for(OrderDetailDTO orderDetailDTO:  detailList) {
				orderDetailDTO.setOrderNo(orderNo);
				int orderDetailInsertResult = orderDetailDAO.insertOrderDetail(orderDetailDTO);
				logger.info("개수: "+orderDetailInsertResult);
			}
			
			logger.info("삽입 시작4");
			// 결제타입을 삽입하는 코드
			for(PaymentDTO paymentDTO:  paymentList) {
				paymentDTO.setOrderNo(orderNo);
				int paymentInsertResult = paymentDAO.insertPayment(paymentDTO);
				logger.info("개수: "+paymentInsertResult);
			}
			
			

		//}catch (Exception e) {
			// TODO: handle exception
		//}
		return OrderResult.SUCCESS;
	}
	
	
	public Map<String,Object> getMOrder(String orderNo) {
		
		Map<String,Object> mp = new HashMap<String, Object>();
		List<ProductDTO> productList = new ArrayList<ProductDTO>();
		
		MOrderDTO mOrderDTO =  mOrderDAO.selectMOrderById(orderNo);
		mOrderDTO.setDetailList(orderDetailDAO.selectOrderDetailsById(orderNo));
		mOrderDTO.setPaymentList(paymentDAO.selectPaymentsById(orderNo));
		
		for(OrderDetailDTO orderDetail : mOrderDTO.getDetailList()) {
			productList.add(productDAO.selectProductById(orderDetail.getProductDetailNo()));
		}
		mp.put("mOrderDTO", mOrderDTO);
		mp.put("productList",productList);
		return mp;
	}
	
}
