/*package com.groupware.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.groupware.dto.Employee;

@WebFilter(filterName="AuthFilter", urlPatterns="*.action")
public class AuthFilter implements Filter{
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain chain) throws IOException, ServletException {

		//인증제어 (권한 없는 사용자가 컨텐츠에 접근할 수 없도록 제어)
		HttpServletRequest req = (HttpServletRequest)arg0;
		HttpServletResponse resp = (HttpServletResponse) arg1;
		
		String url = req.getRequestURI();
		String queryString =req.getQueryString();
		if (url.contains("?")) {
			//http://domain/appname/path.action?name=value&name2=value
			//-> url : http://domain/appname/path.action,
			//-> queryString : name=value&name2=value
			queryString = url.substring(url.indexOf("?") + 1);
			url = url.substring(0, url.indexOf("?"));
		}
		System.out.println(url);
		
		Employee employee = (Employee)req.getSession().getAttribute("loginuser");
		
		//if (url.equals("/"))
		
				
		if (url.contains(".action")) {
			if (url.contains("/admin")){		
				if (employee == null || !(employee.getPositionNo().equals("12"))) {
					resp.sendRedirect("/groupware/login/loginform.action?returnurl=" + url); 
					return;
				}
			}
			else if (url.contains("/organization") || url.contains("/attendance/")){
				if (employee == null) {
					resp.sendRedirect("/groupware/login/loginform.action?returnurl=" + url); 
					return;
				}
			}
			else if (url.contains("/board") ){
				if (employee == null) {
					resp.sendRedirect("/groupware/login/loginform.action?returnurl=" + url+"&"+queryString); 
					return;
				}
			}else if (url.contains("/home") ){
				if (employee == null) {
					resp.sendRedirect("/groupware/login/loginform.action?returnurl=" + url); 
					return;
				}
			}
		
	}
		
		chain.doFilter(arg0, arg1);
	}
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
}
*/