package com.xiaoyu.car4s.service.impl;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xiaoyu.car4s.entity.Dict;
import com.xiaoyu.car4s.mapper.DictMapper;
import com.xiaoyu.car4s.service.DictService;

@Service
public class DictServiceImpl implements DictService{
	
	@Autowired
	private DictMapper dictMapper;
	
	@Override
	public Map<String, Map<String, String>> getDictMap() {
		List<Dict> list=dictMapper.selectAllDict();
		
		//把字典数据转换成Map
		Map<String,Map<String,String>> dictMap=new HashMap<String,Map<String,String>>();
		for (Dict dict : list) {
			Map<String,String> map=dictMap.get(dict.getDictName());
			if (map ==null) {
				map=new LinkedHashMap<String, String>();//有序的,安放进来的顺序放
				map.put(dict.getDkey(),dict.getDval());
				dictMap.put(dict.getDictName(), map);
			}else {
				map.put(dict.getDkey(),dict.getDval());
			}
		}
		return dictMap;
	}

}
