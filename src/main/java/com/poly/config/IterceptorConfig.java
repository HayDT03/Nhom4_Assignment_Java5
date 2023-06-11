package com.poly.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.poly.interceptor.AdminInterceptor;
import com.poly.interceptor.AuthInterceptor;
import com.poly.interceptor.LoggerInterceptor;
import com.poly.interceptor.NotFoundInterceptor;

@Configuration
public class IterceptorConfig implements WebMvcConfigurer{
	@Autowired
	LoggerInterceptor logger;
	
	@Autowired
	AuthInterceptor auth;
	
	@Autowired
	AdminInterceptor admin;
	
	@Autowired
	NotFoundInterceptor notFound;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		registry.addInterceptor(notFound)
		.addPathPatterns("/**")
		.excludePathPatterns("/css/**","/image/**","/js/**");
		
		registry.addInterceptor(logger)
		.addPathPatterns("/**")
		.excludePathPatterns("/css/**","/image/**","/js/**");
		
		registry.addInterceptor(auth)
		.addPathPatterns("/cart","/cart/**", "/favorite","/favorite/**", "/admin", "/admin/**",  "/account/editprofile", "/account/editprofile/**");
		
		registry.addInterceptor(admin)
		.addPathPatterns("/admin", "/admin/**");
	}
}
