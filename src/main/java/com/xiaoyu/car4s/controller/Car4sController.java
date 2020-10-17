package com.xiaoyu.car4s.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xiaoyu.car4s.entity.User;
import com.xiaoyu.car4s.service.UserService;

//@Controller
public class Car4sController {

	@Autowired
	private UserService userService;

	@RequestMapping("/hello")
	public String haiHello(Model model) {
		List<User> list = userService.all();
		model.addAttribute("list", list);
		return "index";
	}
}
