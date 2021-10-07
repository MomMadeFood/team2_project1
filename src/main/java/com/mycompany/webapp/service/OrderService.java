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
import org.springframework.transaction.TransactionException;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

import com.mycompany.webapp.controller.OrderController;
import com.mycompany.webapp.dao.CardDAO;
import com.mycompany.webapp.dao.CartDAO;
import com.mycompany.webapp.dao.MOrderDAO;
import com.mycompany.webapp.dao.MemberDAO;
import com.mycompany.webapp.dao.OrderDetailDAO;
import com.mycompany.webapp.dao.PaymentDAO;
import com.mycompany.webapp.dao.PointDAO;
import com.mycompany.webapp.dao.ProductDAO;
import com.mycompany.webapp.dao.ProductDetailDAO;
import com.mycompany.webapp.dao.StockDAO;
import com.mycompany.webapp.dto.CartDTO;

import com.mycompany.webapp.dto.MOrderDTO;
import com.mycompany.webapp.dto.MemberDTO;
import com.mycompany.webapp.dto.OrderDetailDTO;
import com.mycompany.webapp.dto.OrderListDTO;
import com.mycompany.webapp.dto.PaymentDTO;
import com.mycompany.webapp.dto.PointDTO;
import com.mycompany.webapp.dto.StockDTO;
import com.mycompany.webapp.dto.product.ProductDTO;
import com.mycompany.webapp.exception.DeleteOrderException;
import com.mycompany.webapp.exception.NotEnoughtStockException;

@Service
public class OrderService {

	private static final Logger logger = LoggerFactory.getLogger(OrderService.class);
	
	@Resource
	private TransactionTemplate transactionTemplate;
	
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
	
	@Resource
	private MemberDAO memberDAO;
	
	@Resource
	private CartDAO cartDAO;
	
	@Resource
	private PointDAO pointDAO;
	
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
	
	public int getCntOrderList(Map<String, Object> param) {
		return orderDetailDAO.selectCountOrderList(param);
	}
	
	public List<OrderListDTO> getOrderList(Map<String, Object> param){
		return orderDetailDAO.selectOrderListByMemberNo(param);
	}
	
	public int getCntOrderListByName(Map<String, Object> param) {
		return orderDetailDAO.selectCountOrderListByName(param);
	}

	public List<OrderListDTO> getOrderListByName(Map<String, Object> param){
		return orderDetailDAO.selectOrderListByName(param);
	}
	
	public int getCntOrderListByOrderNo(Map<String, Object> param) {
		return orderDetailDAO.selectCountOrderListByOrderNo(param);
	}
	
	public List<OrderListDTO> getOrderListByOrderNo(Map<String, Object> param){
		return orderDetailDAO.selectOrderListByOrderNo(param);
	}

	

