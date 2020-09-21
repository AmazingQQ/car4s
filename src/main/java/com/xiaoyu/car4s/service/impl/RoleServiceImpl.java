package com.xiaoyu.car4s.service.impl;

import java.util.List;

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
	public List<Role> all() {
		List<Role> role=roleMapper.all();
		return role;
	}

}
