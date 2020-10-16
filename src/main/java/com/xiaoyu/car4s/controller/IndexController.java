package com.xiaoyu.car4s.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xiaoyu.car4s.entity.Menu;
import com.xiaoyu.car4s.entity.User;
import com.xiaoyu.car4s.service.MenuService;
import com.xiaoyu.car4s.service.UserService;

@Controller
public class IndexController {

	@Autowired
	private UserService userService;

	@Autowired
	private MenuService menuService;

	@RequestMapping("/index")
	public String index(HttpSession session, Model model) {
		//User user = (User) session.getAttribute("loginUser");
		
		//拿到登录的主体
		Subject subject= SecurityUtils.getSubject();
		User user= (User) subject.getPrincipal();
		
		List<Menu> sideMenu = menuService.findSideMenuByUserId(user.getId());
		model.addAttribute("sideMenu",sideMenu);
		return "index";
	}

	@RequestMapping("/main")
	public String main() {
		return "main";
	}

	@GetMapping("/login")
	public String login() {
		return "login";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();// 销毁session
		return "redirect:/login";
	}
	
	
	/* 
	 * 登录的路径/login正好和shiro配置的loginUrl一致 ,shiro会自动获取用户名和密码进行登录验证
	 * 用户和密码提交的参数名必须叫username和password
	 * 如果认证失败,结果放到request的属性中
	 */
	@PostMapping("/login")
	public String doLogin(HttpServletRequest req) {
		
		String exceptionClassName = (String)req.getAttribute("shiroLoginFailure");

	    if(exceptionClassName != null) {
	        req.setAttribute("msg", "用户名/密码错误");
	        return "login";
	        
	    }
	    
		return "redirect:/index";
		
		
		
		/*
		(@Valid @ModelAttribute("userLoginForm") UserLoginForm userForm, BindingResult br,
			RedirectAttributes attr, HttpSession session)
		if (br.hasErrors()) {
//			List<FieldError> list=br.getFieldErrors();
//			for (FieldError error : list) {
//				System.out.println("============"+error.getDefaultMessage());
//			}
			return "login";
		}

		User user = userService.findByUsername(userForm.getUsername());
		if (user != null) {
			if (user.getPassword().equals(userForm.getPassword())) {
				System.out.println("登陆成功!!");
				session.setAttribute("loginUser", user);
				return "redirect:/index";
			} else {
				attr.addFlashAttribute("msg", "密码错误!");
				return "redirect:/login";
			}
		} else {
			System.out.println("登录失败!");
			attr.addFlashAttribute("msg2", "用户名错误!");
			return "redirect:/login";
		}*/
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
		User user = userService.findByUsername(username);
		return user == null;
	}

}
