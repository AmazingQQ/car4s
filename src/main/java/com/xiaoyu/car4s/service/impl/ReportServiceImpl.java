package com.xiaoyu.car4s.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xiaoyu.car4s.mapper.ReportMapper;
import com.xiaoyu.car4s.service.ReportService;

@Service
public class ReportServiceImpl implements ReportService {

	@Autowired
	private ReportMapper reportMapper;

	@Override
	public List<Map> querySaleData(Date starDate, Date endDate) {
		return reportMapper.selectSaleData(starDate, endDate);
	}

}
