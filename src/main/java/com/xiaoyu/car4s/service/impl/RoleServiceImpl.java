package com.xiaoyu.car4s.service.impl;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xiaoyu.car4s.entity.Role;
import com.xiaoyu.car4s.mapper.RoleMapper;
import com.xiaoyu.car4s.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService{
	
	@Autowired
	private RoleMapper roleMapper;
	
	@Override
	public Map<String, String> all() {
		List<Role> list=roleMapper.all();
		Map<String,String> map=new LinkedHashMap<String, String>();
		for (Role role : list) {
			map.put(role.getId().toString(),role.getName());
		}
		return map;
	}

}