	public Map<String,String> insertMOrder(MOrderDTO mOrderDTO) {
		Map<String,String> resultMap = new HashMap();

		
		Map<String,String> result = transactionTemplate.execute(new TransactionCallback<Map<String,String> >() {
			@Override
			public Map<String,String> doInTransaction(TransactionStatus status) {
				try {
					List<OrderDetailDTO> detailList = mOrderDTO.getDetailList();
					List<PaymentDTO> paymentList = mOrderDTO.getPaymentList();
					
					
					SimpleDateFormat format1 = new SimpleDateFormat( "yyyyMMdd");
							

					
					// 상품의 재고를 확인하는 동시에 감소시키는 로직
					logger.info("삽입 시작1");
					for(OrderDetailDTO orderDetailDTO:  detailList) {
						ProductDTO productDTO = new ProductDTO();
						productDTO.setProductDetailNo(orderDetailDTO.getProductDetailNo());
						productDTO.setProductNo(productDTO.getProductDetailNo().substring(0, productDTO.getProductDetailNo().length()-3));
						ProductDTO product = productDAO.selectProductByProduct(productDTO);
						int updateResult = stockDAO.updateStockByODIdSize(orderDetailDTO);
						
						if(updateResult==0) {
							 logger.info(orderDetailDTO.toString());
							 throw new NotEnoughtStockException(product.getName());
						}
						
						logger.info("개수: "+updateResult);
					}
					
					
					// 주문 정보를 삽입하는 코드
					int cnt = (10000000+mOrderDAO.selectMOrderCount())%100000000;
					String conv = Integer.toString(cnt);
					Date time = new Date();
					String time1 = format1.format(time);
					String orderNo = time1+"P"+conv;
					System.out.println(orderNo);
					mOrderDTO.setOrderNo(orderNo);
					
					logger.info("삽입 시작2");
					mOrderDAO.insertMOrder(mOrderDTO);
					
					logger.info("----");
					// 현재 포인트의 개수를 구하는 것 
					int pointCnt = (10000000+pointDAO.selectCounts())%100000000;
					
					logger.info("삽입 시작3");
					// 주문 상세정보를 삽입하는 코드 
					// 상세정보를 삽입하는 동시에 카트에서 해당 정보를 삭제한다.
					// 포인트를 사용했다면 포인트 사용내역을 포인트 테이블에 삽입함
					for(OrderDetailDTO orderDetailDTO:  detailList) {
						orderDetailDTO.setOrderNo(orderNo);
						int orderDetailInsertResult = orderDetailDAO.insertOrderDetail(orderDetailDTO);
						
						if(orderDetailDTO.getDiscount()>0) {
							PointDTO pointDTO = new PointDTO();
							pointDTO.setAmount(orderDetailDTO.getDiscount());
							pointDTO.setMemberId(mOrderDTO.getMemberId());
							pointDTO.setName("사용");
							pointDTO.setOrderDetailNo(orderDetailDTO.getOrderDetailNo());
							conv = Integer.toString(pointCnt);
							String pointNo = time1+"T"+conv;
							pointDTO.setPointNo(pointNo);
							int pointResult = pointDAO.insertPoint(pointDTO);
							if(pointResult==0)
								throw new Exception();
							pointCnt++;
						}
						
						CartDTO cartDTO = new CartDTO();
						cartDTO.setMemberId(mOrderDTO.getMemberId());
						cartDTO.setProductDetailNo(orderDetailDTO.getProductDetailNo());
						cartDTO.setPsize(orderDetailDTO.getPsize());
						
						cartDAO.deleteCart(cartDTO);
						logger.info("개수: "+orderDetailInsertResult);
					}
					
					logger.info("삽입 시작4");
					
					
					
					
					// 결제타입을 삽입하는 코드 포인트를 사용했다면 사용내역을 삽입함
					for(PaymentDTO paymentDTO:  paymentList) {
						paymentDTO.setOrderNo(orderNo);
						int paymentInsertResult = paymentDAO.insertPayment(paymentDTO);
						logger.info("개수: "+paymentInsertResult);
					}
					
					// 결제가 완료됐으면 신용카드의 경우 즉시 포인트를 적립할 수 있게 함
					if(paymentList.get(0).getPaymentType().equals("신용카드")) {
						for(OrderDetailDTO orderDetailDTO:  detailList) {
							PointDTO pointDTO = new PointDTO();
							pointDTO.setAmount((int)(orderDetailDTO.getPrice()/100));
							pointDTO.setMemberId(mOrderDTO.getMemberId());
							pointDTO.setName("구매적립");
							pointDTO.setOrderDetailNo(orderDetailDTO.getOrderDetailNo());
							conv = Integer.toString(pointCnt);
							String pointNo = time1+"T"+conv;
							pointDTO.setPointNo(pointNo);
							int pointResult = pointDAO.insertPoint(pointDTO);
							if(pointResult==0)
								throw new Exception();
							pointCnt++;
						}	
					}
					
					resultMap.put("result","success");
					resultMap.put("orderNo",mOrderDTO.getOrderNo());
					return resultMap;
				}catch (NotEnoughtStockException e) {
					logger.info(e.getMessage());
					status.setRollbackOnly();
					resultMap.put("result","soldout");
					resultMap.put("productName",e.getMessage());
					return resultMap;
				}catch(Exception e) {
					status.setRollbackOnly();
					e.printStackTrace();
					resultMap.put("result","fail");
					return resultMap;
				}
				
			}
		});
		
		return result;
	}
	
	
	public Map<String,Object> getMOrder(String orderNo) {
		
		Map<String,Object> mp = new HashMap<String, Object>();
		List<ProductDTO> productList = new ArrayList<ProductDTO>();
		
		MOrderDTO mOrderDTO =  mOrderDAO.selectMOrderById(orderNo);
		mOrderDTO.setDetailList(orderDetailDAO.selectOrderDetailsById(orderNo));
		mOrderDTO.setPaymentList(paymentDAO.selectPaymentsById(orderNo));
		
		for(OrderDetailDTO orderDetail : mOrderDTO.getDetailList()) {
			ProductDTO productDTO = new ProductDTO();
			productDTO.setProductNo(orderDetail.getProductDetailNo().substring(0,orderDetail.getProductDetailNo().length()-3));
			System.out.println(orderDetail.getProductDetailNo().substring(0,orderDetail.getProductDetailNo().length()-3));
			productDTO.setProductDetailNo(orderDetail.getProductDetailNo());
			productList.add(productDAO.selectProductByProduct(productDTO));
		}
		mp.put("mOrderDTO", mOrderDTO);
		mp.put("productList",productList);
		return mp;
	}
	
	@Transactional
	public Map<String,String> deleteOrderDetail(OrderDetailDTO orderDetailDTO) {
		Map<String,String> resultMap = new HashMap<String, String>();
		try {
			orderDetailDTO.setState(6);
			StockDTO stockDTO = new StockDTO();
			
			stockDTO.setAmount(orderDetailDTO.getAmount());
			stockDTO.setProductDetailNo(orderDetailDTO.getProductDetailNo());
			stockDTO.setPsize(orderDetailDTO.getPsize());
			
			int updateResult = orderDetailDAO.updateStateByOrderDetail(orderDetailDTO);
			if(updateResult==0) {
				throw new DeleteOrderException("결재상태 변경중 오류 발생");
			}
			updateResult = stockDAO.updateAmountByStock(stockDTO);
			if(updateResult==0) {
				throw new DeleteOrderException("재고상태 변경중 오류 발생");
			}
		}catch(DeleteOrderException e) {
			resultMap.put("result","fail");
			resultMap.put("message",e.getMessage());
			return resultMap;
		}catch(Exception e){
			resultMap.put("result","fail");
			resultMap.put("message","예상치 못한 오류 발생");
			return resultMap;
		}
		resultMap.put("result","success");
		resultMap.put("message","주문이 취소되었습니다.");
		return resultMap;
	}
	
}
