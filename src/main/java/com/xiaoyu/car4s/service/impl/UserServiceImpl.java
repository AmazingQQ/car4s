package com.xiaoyu.car4s.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xiaoyu.car4s.entity.User;
import com.xiaoyu.car4s.mapper.UserMapper;
import com.xiaoyu.car4s.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	@Override
	public List<User> all() {
		List<User> list = userMapper.all();
		return list;
	}

	@Override
	public User findByUsername(String username) {
		User user = userMapper.findByUsername(username);
		return user;
	}

	@Override
	public void register(User user) {
		userMapper.register(user);

	}

	@Override
	public User picture(User user) {
		userMapper.update(user);
		User user2 = userMapper.findByUsername(user.getUsername());
		return user2;
	}

	@Override
	public List<User> findByParam(Map<String, Object> map) {
		List<User> userList = userMapper.findByParam(map);
		return userList;
	}

	@Override
	public void saveUser(User user) {
		userMapper.insert(user);

	}

	@Override
	public User findById(Integer id) {
		User user = userMapper.findById(id);
		return user;
	}

	@Override
	public void updateUser(User user) {
		userMapper.updateUser(user);

	}

	@Override
	public void deleteUser(String[] ids) {
		userMapper.updateDelFlag(ids);

	}

}
