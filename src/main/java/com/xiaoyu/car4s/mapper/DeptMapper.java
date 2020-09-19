package com.xiaoyu.car4s.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.xiaoyu.car4s.entity.Dept;

public interface DeptMapper {
	
	@Select("select * from t_4s_dept where del_flag=#{delFlag}")
	List<Dept> all(Integer delFlag);
}
