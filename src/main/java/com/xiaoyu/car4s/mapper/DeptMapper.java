package com.xiaoyu.car4s.mapper;

import java.util.List;

import org.apache.ibatis.annotations.CacheNamespace;
import org.apache.ibatis.annotations.Select;

import com.xiaoyu.car4s.entity.Dept;
import com.xiaoyu.car4s.utils.RedisCache;

@CacheNamespace(implementation = RedisCache.class)
public interface DeptMapper {
	
	@Select("select * from t_4s_dept where del_flag=1")
	List<Dept> all();
}
