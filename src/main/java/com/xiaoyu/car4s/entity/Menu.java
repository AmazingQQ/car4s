package com.xiaoyu.car4s.entity;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Menu implements Serializable{
	private Integer id;//菜单ID(PK)
	private String name;//菜单名称
	private String url;//链接路径
	private Integer parentId;//父菜单
	private Integer mlevel;//级别(1-一级,2-二级,3-权限)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createDate;//创建日期
	private Integer useFlag;//可用标志(1-可用, 2-不可用)
	private Integer delFlag;//删除标志(1-未删,0-已删)
}
