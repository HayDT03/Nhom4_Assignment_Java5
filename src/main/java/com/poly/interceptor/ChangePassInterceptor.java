package com.poly.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class ChangePassInterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Boolean change = false;
		if(request.getSession().getAttribute("Change") != null) {
			change = (Boolean) request.getSession().getAttribute("Change");
			System.out.println("ChangePassInterceptor.preHandle() => change: "+change);
			if(!change) {
				response.sendRedirect("/account/forgot");
				return false;
			}
		}else {
			response.sendRedirect("/account/forgot");
			return false;
		}
		if(request.getSession().getAttribute("username") == null) {
			response.sendRedirect("/account/forgot");
			return false;
		}
		return true;
	}
}
