package com.xiaoyu.car4s.service;

import java.util.List;
import java.util.Map;

import com.xiaoyu.car4s.entity.Menu;

public interface MenuService {

	List<Menu> menuAll(Map<String, Object> map);

	void saveMenu(Menu menu);

	Menu findById(Integer id);

	void delete(String[] ids);

	void updateMenu(Menu menu);

	Map<String, String> findParntId();

	List<Menu> findUndelMenu();

	List<Menu> findRootMenu4Assgin(Integer roleId);
	
}
