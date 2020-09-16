package com.xiaoyu.car4s.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Car4sController {
	
	@RequestMapping("/hello")
	public String haiHello() {
		return "susses";
	}
}
