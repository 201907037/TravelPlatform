package com.tp.travely.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		if(request.getSession().getAttribute("loginUser")!=null) {
			return true;
		}else {
			
			// session에 일회성 알람 넣기
			request.getSession().setAttribute("alertMsg", "로그인 후 이용 가능합니다.");
			response.sendRedirect(request.getContextPath());
			
			return false;
		}
	}

	
}
