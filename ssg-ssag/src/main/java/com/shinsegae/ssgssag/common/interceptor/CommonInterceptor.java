package com.shinsegae.ssgssag.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class CommonInterceptor extends HandlerInterceptorAdapter {
	
	protected Log log = LogFactory.getLog(CommonInterceptor.class);

	// ��ó��(preHandle): Ŭ���̾�Ʈ���� ��Ʈ�ѷ��� ������ ��û ����ä��
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// ��ó���� ��Ʈ�ѷ� ���� �˷��ֱ�
		if (log.isDebugEnabled()) {
			log.debug("------------ START ------------");
			log.debug("Request URI \\t:  \" + request.getRequestURI()"); // ���� ȣ�� ���� URL
		}
		return super.preHandle(request, response, handler);
	}

	// ��ó��(postHandle): ��Ʈ�ѷ����� Ŭ���̾�Ʈ�� ������ ��û ����ä��
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// ��ó���� ��Ʈ�ѷ� ���� �˷��ֱ�
		if (log.isDebugEnabled()) {
			log.debug("------------ END ------------");
		}
		super.postHandle(request, response, handler, modelAndView);
	}
	
}
