package com.xiaoyu.car4s.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.xiaoyu.car4s.entity.AjaxResult;
import com.xiaoyu.car4s.entity.Menu;
import com.xiaoyu.car4s.entity.Role;
import com.xiaoyu.car4s.service.MenuService;
import com.xiaoyu.car4s.service.RoleService;

@Controller
@RequestMapping("/role")
public class RoleController {
	
	@Autowired 
	private RoleService roleService;
	
	@Autowired
	private MenuService menuService;
	
	@RequestMapping("/index")
	public String haiHello(Model model,String name,
			@RequestParam(defaultValue = "1") Integer currentPage,
			@RequestParam(defaultValue = "5") Integer pageSize) {
		Map<String,Object> map = new HashMap<>();
		map.put("name", name);
		Page<Role> page = PageHelper.startPage(currentPage, pageSize);
		roleService.roleAll(map);
		model.addAttribute("page",page.toPageInfo());
		return "role/list";
	}
	
	@RequestMapping("/add")
	public String add() {
		return "role/add";
	}
	
	@RequestMapping("/save")
	public String saveRole(Role role) {
		role.setDelFlag(1);
		roleService.saveRole(role);
		return "redirect:/role/index";
	}
	
	@GetMapping("/edit")
	public String editRole(Model model,Integer id) {
		Role role = roleService.findById(id);
		model.addAttribute("role",role);
		return "role/edit";
	}
	
	@PostMapping("/edit")
	public String saveUpdate(Role role) {
		roleService.updateRole(role);
		return "redirect:/role/index";
	}
	
	@RequestMapping("/delete")
	public String delRole(String[] ids) {
		roleService.delete(ids);
		return "redirect:/role/index";
	}
	
	@RequestMapping("/assign")
	public String assign(Integer id,Model model) {
		Role role = roleService.findById(id);
		model.addAttribute("role",role);
		return "role/assign";
	}
	
	@RequestMapping("/loadMenu")
	@ResponseBody
	public Object loadMenu(Integer roleId) {
//		List<Menu> list=menuService.findUndelMenu();
		List<Menu> list=menuService.findRootMenu4Assgin(roleId);
		return list;
	}
	
	@RequestMapping("/doAssign")
	@ResponseBody
	public Object doAssign(Integer roleId,Integer[] menuIds) {
		AjaxResult result = new AjaxResult();
		try {
			roleService.assignMenuRole(roleId,menuIds);
			result.setSuccess(true);
		}catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		return result;
	}
	
	
}
