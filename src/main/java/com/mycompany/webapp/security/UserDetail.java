package com.mycompany.webapp.security;

import java.util.Date;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class UserDetail extends User{

	private String name;
	private Date birth;
	private String tel;
	private String phone;
	private String email;
	private String zipcode;
	private String addr;
	private String detailAddr;
	private int enabled;
	private int point;
	private int payPassword;
	
	
	public UserDetail( String id, String password, String name, Date birth, String tel, String phone, String email, String zipcode, String addr, String detailAddr, int enabled, int point, int payPassword, List<GrantedAuthority> mauthorities) {
		super(id,password,true,true,true,true,mauthorities);
		
		
		this.name = name;
		this.birth = birth;
		this.tel = tel;
		this.phone = phone;
		this.email = email;
		this.zipcode = zipcode;
		this.addr = addr;
		this.detailAddr = detailAddr;
		this.enabled = enabled;
		this.point = point;
		this.payPassword = payPassword;
		
	}
	
	
	public String getName() {
		return name;
	}


	public Date getBirth() {
		return birth;
	}

	public String getTel() {
		return tel;
	}


	public String getPhone() {
		return phone;
	}

	public String getEmail() {
		return email;
	}

	public String getZipcode() {
		return zipcode;
	}


	public String getAddr() {
		return addr;
	}


	public String getDetailAddr() {
		return detailAddr;
	}

	public int getEnabled() {
		return point;
	}
	
	public int getPoint() {
		return enabled;
	}

	public int getPayPassword() {
		return payPassword;
	}
			
}
