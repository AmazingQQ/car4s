package com.xiaoyu.car4s.service;

import java.util.List;
import java.util.Map;

import com.xiaoyu.car4s.entity.Role;


public interface RoleService {
	Map<String, String> all();

	List<Role> roleAll(Map<String, Object> map);

	void saveRole(Role role);

	Role findById(Integer id);

	void updateRole(Role role);

	void delete(String[] ids);

	void assignMenuRole(Integer roleId, Integer[] menuIds);

 }
