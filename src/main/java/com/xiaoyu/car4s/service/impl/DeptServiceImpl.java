package com.xiaoyu.car4s.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xiaoyu.car4s.entity.Dept;
import com.xiaoyu.car4s.mapper.DeptMapper;
import com.xiaoyu.car4s.service.DeptService;

@Service
public class DeptServiceImpl implements DeptService{
	
	@Autowired
	private DeptMapper deptMapper;
	
	@Override
	public List<Dept> all() {
		List<Dept> dept=deptMapper.all();
		return dept;
	}

}
