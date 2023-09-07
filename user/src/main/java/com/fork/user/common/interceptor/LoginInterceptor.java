package com.fork.user.common.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.fork.user.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws IOException {

		HttpSession session = req.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		session.removeAttribute("loginUser");
		
		if ( loginUser != null ) {
			return true;
			
		} else {
			res.sendRedirect(req.getContextPath()+"/login.jsp");
			return false;
		}
		
	}
	
}
