package com.mycompany.webapp.security;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class MemberLoginFailureHandler  
	implements AuthenticationFailureHandler{
	private static final Logger logger = 
			LoggerFactory.getLogger(AuthenticationFailureHandler.class);

	@Override
	public void onAuthenticationFailure(
			HttpServletRequest request, 
			HttpServletResponse response,
			AuthenticationException exception) 
			throws IOException, ServletException {
		logger.info("실행");
		if (exception instanceof AuthenticationServiceException) {
			request.setAttribute("loginFailMsg", "존재하지 않는 사용자입니다.");
		
		} else if(exception instanceof BadCredentialsException) {
			request.setAttribute("loginFailMsg", "아이디 또는 비밀번호가 틀립니다.");
			
		} else if(exception instanceof DisabledException) {
			request.setAttribute("loginFailMsg", "비활성화된 계정입니다..");
			
		}
		
		// 로그인 페이지로 다시 포워딩
		RequestDispatcher dispatcher = request.getRequestDispatcher("/member/loginForm");
		dispatcher.forward(request, response);
	}
}


