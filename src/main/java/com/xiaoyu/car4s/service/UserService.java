package com.xiaoyu.car4s.service;

import java.util.List;
import java.util.Map;

import com.xiaoyu.car4s.entity.User;

public interface UserService {
	
	List<User> all();

	User findByUsername(String username);

	void register(User user);

	User picture(User user);

	List<User> findByParam(Map<String, Object> map);

	void saveUser(User user);

	User findById(Integer id);

	void updateUser(User user);

	void deleteUser(String[] ids);

}
