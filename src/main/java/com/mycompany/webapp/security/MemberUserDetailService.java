package com.mycompany.webapp.security;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.MemberDAO;
import com.mycompany.webapp.dto.MemberDTO;

@Service
public class MemberUserDetailService implements UserDetailsService{

	private static final Logger logger = LoggerFactory.getLogger(MemberUserDetailService.class);
	
	@Resource
	MemberDAO memberDAO;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		MemberDTO memberDTO = memberDAO.selectMemberById(username);
		
		if(memberDTO==null) {
			throw new UsernameNotFoundException(username);
		}
		
		logger.info(memberDTO.toString());
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		authorities.add(new SimpleGrantedAuthority(memberDTO.getRole()));
		
		UserDetail userDetail = new UserDetail(memberDTO.getId(), memberDTO.getPassword(), memberDTO.getName(), memberDTO.getBirth(), memberDTO.getTel(), memberDTO.getPhone(), memberDTO.getEmail(), memberDTO.getZipcode(), memberDTO.getAddr(), memberDTO.getDetailAddr(), memberDTO.getEnabled(), memberDTO.getPoint(), memberDTO.getPayPassword(), authorities);
		
				
		return userDetail;
	}

}
