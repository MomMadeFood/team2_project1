package com.mycompany.webapp.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Card {
	private String cardNo;
	private String memberId;
	private String company;
	private String cardPassword;
	private String cvc;
	private Date expireDate;
	private String payPassword;
}
