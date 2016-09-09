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

import com.common.domain.Hospital;

public class HospitalFiler implements Filter {

	@Override
	public void destroy() {
		System.out.println("Hospital过滤器销毁");

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest) request;
		HttpServletResponse resp=(HttpServletResponse)response;
		if(req.getSession().getAttribute("hospital")!=null)
		{
			chain.doFilter(req, resp);
			
			
		}
		else{
			resp.sendRedirect(req.getContextPath()+"/login.jsp");
		}
			
		// TODO Auto-generated method stub

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("Hospital过滤器开启");

	}

}
