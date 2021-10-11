package com.mycompany.webapp.dto;

import lombok.Data;

@Data
public class PointDTO {
	private String pointNo;
	private String memberId;
	private String name;
	private int amount;
	private String orderDetailNo;
}
