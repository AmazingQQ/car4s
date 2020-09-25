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
public class MenuServiceImpl implements MenuService {

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
		Map<String, String> map = new HashMap<String, String>();
		for (Menu menu : list) {
			map.put(menu.getId().toString(), menu.getName());
		}
		return map;
	}

	@Override
	public List<Menu> findUndelMenu() {
		List<Menu> list = menuMapper.menuParent();
		return list;
	}

	@Override
	public List<Menu> findRootMenu4Assgin(Integer roleId) {
		List<Menu> list = findUndelMenu();// 找出所有的菜单(menu)
		// 查询这个角色已经拥有的菜单:所有ID
		List<Integer> assignedMenu = menuMapper.findAssignedMenuByRoleId(roleId);

		// 先将list转换成map,方便根据id查找菜单
		Map<Integer, Menu> map = new HashMap<Integer, Menu>();
		for (Menu menu : list) {
			// 已拥有的菜单ID,中是否包含某个菜单的ID:拿拥有的去匹配
			if (assignedMenu.contains(menu.getId())) {// 已分配的菜单设置默认勾选
				menu.setChecked(true);// 将匹配的设置为默认选中
			}
			map.put(menu.getId(), menu);// key为id value为整行数据
		}

		Menu root = new Menu();// 设定根
		root.setId(0);// 设定根id为0

		// 遍历 的Menu,将其放到父节点的children列表中
		for (Menu menu : list) {
			if (menu.getParentId() == 0) {
				root.addChild(menu);
			} else {// 排除根目录后
					// 获取当前的父节点
				Menu parent = map.get(menu.getParentId());
				parent.addChild(menu);// 将当前子节点添加到父节点中
			}

		}
		// 返回构建好的树结构数据
		return root.getChildren();

	}

	@Override
	public List<Menu> findSideMenuByUserId(Integer userId) {
		List<Menu> list = menuMapper.selectSideMenuByUserId(userId);

		// 先将list转换成map,方便根据id查找菜单
		Map<Integer, Menu> map = new HashMap<Integer, Menu>();
		for (Menu menu : list) {
			map.put(menu.getId(), menu);// key为id value为整行数据
		}

		Menu root = new Menu();// 设定根

		// 遍历 的Menu,将其放到父节点的children列表中
		for (Menu menu : list) {
			if (menu.getParentId() == 0) {
				root.addChild(menu);
			} else {// 排除根目录后
					// 获取当前的父节点
				Menu parent = map.get(menu.getParentId());
				parent.addChild(menu);// 将当前子节点添加到父节点中
			}

		}

		// 返回构建好的树结构数据
		return root.getChildren();
	}

}
