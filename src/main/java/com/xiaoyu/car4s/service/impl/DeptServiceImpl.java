package com.xiaoyu.car4s.service.impl;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xiaoyu.car4s.entity.Dept;
import com.xiaoyu.car4s.mapper.DeptMapper;
import com.xiaoyu.car4s.service.DeptService;

@Service
public class DeptServiceImpl implements DeptService {

	@Autowired
	private DeptMapper deptMapper;

	@Override
	public Map<String, String> all() {
		List<Dept> list = deptMapper.all();
		Map<String, String> map = new LinkedHashMap<String, String>();
		for (Dept dept : list) {
			map.put(dept.getId().toString(), dept.getName());
		}
		return map;
	}

}
