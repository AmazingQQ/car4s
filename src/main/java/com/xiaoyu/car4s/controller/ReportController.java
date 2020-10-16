package com.xiaoyu.car4s.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xiaoyu.car4s.entity.ReportData;
import com.xiaoyu.car4s.service.ReportService;

@Component
@RequestMapping("/report")
public class ReportController {

	@Autowired
	private ReportService reportService;

	@RequestMapping("/sale")
	public String sale() {
		return "report/sale";
	}

	@ResponseBody
	@RequestMapping("/loadSaleData")
	public Object loadSaleData() {
		ReportData rd=new ReportData();

		try {
			Calendar cal=Calendar.getInstance();
			cal.set(Calendar.DATE,1);
			cal.set(Calendar.HOUR_OF_DAY,0);
			cal.set(Calendar.MINUTE,0);
			cal.set(Calendar.SECOND,0);
			cal.set(Calendar.MILLISECOND,0);
			
			Date endDate=cal.getTime();//本月的第一天
			cal.add(Calendar.MONTH,-20);
			
			Date starDate= cal.getTime();//6个月前的第一天
			
			List<Map> reportData=reportService.querySaleData(starDate,endDate);
			
			System.out.println("**********************"+reportData);
			
			List<Object> labels=new ArrayList<Object>();
			List<Object> data=new ArrayList<Object>();
			
			for (Map map : reportData) {
				labels.add(map.get("ym"));
				data.add(map.get("total"));
			}
			
			rd.setSuccess(true);
			rd.setLabels(labels);
			rd.setData(data);
		}catch (Exception e) {
			rd.setSuccess(false);
		}
		return rd;
	}
}
