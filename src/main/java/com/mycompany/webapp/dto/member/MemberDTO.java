package com.mycompany.webapp.dto.member;

import java.util.Date;

import lombok.Data;

@Data
public class MemberDTO {
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
	private int point;
	private String payPassword;
}
