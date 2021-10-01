package com.mycompany.webapp.dto;

import java.util.Date;

import lombok.Data;

@Data
public class CardDTO {
	private String cardNo;
	private String memberId;
	private String company;
	private Date expireDate;
	private String payPassword;
	private String oneClick;
}
