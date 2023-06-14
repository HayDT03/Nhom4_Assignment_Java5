package com.poly.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.poly.entity.User;

@Component
public class ConfirmInterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		String otp = null;
		String email = (String) request.getSession().getAttribute("email");
		
		Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("OTP")) {
                    otp = cookie.getValue();
                }
            }
        }
        System.out.println("ConfirmInterceptor.preHandle() => otp: "+otp);
		if(email == null || otp == null) {
			response.sendRedirect("/account/forgot");
			return false;
		}
		return true;
	}
}
