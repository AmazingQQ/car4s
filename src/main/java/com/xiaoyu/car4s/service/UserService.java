package com.xiaoyu.car4s.service;

import java.util.List;

import com.xiaoyu.car4s.entity.User;

public interface UserService {
	
	List<User> all();

	User findByUsername(String username);

	void register(String username, String password);

}
