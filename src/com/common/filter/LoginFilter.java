package com.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginFilter implements Filter {

	@Override
	public void destroy() {
		System.out.println("Login过滤器销毁");
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest) request;
		HttpServletResponse resp=(HttpServletResponse)response;
		if(req.getSession().getAttribute("hospital")!=null)
		{
			
			resp.sendRedirect(req.getContextPath()+"/hospital/index.jsp");
			
			
			
		}
		else if(req.getSession().getAttribute("healthBureau")!=null)
		{
			resp.sendRedirect(req.getContextPath()+"/healthBureau/index.jsp");
		}
		else{
			
			chain.doFilter(req, resp);
		}
		
		// TODO Auto-generated method stub

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("Login过滤器开启");

	}

}
