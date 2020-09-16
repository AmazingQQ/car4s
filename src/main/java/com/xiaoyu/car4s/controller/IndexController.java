package com.xiaoyu.car4s.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xiaoyu.car4s.entity.User;
import com.xiaoyu.car4s.service.UserService;

@Controller
public class IndexController {
	
	@Autowired 
	private UserService userService;
	
	
	
	@RequestMapping("/index")
	public String index(Model model) {
		return "index";
	}
	
	@RequestMapping("/main")
	public String main(Model model) {
		return "main";
	}
}
