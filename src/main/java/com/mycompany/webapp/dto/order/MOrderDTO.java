package com.mycompany.webapp.dto.order;

import java.util.Date;
import java.util.List;

import com.mycompany.webapp.dto.PaymentDTO;

import lombok.Data;

@Data
public class MOrderDTO {
	private String orderNo;
	private String memberId;
	private Date orderDate;
	private int totalOrderPrice;
	private int state;
	private String request;
	private String addr;
	private String detailAddr;
	private String zipCode;
	private String tel;
	private String phone;
	private String recName;
	List<OrderDetailDTO> detailList;
	List<PaymentDTO> paymentList;
}
