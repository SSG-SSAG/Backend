package com.shinsegae.ssgssag.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class CommonInterceptor extends HandlerInterceptorAdapter {
	
	protected Log log = LogFactory.getLog(CommonInterceptor.class);

	// 전처리(preHandle): 클라이언트에서 컨트롤러로 보내는 요청 가로채기
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 전처리기 컨트롤러 시작 알려주기
		if (log.isDebugEnabled()) {
			log.debug("------------ START ------------");
			log.debug("Request URI \\t:  \" + request.getRequestURI()"); // 현재 호출 중인 URL
		}
		return super.preHandle(request, response, handler);
	}

	// 후처리(postHandle): 컨트롤러에서 클라이언트로 보내는 요청 가로채기
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// 후처리기 컨트롤러 종료 알려주기
		if (log.isDebugEnabled()) {
			log.debug("------------ END ------------");
		}
		super.postHandle(request, response, handler, modelAndView);
	}
	
}
