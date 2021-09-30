package com.mycompany.webapp.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Member {
	private String Id;
	private String password;
	private Date birth;
	private String tel;
	private String phone;
	private String email;
	private String zipcode;
	private String addr;
	private String detailAddr;
}
