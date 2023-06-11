package com.poly.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.stereotype.Component;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@Component
public class NotFoundInterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if (handler == null) {
            // Xử lý logic khi không tìm thấy mapping
            response.sendRedirect("/page-not-found");
            return false;
        }
        return true;
	}
}
