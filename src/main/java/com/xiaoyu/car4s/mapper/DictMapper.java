package com.xiaoyu.car4s.mapper;

import java.util.List;

import org.apache.ibatis.annotations.CacheNamespace;
import org.apache.ibatis.annotations.Select;

import com.xiaoyu.car4s.entity.Dict;
import com.xiaoyu.car4s.utils.RedisCache;

@CacheNamespace(implementation = RedisCache.class)
public interface DictMapper {

	@Select("select * from t_4s_dict where use_flag=1 and del_flag=1 order by dict_name,order_no")
	List<Dict> selectAllDict();

}
