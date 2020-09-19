package com.xiaoyu.car4s.service;

import java.util.List;


import com.xiaoyu.car4s.entity.Dept;

public interface DeptService {
	
	List<Dept> all(Integer delFlag);
}
