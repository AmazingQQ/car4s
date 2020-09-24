package com.xiaoyu.car4s.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xiaoyu.car4s.entity.Menu;
import com.xiaoyu.car4s.mapper.MenuMapper;
import com.xiaoyu.car4s.service.MenuService;

@Service
public class MenuServiceImpl implements MenuService{
	
	@Autowired
	private MenuMapper menuMapper;
	
	

	@Override
	public List<Menu> menuAll(Map<String, Object> map) {
		return menuMapper.menuAll(map);
	}



	@Override
	public void saveMenu(Menu menu) {
		menuMapper.save(menu);
	}



	@Override
	public Menu findById(Integer id) {
		return menuMapper.findMenu(id);
	}



	@Override
	public void updateMenu(Menu menu) {
		menuMapper.update(menu);
	}



	@Override
	public void delete(String[] ids) {
		menuMapper.deleteMenu(ids);
	}



	@Override
	public Map<String, String> findParntId() {
		List<Menu> list = menuMapper.menuParent();
		Map<String,String> map = new HashMap<String,String>();
		for (Menu menu : list) {
			map.put(menu.getId().toString(),menu.getName());
		}
		return map;
	}

}
