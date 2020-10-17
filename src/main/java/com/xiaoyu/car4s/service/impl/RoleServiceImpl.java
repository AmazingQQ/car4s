package com.xiaoyu.car4s.service.impl;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xiaoyu.car4s.entity.Role;
import com.xiaoyu.car4s.mapper.RoleMapper;
import com.xiaoyu.car4s.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleMapper roleMapper;

	@Override
	public Map<String, String> all() {
		List<Role> list = roleMapper.all();
		Map<String, String> map = new LinkedHashMap<String, String>();
		for (Role role : list) {
			map.put(role.getId().toString(), role.getName());
		}
		return map;
	}

	@Override
	public List<Role> roleAll(Map<String, Object> map) {
		return roleMapper.roleAll(map);
	}

	@Override
	public void saveRole(Role role) {
		roleMapper.save(role);
	}

	@Override
	public Role findById(Integer id) {
		return roleMapper.findRole(id);
	}

	@Override
	public void updateRole(Role role) {
		roleMapper.update(role);
	}

	@Override
	public void delete(String[] ids) {
		roleMapper.deleteRole(ids);
	}

	@Override
	@Transactional
	public void assignMenuRole(Integer roleId, Integer[] menuIds) {
		roleMapper.deleteRoleMenus(roleId);// 删除该Role已分配所有菜单
		roleMapper.insertRoleMenus(roleId, menuIds);// 按新分配的菜单插入到数据库

	}

}
