package com.mycompany.webapp.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Member {
	private String id;
	private String password;
	private String name;
	private Date birth;
	private String tel;
	private String phone;
	private String email;
	private String zipcode;
	private String addr;
	private String detailAddr;
	private int enabled;
	private String role;
}
