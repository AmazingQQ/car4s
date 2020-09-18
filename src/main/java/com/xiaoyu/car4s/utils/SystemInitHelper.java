package com.xiaoyu.car4s.utils;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ServletContextAware;

@Component
public class SystemInitHelper implements InitializingBean,ServletContextAware{
	
	private ServletContext servletContext;
	
	
	@Override
	public void afterPropertiesSet() throws Exception {
		System.out.println("+++=================系统启动中......");
		servletContext.setAttribute("ctx", servletContext.getContextPath());
	}


	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext=servletContext;
		
	}

	

}
