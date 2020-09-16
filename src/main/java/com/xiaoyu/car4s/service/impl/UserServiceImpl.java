package com.xiaoyu.car4s.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xiaoyu.car4s.entity.User;
import com.xiaoyu.car4s.mapper.UserMapper;
import com.xiaoyu.car4s.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public List<User> all() {
		List<User> list = userMapper.all();
		return list;
	}

}
