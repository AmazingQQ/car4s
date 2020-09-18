package com.xiaoyu.car4s.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xiaoyu.car4s.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired 
	private UserService userService;
	
	
	
	@RequestMapping("/profile")
	public String profile() {
		return "user/profile";
	}
	
	@RequestMapping("/index")
	public String index() {
		return "user/list";
	}
	
}
