package com.xiaoyu.car4s.entity;

import java.util.List;

import lombok.Data;

@Data
public class ReportData {
	private boolean success;
	private List<Object> labels;
	private List<Object> data;
}
