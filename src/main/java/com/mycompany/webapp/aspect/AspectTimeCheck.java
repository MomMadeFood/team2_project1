package com.mycompany.webapp.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class AspectTimeCheck {
	private static final Logger logger = LoggerFactory.getLogger(AspectTimeCheck.class);
	
	@Around("execution(public * com.mycompany.webapp.controller.*.runtimeCheck*(..))")
	public Object runtimeCheckAdvice(ProceedingJoinPoint joinPoint) {
		//----------------------------
		long start = System.nanoTime();
		//----------------------------
		Object result = null;
		try {
			result = joinPoint.proceed();
		} catch (Throwable e) {
			e.printStackTrace();
		}
		//----------------------------
		long end =  System.nanoTime();
		long howLong = end - start;
		logger.info("실행시간 : " + howLong);
		//----------------------------
		return result;
	}
}
