package com.xiaoyu.car4s.utils;

import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ServletContextAware;

import com.xiaoyu.car4s.service.DictService;

/**
 * 系统初始化类
 * 1.将ContextPath放到名为ctx的变量中
 * @author Administrator
 *
 */
@Component
public class SystemInitHelper implements InitializingBean,ServletContextAware{
	
	private ServletContext servletContext;
	@Autowired
	private DictService dictService; 
	
	@Override
	public void afterPropertiesSet() throws Exception {
		System.out.println("+++=================系统启动中......");
		servletContext.setAttribute("ctx", servletContext.getContextPath());
		
		System.out.println("+++=================正在加载字典数据......");
		
		Map<String,Map<String,String>> dictMap =dictService.getDictMap();
		servletContext.setAttribute("dictMap", dictMap);
	}


	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext=servletContext;
		
	}
	
	
	@Autowired
	public void setRedisTemplate(RedisTemplate<String,Object> redisTemplate) {
		RedisCache.setRedisTemplate(redisTemplate);
	}

}
