package com.mycompany.webapp.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Point {
	private String pointNo;
	private String memberId;
	private String name;
	private String content;
	private String type;
	private int number;
	private Date issueDate;
	private Date expireDate;
	private int state;
}
