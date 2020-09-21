package com.xiaoyu.car4s.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.xiaoyu.car4s.entity.Role;

public interface RoleMapper {
	
	@Select("select * from t_4s_role where del_flag=1")
	List<Role> all();
}
