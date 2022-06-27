package com.asm;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.asm.interceptors.AuthenticateInterceptor;


@Configuration
public class InterceptorConfig implements WebMvcConfigurer{
	@Autowired
	private AuthenticateInterceptor authenInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(authenInterceptor)
			.addPathPatterns("/admin/accounts/**", 
							"/admin/categories/**",
							"/admin/products/**",
							"/admin/orderDetails/**",
							"/admin/orders/**")
			.excludePathPatterns("/login", "/register");
	}

}
