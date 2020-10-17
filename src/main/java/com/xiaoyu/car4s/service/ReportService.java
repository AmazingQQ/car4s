package com.xiaoyu.car4s.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface ReportService {

	List<Map> querySaleData(Date starDate, Date endDate);

}
