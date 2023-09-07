package com.fork.user.common.interceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import lombok.RequiredArgsConstructor;

@Configuration
@RequiredArgsConstructor
public class WebConfig implements WebMvcConfigurer {
	private final LoginInterceptor loginInterceptor;
	private final LicenseInterceptor licenseInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(loginInterceptor).addPathPatterns("/**").excludePathPatterns("/resources/**/**", "/member/**");
		
		registry.addInterceptor(licenseInterceptor).addPathPatterns("/**").excludePathPatterns("/resources/**/**", "/common/**","/member/**", "/management/license/**");	
	}
}
