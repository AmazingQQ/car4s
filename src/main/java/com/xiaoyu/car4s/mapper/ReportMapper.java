package com.xiaoyu.car4s.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.CacheNamespace;
import org.apache.ibatis.annotations.Param;

import com.xiaoyu.car4s.utils.RedisCache;

@CacheNamespace(implementation = RedisCache.class)
public interface ReportMapper {

	List<Map> selectSaleData(@Param("sd") Date starDate, @Param("ed") Date endDate);

}
