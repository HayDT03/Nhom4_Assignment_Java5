package com.poly.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.poly.interceptor.AdminInterceptor;
import com.poly.interceptor.AuthInterceptor;
import com.poly.interceptor.LoggerInterceptor;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer{
	@Autowired
	LoggerInterceptor logger;
	
	@Autowired
	AuthInterceptor auth;
	
	@Autowired
	AdminInterceptor admin;

	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		registry.addInterceptor(logger)
		.addPathPatterns("/**")
		.excludePathPatterns("/css/**","/image/**","/js/**");
		
		registry.addInterceptor(auth)
		.addPathPatterns("/cart","/cart/**", "/favorite","/favorite/**", "/admin", "/admin/**",  "/account/editprofile", "/account/editprofile/**", "/pay", "/pay/**", "/detail/add-to-cart/**");
		
		registry.addInterceptor(admin)
		.addPathPatterns("/admin", "/admin/**");
	}
}
