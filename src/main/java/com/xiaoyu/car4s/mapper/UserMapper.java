package com.xiaoyu.car4s.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.xiaoyu.car4s.entity.User;

public interface UserMapper {
	
	
	@Select("select * from t_4s_user")
	List<User> all();
	
	@Select("select * from t_4s_user where username=#{username}")
	User findByUsername(String username);
	
	@Insert("insert into t_4s_user (username,password) values(#{username},#{password})")
	void register(User user);
	
	@Update("update t_4s_user set pic=#{pic} where id=#{id}")
	void update(User user);
	
	List<User> findByParam(Map<String, Object> map);
	
	@Insert("insert into t_4s_user(dept_id,name,username,sex,birthday,entry_date,password,login_flag,apply_flag,role_id,del_flag)"
			+ "values(#{deptId},#{name},#{username},#{sex},#{birthday},#{entryDate},#{password},#{loginFlag},#{applyFlag},#{roleId},#{delFlag})")
	void insert(User user);
}
