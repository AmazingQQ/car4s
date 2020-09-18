package com.xiaoyu.car4s.controller;


import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.xiaoyu.car4s.entity.User;
import com.xiaoyu.car4s.entity.UserLoginForm;
import com.xiaoyu.car4s.service.UserService;

@Controller
public class IndexController {
	
	@Autowired 
	private UserService userService;
	
	
	
	@RequestMapping("/index")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/main")
	public String main() {
		return "main";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();//销毁session
		return "redirect:/login";
	}
	
	@RequestMapping("/doLogin")
	public String doLogin(@Valid @ModelAttribute("userLoginForm") UserLoginForm userForm,BindingResult br,RedirectAttributes attr,HttpSession session ) {
		if(br.hasErrors()) {
//			List<FieldError> list=br.getFieldErrors();
//			for (FieldError error : list) {
//				System.out.println("============"+error.getDefaultMessage());
//			}
			return "login";
		}
		
		User user=userService.findByUsername(userForm.getUsername());
		if(user !=null) {
			if(user.getPassword().equals(userForm.getPassword())) {
				System.out.println("登陆成功!!");
				session.setAttribute("loginUser", user);
				return "redirect:/index";
			}else {
				attr.addFlashAttribute("msg","密码错误!");
				return "redirect:/login";
			} 
		}else {
			System.out.println("登录失败!");
			attr.addFlashAttribute("msg2","用户名错误!");
			return "redirect:/login";
		}
	}
	
	@RequestMapping("/register")
	public String register() {
		return "register";
	}
	
	@RequestMapping("/doRegister")
	public String doRegister(User user) {
		userService.register(user);
		return "redirect:/login";
	}
	
	@RequestMapping("/ajaxCheckUsername")
	@ResponseBody
	public Object ajaxCheckUsername(String username) {
		User user=userService.findByUsername(username);
		return user == null;
	}
	
	
}
