package com.xiaoyu.car4s.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.xiaoyu.car4s.entity.User;

public interface UserMapper {
	
	
	@Select("select * from t_4s_user")
	List<User> all();
}
