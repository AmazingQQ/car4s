package com.xiaoyu.car4s.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.xiaoyu.car4s.entity.Menu;
import com.xiaoyu.car4s.service.MenuService;

@Controller
@RequestMapping("/menu")
public class MenuController {

	@Autowired
	private MenuService menuService;

	@RequestMapping("/index")
	public String haiHello(Model model, Menu menu, @RequestParam(defaultValue = "1") Integer currentPage,
			@RequestParam(defaultValue = "5") Integer pageSize) {
		Map<String, Object> map = new HashMap<>();
		map.put("name", menu.getName());
		map.put("parentId", menu.getParentId());
		map.put("mlevel", menu.getMlevel());
		map.put("useFlag", menu.getUseFlag());

		System.out.println("===========" + menu);

		Map<String, String> menuMap = menuService.findParntId();
		model.addAttribute("menuMap", menuMap);

		Page<Menu> page = PageHelper.startPage(currentPage, pageSize);
		menuService.menuAll(map);
		model.addAttribute("page", page.toPageInfo());
		return "menu/list";
	}

	@RequestMapping("/add")
	public String add(Model model) {
		Map<String, String> menuMap = menuService.findParntId();
		model.addAttribute("menuMap", menuMap);
		return "menu/add";
	}

	@RequestMapping("/save")
	public String saveMenu(Menu menu) {
		menu.setDelFlag(1);
		menuService.saveMenu(menu);
		return "redirect:/menu/index";
	}

	@GetMapping("/edit")
	public String editRole(Model model, Integer id) {
		Menu menu = menuService.findById(id);
		model.addAttribute("menu", menu);
		
		Map<String, String> menuMap = menuService.findParntId();
		model.addAttribute("menuMap", menuMap);
		return "menu/edit";
	}

	@PostMapping("/edit")
	public String saveUpdate(Menu menu) {
		menuService.updateMenu(menu);
		return "redirect:/menu/index";
	}

	@RequestMapping("/delete")
	public String delMenu(String[] ids) {
		menuService.delete(ids);
		return "redirect:/menu/index";
	}

}
