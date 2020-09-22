package com.xiaoyu.car4s.controller;


import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.xiaoyu.car4s.entity.User;
import com.xiaoyu.car4s.service.DeptService;
import com.xiaoyu.car4s.service.RoleService;
import com.xiaoyu.car4s.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired 
	private UserService userService;
	
	@Autowired 
	private DeptService deptService;
	
	@Autowired
	private RoleService roleService;
	
	@RequestMapping("/profile")
	public String profile() {
		return "user/profile";
	}
	
	@RequestMapping("/index")
	public String index(Model model,User user,
			@DateTimeFormat(pattern = "yyyy-MM-dd") Date entryDateStart,
			@DateTimeFormat(pattern = "yyyy-MM-dd") Date entryDateEnd,
			@RequestParam(defaultValue = "1") Integer currentPage,
			@RequestParam(defaultValue = "5") Integer pageSize) {
		
		System.out.println("========="+entryDateStart);
		Map<String,Object> map = new HashMap<>();
		map.put("name", user.getName());
		map.put("username", user.getUsername());
		map.put("deptId", user.getDeptId());
		map.put("loginFlag", user.getLoginFlag());
		map.put("entryDateStart", entryDateStart);
		map.put("entryDateEnd", entryDateEnd);
		
		Map<String,String> deptmap = deptService.all();
		model.addAttribute("deptMap",deptmap);
		
		Map<String, String> roleMap = roleService.all();
		model.addAttribute("roleMap",roleMap);
		
		Page<Object> page = PageHelper.startPage(currentPage, pageSize);
		userService.findByParam(map);
		model.addAttribute("page",page.toPageInfo());
		
		return "user/list";
	}
	
	@RequestMapping("/update")
	public String submitImg(MultipartFile picFile,HttpSession session){
		System.out.println("=========="+picFile.getName());
		System.out.println("=========="+picFile.getOriginalFilename());
		System.out.println("=========="+picFile.getSize());
		System.out.println("=========="+picFile.getContentType());
		
		User user=(User) session.getAttribute("loginUser");
		
		
		String part="D:/temp/upload/";
		String name=UUID.randomUUID().toString();
		//后缀
		String suffix=picFile.getOriginalFilename().substring(picFile.getOriginalFilename().lastIndexOf("."));
		
		String filename=part+name+suffix;
		try {
			picFile.transferTo(new File(filename));
		} catch (Exception e) {
			System.out.println("保存文件失败!!");
			e.printStackTrace();
		}
		user.setPic(name+suffix);
		User user1=userService.picture(user);
		session.setAttribute("user", user1);
		
		return "redirect:/user/profile";
	}
	
	@GetMapping("/add")
	//@RequestMapping(method = RequestMethod.GET)
	public String add(Model model) {
		Map<String,String> deptmap = deptService.all();
		model.addAttribute("deptMap",deptmap);
		
		Map<String, String> roleMap = roleService.all();
		model.addAttribute("roleMap",roleMap);
		return "user/add";
	}
	
	@PostMapping("/add")
	public String save(User user) {
		//补充用户信息
		user.setPassword("123456");
		user.setApplyFlag(2);
		user.setDelFlag(1);
		
		userService.saveUser(user);
		
		return "redirect:/user/index";
	}
	
	
	@GetMapping("/edit")
	//@RequestMapping(method = RequestMethod.GET)
	public String edit(Integer id,Model model) {
		Map<String,String> deptMap = deptService.all();
		model.addAttribute("deptMap",deptMap);
		
		Map<String,String> roleMap = roleService.all();
		model.addAttribute("roleMap",roleMap);
		
		User user=userService.findById(id);
		model.addAttribute("user",user);
		
		return "user/edit";
	}
	
	@PostMapping("/edit")
	public String updateUser(User user) {
		userService.updateUser(user);
		return "redirect:/user/index";
	}
	
	@RequestMapping("/delete")
	public String delete(String[] ids) {
		userService.deleteUser(ids);
		return "redirect:/user/index";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("/ajaxCheckUsername")
	@ResponseBody
	public Object ajaxCheckUsername(String username) {
		User user=userService.findByUsername(username);
		return user == null;
	}
}
